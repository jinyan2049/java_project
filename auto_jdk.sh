#!/bin/bash
if [ `whoami` != root ]
then
echo "Please login as root to continue :)"
exit 1
fi

if [ ! -d /home/tools/ ];then
mkdir -p /home/tools
else
rm -rf /home/tools && mkdir -p /home/tools
fi

#cd /home/tools && wget http://download.cashalo.com/schema/jdk-8u171-linux-x64.rpm
cd /home/tools && curl -LOH 'Cookie: oraclelicense=accept-securebackup-cookie' 'http://download.oracle.com/otn-pub/java/jdk/8u301-b09/d3c52aa6bfa54d3ca74e617f18309292/jdk-8u301-linux-x64.rpm'
if [ $? -eq 0 ];then
rpm -ivh jdk-8u301-linux-x64.rpm
else
exit 1
fi

##Edit Jdk Env
cat > /etc/profile.d/java.sh <<EOF
export JAVA_HOME=/usr/java/default/
export PATH=\$PATH:\$JAVA_HOME/bin
EOF

#do source
source /etc/profile.d/java.sh

