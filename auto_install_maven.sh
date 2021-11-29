#!/bin/bash
if [ `whoami` != root ]
then
echo "Please login as root to continue :)"
exit 1
fi

mkdir -p /opt/modules/
if [ ! -d /home/tools/ ];then
mkdir -p /home/tools
else
rm -rf /home/tools && mkdir -p /home/tools
fi

cd /home/tools
#wget -c http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
#wget -c http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
wget -c --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

tar zxvf apache-maven-3.6.3-bin.tar.gz
if [ $? -eq 0 ];then
mv apache-maven-3.6.3 /opt/modules/
fi

cat >/etc/profile.d/maven.sh <<EOF
export MAVEN_HOME=/opt/modules/apache-maven-3.6.3
export PATH=\$PATH:\$MAVEN_HOME/bin
EOF

source /etc/profile.d/maven.sh






