echo "clean installing brew"
if [ -d /home/linuxbrew/ ]; then
  echo "Removing existing brew installation"
  yes | NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
fi

echo "Installing brew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"