#!/usr/bin/env ruby
require 'fileutils'

VERSIONS=["master", "0.21.0", "0.20.0", "0.19.0"]

LATEST_VERSION=VERSIONS[1] 
OLD_VERSIONS=VERSIONS.drop(2)
DL_PREFIX="https://github.com/EnMasseProject/enmasse/releases/tag"

# Write documentation menu file
MENU_TEMPLATE="_data/menus-header.yml"
MENU_FILE="_data/menus.yml"
FileUtils.copy_file(MENU_TEMPLATE, MENU_FILE)
menus = File.open(MENU_FILE, "a")

menus.puts("docslatest:")
menus.puts("  - url: /documentation/#{LATEST_VERSION}")
menus.puts("    title: #{LATEST_VERSION}")
menus.puts("    identifier: #{LATEST_VERSION}")

menus.puts("docsall:")
["master", LATEST_VERSION].each do |version|
    menus.puts("  - url: /documentation/#{version}")
    menus.puts("    title: #{version}")
    menus.puts("    identifier: #{version}")
end

menus.puts("docsolder:")
OLD_VERSIONS.each do |version|
    menus.puts("  - url: /documentation/#{version}")
    menus.puts("    title: #{version}")
    menus.puts("    identifier: #{version}")
end

menus.puts("docsmaster:")
menus.puts("  - url: /documentation/master")
menus.puts("    title: master")
menus.puts("    identifier: master")


menus.puts("dllatest:")
menus.puts("  - url: #{DL_PREFIX}/#{LATEST_VERSION}")
menus.puts("    title: #{LATEST_VERSION}")
menus.puts("    identifier: #{LATEST_VERSION}")

menus.puts("dlolder:")
OLD_VERSIONS.each do |version|
    menus.puts("  - url: #{DL_PREFIX}/#{version}")
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
    `java -jar utils/swagger2markup.jar convert -i #{CHECKOUT_DIR}/api-server/src/main/resources/swagger.json -f #{CHECKOUT_DIR}/documentation/common/restapi-reference`
    doc_folder = "documentation/#{version}"
    FileUtils.rm_rf(doc_folder)
    FileUtils.cp_r(doc_dir, doc_folder)

    master = "documentation/#{version}/master.adoc"
    output = "documentation/#{version}/index.html"

    `asciidoctor #{master} -o #{output}`

    # Generate version index.md
    #index_file = "documentation/#{version}/index.md"
    #index = File.open(index_file, "w")
    #index.puts("---")
    #index.puts("title: Documentation for EnMasse #{version}")
    #index.puts("layout: documentation_main")
    #index.puts("---")
    #index.puts("{% include documentation/#{version}/master.html %}")
    #index.close()
end
