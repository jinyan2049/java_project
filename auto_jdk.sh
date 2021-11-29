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

cd /home/tools && curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm > jdk-8u131-linux-x64.rpm


if [ $? -eq 0 ];then
rpm -ivh jdk-8u131-linux-x64.rpm
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

