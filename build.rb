#!/usr/bin/env ruby
require 'fileutils'

PLATFORMS=["kubernetes", "openshift"]
VERSIONS=["master", "0.26.2", "0.25.0", "0.24.1", "0.23.2"]

LATEST_VERSION=VERSIONS[1] 
OLD_VERSIONS=VERSIONS.drop(2)
DL_PREFIX="https://github.com/EnMasseProject/enmasse/releases/tag"
docsmaster=VERSIONS[0]

# Write documentation menu file
MENU_TEMPLATE="_data/menus-header.yml"
MENU_FILE="_data/menus.yml"
FileUtils.copy_file(MENU_TEMPLATE, MENU_FILE)
menus = File.open(MENU_FILE, "a")

PLATFORMS.each do |platform|
menus.puts("#{platform}docslatest:")
    menus.puts("  - url: /documentation/#{LATEST_VERSION}/#{platform}")
    menus.puts("    title: #{LATEST_VERSION}")
    menus.puts("    identifier: #{LATEST_VERSION}-#{platform}")

    menus.puts("#{platform}docsall:")
    [docsmaster, LATEST_VERSION].each do |version|
        menus.puts("  - url: /documentation/#{version}/#{platform}")
        menus.puts("    title: #{version}")
        menus.puts("    identifier: #{version}-#{platform}")
    end

    menus.puts("#{platform}docsolder:")
    OLD_VERSIONS.each do |version|
        menus.puts("  - url: /documentation/#{version}/#{platform}")
        menus.puts("    title: #{version}")
        menus.puts("    identifier: #{version}-#{platform}")
    end
    menus.puts("#{platform}docsmaster:")
    menus.puts("  - url: /documentation/#{docsmaster}/#{platform}")
    menus.puts("    title: latest")
    menus.puts("    identifier: latest-#{platform}")
end


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
if not File.exists?(CHECKOUT_DIR)
    `git clone #{ENMASSE_REPO} #{CHECKOUT_DIR}`
end

VERSIONS.each do |version|
    puts("Generating for #{version}")
    `git -C #{CHECKOUT_DIR} checkout #{version}`
    `git -C #{CHECKOUT_DIR} pull --rebase`

    # Generate RESTAPI reference

    `make -C #{CHECKOUT_DIR}/templates clean`
    `make -C #{CHECKOUT_DIR} templates`
    if version == "0.23.2" or version == "0.24.1"
    then
        PLATFORMS.each do |platform|
            doc_folder = "documentation/#{version}/#{platform}"
            FileUtils.rm_rf(doc_folder)
            FileUtils.mkdir_p("documentation/#{version}")
            FileUtils.cp_r("#{CHECKOUT_DIR}/templates/build/enmasse-latest/docs", doc_folder)
        end
    else
        PLATFORMS.each do |platform|
            doc_folder = "documentation/#{version}/#{platform}"
            FileUtils.rm_rf(doc_folder)
            FileUtils.mkdir_p("documentation/#{version}")
            FileUtils.cp_r("#{CHECKOUT_DIR}/templates/build/enmasse-latest/docs/#{platform}", doc_folder)
        end
    end

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
