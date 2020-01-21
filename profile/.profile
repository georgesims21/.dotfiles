export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox
export SHELL=/usr/bin/zsh
if [ -t 1 ]; then exec $SHELL; fi

# To make caps lock work with ctrl and esc
xcape -e 'Control_L=Escape'
