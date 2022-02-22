echo "backing up command history to dotfiles repo"
if [ -d /workspaces/obisidian ]; then
  cd /workspaces && git clone https://github.com/noam-vanta/dotfiles.git;
fi

GITHUB_TOKEN=""; gh auth login

cd /workspaces/dotfiles
cat $HOME/.zhistory ./zhistory-backup
git config credential.https://github.com.helper ''
git config 'credential.https://github.com' '!gh auth git-credential'
git add .
git commit -m "backing up zsh history"
git push origin main