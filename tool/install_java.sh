#!/bin/bash

if [ $# -lt 1 ]
then
    echo "usage:$0 rpm_pack_path"
    exit 1
fi

rpm_path=$1

if [ $UID != 0 ]
then
    echo "need root to run the script"
    echo "exit 1"
fi

while java -version
do
    if alternatives --display java > /tmp/tmp_java.log
    then
        path=`cat /tmp/tmp_java.log | grep "link currently" | awk '{print $5}'`
        alternatives --remove java $path
    fi
done

rm /tmp/tmp_java.log -f

rpm -ivh  $rpm_path
if [ $? != 0 ]
then
    echo "rpm install java fail, please debug manually"
    echo "rpm address:http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-linux-x64.rpm"
    exit 1
fi

java_path="/usr/java/latest/bin/java"
alternatives --install /usr/bin/java java $java_path 200000
if ! java -version
then
    echo "install link to /usr/bin/java failed"
    echo "please check manually"
    exit 1
fi

if uname -i | grep 64
then
    java_plugin="/usr/java/latest/lib/amd64/libnpjp2.so"
    alternatives --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 $java_plugin 200000
else
    java_plugin="/usr/java/latest/lib/i386/libnpjp2.so"
    alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so libjavaplugin.so $java_plugin  20000
fi

javaws_path="/usr/java/latest/bin/javaws"
if [ ! -e /usr/bin/javaws ]
then
    ln -s $javaws_path /usr/bin/javaws
fi
jcontrol_path="/usr/java/latest/bin/jcontrol"
if  [ ! -e /usr/bin/jcontrol ]
then
    ln -s $jcontrol_path /usr/bin/jcontrol
fi
