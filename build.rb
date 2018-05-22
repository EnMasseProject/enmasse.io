#!/usr/bin/env ruby
require 'fileutils'

VERSIONS=["master", "0.19.0", "0.18.0", "0.17.2"]

# Write documentation menu file
MENU_TEMPLATE="_data/menus-header.yml"
MENU_FILE="_data/menus.yml"
FileUtils.copy_file(MENU_TEMPLATE, MENU_FILE)
menus = File.open(MENU_FILE, "a")
menus.puts("docs:")
VERSIONS.each do |version|
    menus.puts("  - url: /documentation/#{version}")
    menus.puts("    title: #{version}")
    menus.puts("    identifier: #{version}")
end
menus.close()

# Copy documentation folder
ENMASSE_REPO="https://github.com/EnMasseProject/enmasse.git"
CHECKOUT_DIR="enmasse"
MASTER_TEMPLATE="master.adoc"
if not File.exists?(CHECKOUT_DIR)
    `git clone #{ENMASSE_REPO} #{CHECKOUT_DIR}`
end

VERSIONS.each do |version|
    `git -C #{CHECKOUT_DIR} checkout #{version}`
    `git -C #{CHECKOUT_DIR} pull --rebase`

    doc_dir = "#{CHECKOUT_DIR}/documentation"
    # Generate RESTAPI reference
    `java -jar utils/swagger2markup.jar convert -i #{CHECKOUT_DIR}/api-server/src/main/resources/swagger.json -f #{CHECKOUT_DIR}/documentation/common/restapi-reference.adoc`
    doc_folder = "documentation/#{version}"
    FileUtils.rm_rf(doc_folder)
    FileUtils.cp_r(doc_dir, doc_folder)

    master = "documentation/#{version}/master.adoc"
    output = "_includes/documentation/#{version}/master.html"

    `asciidoctor #{master} -o #{output} -s`

    # Generate version index.md
    index_file = "documentation/#{version}/index.md"
    index = File.open(index_file, "w")
    index.puts("---")
    index.puts("title: Documentation for EnMasse #{version}")
    index.puts("layout: documentation_main")
    index.puts("---")
    index.puts("{% include documentation/#{version}/master.html %}")
    index.close()
end
