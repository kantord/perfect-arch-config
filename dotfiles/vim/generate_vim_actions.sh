#! /usr/bin/bash 

cat ~/.vimrc \
 | grep '" ACTION:' -A1 \
 | grep -v '\-\-' \
 | sed 's/ *$//' \
 | sed  's/^\([^"].*\) .*$/\1/' \
 | sed 's/^[^"][^\ ]* //' \
 | sed 's/^[^"][^ ]+//' \
 | sed 's/^<silent> //' \
 |  paste -d"|" - - \
 | sed 's/|/\t\t\t\t\t/' \
 | sed 's/^" ACTION: //' > ~/.vim_actions
