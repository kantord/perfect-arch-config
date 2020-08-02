#! /usr/bin/bash 

cat ~/.vimrc | grep '" ACTION:' -A1 | grep -v '\-\-' | sed 's/" ACTION: .*\n/asd/' | sed 's/^[^"]/\t\t\t\t/' |  paste -d" " - - | sed 's/^" ACTION: //' > ~/.vim_actions
