#!/bin/bash
cd _site
git config user.email "enmasse-ci@redhat.com"
git config user.name "EnMasse CI"
git add --all
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --force origin master
