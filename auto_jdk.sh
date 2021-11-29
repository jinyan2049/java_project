#!/bin/bash
# written by jerry
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

sleep 1

yum -y install wget

cd /home/tools && wget -c https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.rpm


if [ $? -eq 0 ];then
rpm -ivh jdk-8u202-linux-x64.rpm
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

