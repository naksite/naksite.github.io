#!/bin/bash

emacs index.org --batch -Q --load org-render-html-minimal.el -f org-html-export-to-html --kill

ls -l index.html
