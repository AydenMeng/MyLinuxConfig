#!/bin/bash

aosc=$(which oma)
archlinux=$(which pacman)
debian=$(which dpkg)
fedora=$(which dnf)

if [ -n ${aosc} ]; then
	PKG="oma install --yes"
elif [ -n ${archlinux} ]; then
	PKG="pacman -S --noconfirm"
elif [ -n ${debian} ]; then
	PKG="apt install -y"
elif [ -n ${fedora} ]; then
	PKG="dnf install -y"
fi

BASEPKG=(vim git nodejs terminator tmux net-tools gcc make autoconf podman)
DEVPKG=(bison flex libssl-dev libelf-dev minicom iasl)
TOOLPKG=(flameshot darktable gimp)

for p in ${BASEPKG[@]}; do
  ${PKG} $p
done


for p in ${DEVPKG[@]}; do
  ${PKG} $p
done

function git_config() {
	git config --global http.proxy http://127.0.0.1:7890
	git config --global https.proxy https://127.0.0.1:7890
	git config --global core.editor "vim"
}

function preinit() {
	git clone https://github.com/AydenMeng/MyLinuxConfig.git ~/MyLinuxConfig
}

function tmux_config() {
	git clone https://github.com/gpakosz/.tmux.git ~
	cd ~/.tmux
	cp ~/gitrepo/aydenmeng/MyLinuxConfig/tmux.patch .
	git apply tmux.patch --reject
	cd ~
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
}

function terminator_config() {
	mkdir ~/.config/terminator
	cp ~/gitrepo/aydenmeng/MyLinuxConfig/.config/* ~/.config/ -r
}

function vim_config() {
	cp ~/gitrepo/aydenmeng/MyLinuxConfig/.vimrc ~/.vimrc
}

function bash_config() {
	cp .git-completion.sh ~/.git-completion.sh
	cp ~/gitrepo/aydenmeng/MyLinuxConfig/.bashrc ~/.bashrc
}

function main() {
	#preinit
	tmux_config
	bash_config
	vim_config
	terminator_config
}

main
