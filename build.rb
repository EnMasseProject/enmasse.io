#!/usr/bin/env ruby
require 'fileutils'

VERSIONS=["master", "0.16.1", "0.15.3", "0.14.0"]

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
    doc_folder = "documentation/#{version}"
    FileUtils.rm_rf(doc_folder)
    FileUtils.cp_r(doc_dir, doc_folder)

    master = "documentation/#{version}/master.adoc"
    if !File.exists?(master) then
        FileUtils.cp_r(MASTER_TEMPLATE, master)
    end
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
