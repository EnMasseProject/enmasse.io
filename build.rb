#!/usr/bin/env ruby
require 'fileutils'

VERSIONS=["master"]
ARTICLES={
    "service_admin" => "Installation",
    "tenant" => "Managing address spaces and addresses",
    "messaging_app_developer" => "Developing applications"
}

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

    # Generate article header
    article_header = [
        "---",
        "menus:"
    ]
    ARTICLES.each do |article, title|
        url = "documentation/#{version}/#{article}"
        master = "documentation/#{version}/#{article}/master.adoc"
        output = "_includes/documentation/#{version}/#{article}.html"

        if File.file?(master)
            `asciidoctor #{master} -o #{output} -s`
            article_header.push("  - url: /#{url}")
            article_header.push("    title: #{title}")
            article_header.push("    identifier: #{article}-#{version}")
        end
    end

    # Generate article index.md
    ARTICLES.each do |article, title|
        article_index = "documentation/#{version}/#{article}/index.md"
        index = File.open(article_index, "w")
        article_header.each do |line|
            index.puts(line)
        end
        index.puts("title: #{title}")
        index.puts("parent_title: Documentation for EnMasse #{version}")
        index.puts("layout: documentation")
        index.puts("---")
        index.puts("{% include documentation/#{version}/#{article}.html %}")
        index.close()
    end

    # Generate version index.md
    index_file = "documentation/#{version}/index.md"
    index = File.open(index_file, "w")
    article_header.each do |line|
        index.puts(line)
    end
    index.puts("title: Documentation for EnMasse #{version}")
    index.puts("layout: documentation_main")
    index.puts("---")
    index.close()
end
