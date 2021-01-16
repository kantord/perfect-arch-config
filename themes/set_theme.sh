#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
THEMES_DIR="$DIR"
THEME_NAME=$1
THEME_DIR="$DIR/$THEME_NAME"


if [ -d "$THEME_DIR" ] 
then
    echo "Setting theme $1"

		# Set kitty terminal theme
		kitty @ set-colors -a -c ~/.config/kitty/kitty.conf
		ln -sf $THEME_DIR/kitty.conf ~/.config/kitty/colors.conf

		# Set vim colorscheme
		ln -sf $THEME_DIR/colorscheme.vim ~/.vim/config/colorscheme.vim

		# Set WPG theme (xresources, GTK, etc.)
		wpg -a $THEME_DIR/$THEME_NAME.jpeg
		wpg -i $THEME_DIR/$THEME_NAME.jpeg $THEME_DIR/$THEME_NAME.json
		wpg -s $THEME_DIR/$THEME_NAME.jpeg
else
		ls -d */ | sed 's/\///'
fi
