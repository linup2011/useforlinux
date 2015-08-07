#!/bin/bash
#Date 2015/07/24
#Author Jianlin Shi<jlshipro@gmail.com>
#Description:
#Use this script to install virtual box on linux

#Macros
FEDORA_SYS=1
REDHAT_SYS=2

#Functions
Get_sys_type()
{
	if lsb_release -i | grep Fedora
	then
		return $FEDORA_SYS
	else
		return $REDHAT_SYS
	fi
}

if [ $UID != 0 ]
then
	echo "need root to excute the script, exit"
	exit 1
fi

Get_sys_type
systype=$?	#1:fedora 2:redhat

pushd /etc/yum/repos.d
if [ x"$systype" == x"$FEDORA_SYS" ]
then
	wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
elif [ x"$systype" == x"$REDHAT_SYS" ]
then
	wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
else
	wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
fi
popd

yum install VirtualBox -y

yum install kernel-devel -y

/etc/init.d/vboxdrv setup
if [ $? != 0 ]
then
	echo "install driver fail"
	exit 1
fi

if virtualbox  -h
then
	echo "install virtualbox success"
fi
