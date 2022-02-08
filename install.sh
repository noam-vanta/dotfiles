sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sh -c install-brew.sh
brew install --all fzf
$(brew --prefix)/opt/fzf/install
