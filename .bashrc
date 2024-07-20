# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[32;1m\]AydenMeng\[\033[0m\]@\[\033[35;1m\]\h\[\033[0m\]:\[\033[33;1m\]/path/to/\W\[\033[0m\]\$ '

#export PATH=/home/mengxiangdong/tool_chain/nasm-2.14/bin:$PATH
#export LD_LIBRARY_PATH=/home/mengxiangdong/tool_chain/gcc-4.4.0-pmon/lib:
#export CROSS_COMPILE=mipsel-linux-

#export PATH=/opt/gcc-4.4.0-pmon/bin/:$PATH
#export LD_LIBRARY_PATH=/opt/gcc-4.4.0-pmon/lib/:$LD_LIBRARY_PATH

#export CROSS_COMPILE=mipsel-linux-
export PATH=/home/mengxiangdong/tool_chain/opt/gcc-4.3-ls232/bin/:$PATH
export PATH=/opt/toolchain/mips-loongson-gcc4.9-linux-gnu/2019.08-05/bin:$PATH
export LD_LIBRARY_PATH=/home/mengxiangdong/tool_chain/opt/gcc-4.3-ls232/lib/:$LD_LIBRARY_PATH
#export PATH=/home/mengxiangdong/tool_chain/gcc-4.4-pmon/bin:$PATH
#alias gcc43='export PATH=/home/mengxiangdong/tool_chain/opt/gcc-4.3-ls232/bin:$PATH'
#alias gcc44='export PATH=/home/mengxiangdong/tool_chain/gcc-4.4-pmon/bin:$PATH'

source /home/mengxiangdong/tool_chain/gcc-for-curr.sh

mkdir /tmp/mxd -p
cp /home/mengxiangdong/tool_chain/gcc-for-*.sh /tmp/mxd/ -f
#cp /home/mengxiangdong/bin/out /tmp/mxd/ -rf

#alias grepn='bash /home/mengxiangdong/.greprc.sh'
alias gren='func() { grep $1 -rn $2 | vim -;};func'

alias mysql='/home/mengxiangdong/gitea/mysql/bin/mysql -S /home/mengxiangdong/gitea/mysql/mysql.sock'
# source /home/mengxiangdong/.gitea.sh

alias gitpush='git push origin HEAD:refs/for/master'
alias gs='git status'
alias gd='git diff'
alias gg='git log --graph'
alias gb='git branch -a'
alias makemenu='source ~/tool_chain/makemenuconfig'
alias makevmlinux='source ~/tool_chain/makevmlinux'
alias makemod='source ~/tool_chain/makemode'
alias gssssssssss='git restore lib/libc/Makefile lib/libz/Makefile lib/libm/Makefile'
alias cccd='dirs -v'
alias slcp='func () { scp -P10086 $1 mxd@10.20.4.175:$2;}; func'
# alias cd='pushd'

#export CROSS_COMPILE=loongarch64-linux-gnu-
export ARCH=loongarch64
export PATH=/opt/toolchain/loongarch64-linux-gnu-2021-12-10-vector/bin/:$PATH
export LD_LIBRARY_PATH=/opt/toolchain/loongarch64-linux-gnu-2021-12-10-vector/lib/:$LD_LIBRARY_PATH
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [[ ! -z "$SSH_TTY" ]]
then
# echo -e "\e[32m ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗     █████╗ ██╗   ██╗██████╗ ███████╗███╗   ██╗\e[0m"
# echo -e "\e[32m ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ██╔══██╗╚██╗ ██╔╝██╔══██╗██╔════╝████╗  ██║\e[0m"
# echo -e "\e[32m ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗      ███████║ ╚████╔╝ ██║  ██║█████╗  ██╔██╗ ██║\e[0m"
# echo -e "\e[32m ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝      ██╔══██║  ╚██╔╝  ██║  ██║██╔══╝  ██║╚██╗██║\e[0m"
# echo -e "\e[32m ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗    ██║  ██║   ██║   ██████╔╝███████╗██║ ╚████║\e[0m"
# echo -e "\e[32m  ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═══╝\e[0m"

# echo -e "\e[32m ████████╗ ██████╗      █████╗ ██╗   ██╗██████╗ ███████╗███╗   ██╗\e[0m"
# echo -e "\e[32m ╚══██╔══╝██╔═══██╗    ██╔══██╗╚██╗ ██╔╝██╔══██╗██╔════╝████╗  ██║██╗\e[0m"
# echo -e "\e[32m    ██║   ██║   ██║    ███████║ ╚████╔╝ ██║  ██║█████╗  ██╔██╗ ██║╚═╝\e[0m"
# echo -e "\e[32m    ██║   ██║   ██║    ██╔══██║  ╚██╔╝  ██║  ██║██╔══╝  ██║╚██╗██║██╗\e[0m"
# echo -e "\e[32m    ██║   ╚██████╔╝    ██║  ██║   ██║   ██████╔╝███████╗██║ ╚████║╚═╝\e[0m"
# echo -e "\e[32m    ╚═╝    ╚═════╝     ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═══╝\e[0m"
# echo -e "\e[32m \e[0m"
# echo -e "\e[32m                     ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗\e[0m"
# echo -e "\e[32m                     ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝\e[0m"
# echo -e "\e[32m                     ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗\e[0m"
# echo -e "\e[32m                     ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝\e[0m"
# echo -e "\e[32m                     ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗\e[0m"
# echo -e "\e[32m                      ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝\e[0m"
# echo -e "\e[32m \e[0m"
# echo -e "\e[32m                      █████╗ ███╗   ██╗██████╗\e[0m"
# echo -e "\e[32m                     ██╔══██╗████╗  ██║██╔══██╗\e[0m"
# echo -e "\e[32m                     ███████║██╔██╗ ██║██║  ██║\e[0m"
# echo -e "\e[32m                     ██╔══██║██║╚██╗██║██║  ██║\e[0m"
# echo -e "\e[32m                     ██║  ██║██║ ╚████║██████╔╝\e[0m"
# echo -e "\e[32m                     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝\e[0m"
# echo -e "\e[32m \e[0m"
# echo -e "\e[32m                      ██████╗██╗  ██╗███████╗███████╗██████╗     ██╗   ██╗██████╗ ██╗\e[0m"
# echo -e "\e[32m                     ██╔════╝██║  ██║██╔════╝██╔════╝██╔══██╗    ██║   ██║██╔══██╗██║\e[0m"
# echo -e "\e[32m                     ██║     ███████║█████╗  █████╗  ██████╔╝    ██║   ██║██████╔╝██║\e[0m"
# echo -e "\e[32m                     ██║     ██╔══██║██╔══╝  ██╔══╝  ██╔══██╗    ██║   ██║██╔═══╝ ╚═╝\e[0m"
# echo -e "\e[32m                     ╚██████╗██║  ██║███████╗███████╗██║  ██║    ╚██████╔╝██║     ██╗\e[0m"
# echo -e "\e[32m                      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═╝     ╚═╝\e[0m"


echo -e "\e[32m ██████╗  ██████╗  ██████╗ ██████╗\e[0m"
echo -e "\e[32m██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗\e[0m"
echo -e "\e[32m██║  ███╗██║   ██║██║   ██║██║  ██║\e[0m"
echo -e "\e[32m██║   ██║██║   ██║██║   ██║██║  ██║\e[0m"
echo -e "\e[32m╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝\e[0m"
echo -e "\e[32m ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m ██████╗  ██████╗  ██████╗ ██████╗\e[0m"
echo -e "\e[32m██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗\e[0m"
echo -e "\e[32m██║  ███╗██║   ██║██║   ██║██║  ██║\e[0m"
echo -e "\e[32m██║   ██║██║   ██║██║   ██║██║  ██║\e[0m"
echo -e "\e[32m╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝\e[0m"
echo -e "\e[32m ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m███████╗████████╗██╗   ██╗██████╗ ██╗   ██╗\e[0m"
echo -e "\e[32m██╔════╝╚══██╔══╝██║   ██║██╔══██╗╚██╗ ██╔╝\e[0m"
echo -e "\e[32m███████╗   ██║   ██║   ██║██║  ██║ ╚████╔╝\e[0m"
echo -e "\e[32m╚════██║   ██║   ██║   ██║██║  ██║  ╚██╔╝\e[0m"
echo -e "\e[32m███████║   ██║   ╚██████╔╝██████╔╝   ██║\e[0m"
echo -e "\e[32m╚══════╝   ╚═╝    ╚═════╝ ╚═════╝    ╚═╝\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m██████╗  █████╗ ██╗   ██╗\e[0m"
echo -e "\e[32m██╔══██╗██╔══██╗╚██╗ ██╔╝\e[0m"
echo -e "\e[32m██║  ██║███████║ ╚████╔╝\e[0m"
echo -e "\e[32m██║  ██║██╔══██║  ╚██╔╝\e[0m"
echo -e "\e[32m██████╔╝██║  ██║   ██║\e[0m"
echo -e "\e[32m╚═════╝ ╚═╝  ╚═╝   ╚═╝\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m██████╗  █████╗ ██╗   ██╗\e[0m"
echo -e "\e[32m██╔══██╗██╔══██╗╚██╗ ██╔╝\e[0m"
echo -e "\e[32m██║  ██║███████║ ╚████╔╝\e[0m"
echo -e "\e[32m██║  ██║██╔══██║  ╚██╔╝\e[0m"
echo -e "\e[32m██████╔╝██║  ██║   ██║\e[0m"
echo -e "\e[32m╚═════╝ ╚═╝  ╚═╝   ╚═╝\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m██╗   ██╗██████╗\e[0m"
echo -e "\e[32m██║   ██║██╔══██╗\e[0m"
echo -e "\e[32m██║   ██║██████╔╝\e[0m"
echo -e "\e[32m██║   ██║██╔═══╝\e[0m"
echo -e "\e[32m╚██████╔╝██║\e[0m"
echo -e "\e[32m ╚═════╝ ╚═╝\e[0m"

fi

export CSCOPE_EDITOR=`which vim`

source ~/.git-completion.sh
