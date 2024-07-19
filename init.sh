#!/bin/bash

archlinux=$(which pacman)
debian=$(which dpkg)
fedora=$(which dnf)

if [ -n ${archlinux} ]; then
	PKG="pacman -S --noconfirm"
elif [ -n ${debian} ]; then
	PKG="apt install -y"
elif [ -n ${fedora} ]; then
	PKG="dnf install -y"
fi

BASEPKG=(vim git nodejs terminator tmux net-tools gcc make autoconf)
DEVPKG=(bison flex libssl-dev libelf-dev minicom)

for p in ${BASEPKG[@]}; do
	${PKG} $p
done


# for p in ${DEVPKG[@]}; do
	# ${PKG} $p
# done

function preinit() {
	git clone https://github.com/AydenMeng/MyLinuxConfig.git ~/MyLinuxConfig
}

function tmux_config() {
	cd ~
	git clone https://github.com/gpakosz/.tmux.git
	cp ~/MyLinuxConfig/tmux.patch .
	git apply tmux.patch --reject
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
}

function vim_config() {
	cp ~/MyLinuxConfig/.vimrc ~/.vimrc
}

function bash_config() {
	cp ~/MyLinuxConfig/.bashrc ~/.bashrc
}

function main() {
	preinit
	tmux_config
	bash_config
	vim_config
}
