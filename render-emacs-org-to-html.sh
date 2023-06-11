#!/bin/bash

[ "${1}" ] && FILE=${1} || FILE=index

# prepend read the docs based theme to the file if not present
#(echo "#+SETUPFILE: https://raw.githubusercontent.com/mkronvold/mkronvold.github.io/main/theme-readtheorg.setup" ; cat index.org ) > index.org

[ $(grep -c SETUPFILE ${FILE}.org) == 0 ] && (cat header.theme ${FILE}.org > ${FILE}.tmp ; mv ${FILE}.tmp ${FILE}.org)

emacs ${FILE}.org --batch -Q --load org-render-html-minimal.el -f org-html-export-to-html --kill

### I guess we can keep this just in case
#rm ${FILE}~

echo "Resultant file:"
ls -oh ${FILE}.html | awk '{$1 = ""; $2 = "";} 1'
