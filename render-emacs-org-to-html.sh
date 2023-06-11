#!/bin/bash

[ "${1}" ] && FILE=${1} || FILE=index

# prepend read the docs based theme to the file if not present
#(echo "#+SETUPFILE: https://raw.githubusercontent.com/mkronvold/mkronvold.github.io/main/theme-readtheorg.setup" ; cat index.org ) > index.org

echo "Original org file:"
ls -oh ${FILE}.org | awk '{$1 = ""; $2 = "";} 1'

if [ $(grep -c SETUPFILE ${FILE}.org) == 0 ]; then
  mv -v ${FILE}.org ${FILE}.original
  cat header.theme ${FILE}.original > ${FILE}.org
  emacs ${FILE}.org --batch -Q --load org-render-html-minimal.el -f org-html-export-to-html --kill 2> /dev/null
  mv -v ${FILE}.original ${FILE}.org
else
  emacs ${FILE}.org --batch -Q --load org-render-html-minimal.el -f org-html-export-to-html --kill 2> /dev/null
fi

### I guess we can keep this
#rm ${FILE}~

echo "New html file:"
ls -oh ${FILE}.html | awk '{$1 = ""; $2 = "";} 1'
