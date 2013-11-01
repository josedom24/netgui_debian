#! /bin/bash

NETGUI_VERSION=0.4.9
URL=http://mobiquo.gsyc.es/netgui-${NETGUI_VERSION}
apt-get update
apt-get -y --force-yes install openjdk-6-jre
apt-get -y --force-yes install xterm xwit telnetd wireshark pv libc6-i386
cd /tmp
rm -f netgui-${NETGUI_VERSION}.tar.bz2
wget ${URL}/netgui-${NETGUI_VERSION}.tar.bz2
cd /usr/local
rm -rf netkit
pv /tmp/netgui-${NETGUI_VERSION}.tar.bz2 | sudo tar -xjSf -
ln -fs /usr/local/netkit/netgui/bin/netgui.sh /usr/local/bin
ln -fs /usr/local/netkit/netgui/bin/clean-netgui.sh /usr/local/bin
ln -fs /usr/local/netkit/netgui/bin/clean-vm.sh /usr/local/bin
echo 
echo "NetGUI autoinstall completed"
echo 
echo "Checking install..."
cd /usr/local/netkit
export NETKIT_HOME=/usr/local/netkit
export PATH=/usr/local/netkit/bin:$PATH
export MANPATH=:/usr/local/netkit/man
./check_configuration.sh

