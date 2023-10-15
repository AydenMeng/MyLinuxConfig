#!/bin/bash
tmp=$(systemctl status ssh | grep "Active: inactive")
if [ ! -z "$tmp" ]
then
	systemctl start ssh
fi
tmp=$(systemctl status ssh | grep "ssh.service; disabled;")
if [ ! -z "$tmp" ]
then
	systemctl enable ssh
fi

i=10
tmp=$(env LANG=en_US.utf-8 apt update | grep -P "^Err:|^E:")
while [[ $i > 0 ]]
do
    if [ ! -z "$tmp" ]
    then
		tmp=$(env LANG=en_US.utf-8 apt update | grep -P "^Err:|^E:")
        i=$(($i - 1))
    else
        i=0
    fi
done

pkg=`dpkg -l | awk '{print $2}' | grep "\<aptitude\>"`
if [ -z "$pkg" ]
then
    apt install aptitude -y
fi

aptitude search '~i' | awk '{print $2}' > /tmp/deb.txt
install_if_not_exist() {
    pkg=$(cat /tmp/deb.txt | grep -x $1)
    if [ "$pkg" != "$1" ]
    then
        echo "------------ $1"
        aptitude install $1 -y
	aptitude search '~i' | awk '{print $2}' > /tmp/deb.txt
    fi
}

install_if_not_exist bison
install_if_not_exist flex
install_if_not_exist libssl-dev
install_if_not_exist libelf-dev
install_if_not_exist iperf3
install_if_not_exist minicom
install_if_not_exist git
install_if_not_exist tmux
install_if_not_exist vim
install_if_not_exist net-tools
install_if_not_exist glmark2
install_if_not_exist libncurses-dev
install_if_not_exist sysstat
install_if_not_exist lsscsi
install_if_not_exist libaio-dev
install_if_not_exist vlc
install_if_not_exist rpcbind
install_if_not_exist rsh-server
install_if_not_exist nfs-kernel-server
install_if_not_exist lm-sensors
install_if_not_exist ntpdate
install_if_not_exist glmark2
install_if_not_exist iperf3
install_if_not_exist wireshark
install_if_not_exist gimp
install_if_not_exist gparted
install_if_not_exist cfdisk
install_if_not_exist ipython3
install_if_not_exist gdb
install_if_not_exist kde-plasma-desktop
install_if_not_exist flameshot
install_if_not_exist terminator

echo -e "软件环境准备完毕"
