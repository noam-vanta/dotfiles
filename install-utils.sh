echo "clean installing fzf"
if [ -d /home/linuxbrew/.linuxbrew/bin/fzf ]; then
  echo "Removing existing fzf installation"
  yes | brew uninstall fzf
fi

brew install fzf
yes | $(brew --prefix)/opt/fzf/install