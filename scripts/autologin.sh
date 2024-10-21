#!/bin/bash
# check lightdm package
if [ ! -e /etc/lightdm/lightdm.conf ]; then
    echo "The reboot script depends lightdm package!"
    exit
fi

# check user
if [ $UID -ne 0 ]; then
    echo "Please run $0 with root user!"
    exit
fi

passwd root << EOF #会打印东西，建议放到log里
keykeykey
keykeykey
EOF

cfgflag=$(grep -rn ^[\#]*autologin-user=[[:alnum:]] /etc/lightdm/lightdm.conf | awk -F ":" '{print $1}')

c=0
for i in $cfgflag
do
	c=$(($c + 1))
	if [[ $c == 1 ]]
	then
		sed -i "$i s/=.*/=$1/g"  /etc/lightdm/lightdm.conf
		sed -i "$i s/^#\+//g"  /etc/lightdm/lightdm.conf
	else
		sed -i "$i s/^/#/g"  /etc/lightdm/lightdm.conf
		sed -i "$i s/^#\+/#/g"  /etc/lightdm/lightdm.conf
	fi

done

cfgnum=$(grep -n quiet_success /etc/pam.d/lightdm-autologin | grep -v "#" | wc -l)
if [ $cfgnum != 0 ];then
	linenum=$(grep -n quiet_success /etc/pam.d/lightdm-autologin |awk -F : '{print $1}')
	sed -i "${linenum}s/^/#/" /etc/pam.d/lightdm-autologin
fi
#systemctl restart lightdm

cat > ./stop.sh <<EOF
#!/bin/bash

###delate lightdm autologin
cfgflag=\$(grep -rn ^[\#]*autologin-user=[[:alnum:]] /etc/lightdm/lightdm.conf | awk -F ":" '{print \$1}')

c=0
for i in \$cfgflag
do
	c=\$((\$c + 1))
	if [[ \$c == 1 ]]
	then
		sed -i "\$i s/^/#/g"  /etc/lightdm/lightdm.conf
		sed -i "\$i s/=.*/=keykeykey/g"  /etc/lightdm/lightdm.conf
	else
		sed -i "\$i s/^/#/g"  /etc/lightdm/lightdm.conf
	fi

done

EOF
chmod +x ./stop.sh
