echo "clean installing fzf"
if [ -d /home/linuxbrew/.linuxbrew/bin/fzf ]; then
  echo "Removing existing fzf installation"
  yes | /home/linuxbrew/.linuxbrew/bin/brew uninstall fzf
fi

/home/linuxbrew/.linuxbrew/bin/brew install fzf
yes | /home/linuxbrew/.linuxbrew/opt/fzf/install

cp ./backup-zsh-history ~
cat ./zhistory > $HOME/.zhistory