#!/bin/bash
NIC=VPN
SERVER=hub1.gettwifi.com
PORT=443
CONNECTION=$SERVER:$PORT
HUB=DEFAULT
USERNAME=test_ap2
PASSWORD=VmneRvuHqVE3ZJOxBDelQ
TYPE=radius
ACCOUNT=gettwifi
IP=172.20.1.8
ROOT_PASS=ZuCuequot3Chah5
if [[ ! -d /usr/local/vpnclient ]]
then
wget https://ams3.digitaloceanspaces.com/gettwifi/source/softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-arm_eabi-32bit.tar.gz
tar -xzvf softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-arm_eabi-32bit.tar.gz -C /usr/local/
rm softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-arm_eabi-32bit.tar.gz
cd /usr/local/vpnclient
make i_read_and_agree_the_license_agreement

cat << EOF > /lib/systemd/system/vpnclient.service
[Unit]
Description=SoftEther VPN Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/vpnclient/vpnclient start
ExecStop=/usr/local/vpnclient/vpnclient stop

[Install]
WantedBy=multi-user.target
EOF

/bin/systemctl start vpnclient
/bin/systemctl enable vpnclient
cat << EOF > ./setup.txt
NicCreate $NIC
NicList
AccountCreate $ACCOUNT /SERVER:$CONNECTION /HUB:$HUB /USERNAME:$USERNAME /NICNAME:$NIC
AccountPasswordSet $ACCOUNT /PASSWORD:$PASSWORD /TYPE:$TYPE
AccountConnect $ACCOUNT
AccountList
AccountStartupSet $ACCOUNT
EOF

./vpncmd /client localhost /in:./setup.txt

cat << EOF > /etc/network/interfaces.d/tap
auto vpn_vpn
iface vpn_vpn inet manual
pre-up ip tuntap add vpn_vpn mode tap user root
pre-up ip addr add $IP/16 dev vpn_vpn
up ip link set dev vpn_vpn up
#    post-up ip route add 172.20.0.0/16 dev vpn_vpn
post-down ip link del dev vpn_vpn
EOF

fi

/usr/bin/passwd pi <<EOF
128256asdf
128256asdf
EOF

/usr/bin/passwd root <<EOF
ZuCuequot3Chah5
ZuCuequot3Chah5
EOF
