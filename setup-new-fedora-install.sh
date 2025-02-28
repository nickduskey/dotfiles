#!/bin/bash
# assumes you have already done sudo dnf update -y and rebooted after

# asus only setup
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf copr enable lukenukem/asus-linux -y
sudo dnf update -y
sudo dnf install kernel-devel -y
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y
sudo dnf install asusctl supergfxctl -y
sudo dnf update --refresh
sudo systemctl enable supergfxd.service
sudo dnf install asusctl-rog-gui -y

# install core packages
sudo dnf install -y neovim python3-neovim alacritty postgresql-server postgresql-contrib fish golang rustup

# https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
sudo systemctl start postgresql

# https://developer.fedoraproject.org/tech/languages/go/go-installation.html
mkdir -p $HOME/go

# rust
rustup-init

# jetbrains toolbox app
# https://gist.github.com/abn/d6a769f5cacd162256c2e67f6c3459b0
set -e
set -o pipefail

sudo dnf install -y jq fuse fuse-libs

curl -sL \
    $(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' \
        | jq -r '.TBA[0].downloads.linux.link') \
    | tar xzvf - \
        --directory="${HOME}/.local/bin" \
        --wildcards */jetbrains-toolbox \
        --strip-components=1

# install firefox developer edition
sudo dnf copr enable the4runner/firefox-dev -y
sudo dnf check-update
sudo dnf install firefox-dev -y

# install JetBrainsMono Nerd Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
cd ~/.local/share/fonts
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv

# asus only
sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service
