export PATH=$PATH:$HOME/.local/bin

# Default Applications
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export ABROWSER="firefox"
export CODEEDITOR="code"
export READER="zathura"

#For Qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct

#Fix for java application
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
