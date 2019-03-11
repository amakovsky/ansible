#!/bin/bash
NIC=VPN
SERVER=hub1.gettwifi.com
PORT=443
CONNECTION=$SERVER:$PORT
HUB=DEFAULT
USERNAME=test_scanner
PASSWORD=VUouPsFujaJYkLyharHLcg
TOCKEN=vM6dBSCxqfmDecXe4Z81
TYPE=radius
ACCOUNT=gettwifi
IP=172.20.1.2
GATEWAYIP=172.20.0.2
ROOT_PASS=ZuCuequot3Chah5
if [[ ! -d /usr/local/vpnclient ]]
then
wget https://ams3.digitaloceanspaces.com/gettwifi-src/softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-arm_eabi-32bit.tar.gz
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
post-up ip route add 172.20.0.0/16 dev vpn_vpn
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

/usr/bin/apt-get install -yq python3-pip git vim
/usr/bin/pip3 install netaddr
/usr/bin/pip3 install scapy
/usr/bin/pip3 install persist-queue
if [[ ! -d /home/pi/.ssh/ ]]; then
mkdir /home/pi/.ssh/
fi

cat << EOF > /home/pi/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAvXpI1lhpngAAj1sH8qtqew4iMAUkPE8XylrfyZb9gYzh+Csa
zJHMbwKr4FV5EGRH0dH/irWzPSqdX+7oOdlzbGTF3toAe7tw+4OqslnF6m7nQo4u
7DzsqXKe4+9isTgh+s1Trg3gugUmx9+AmWIvqE7DlvBu41rVcWHuIe4VfrXqlRxR
n9T9U4WywMeaag+DE45I2lf5X+i5vLl/+aTV+wc3oMXfEun3g5ypf8pTMCbNgzzX
9dABmtWMCCyWSXFm1va27DMxtFG1234GNpq4xTvPmhD3sz78zTchD+qG/bCwapD/
PkAm/w7Yaju7BokWsSCbWQrnKRoUbcWmI+2H2wIDAQABAoIBADUCZCRLgejpOT7i
CdwzZsvcjWX/2j5hJle/isJcUroOzx1d+dZnp9ka1zkg0IjsdUdXR/Xnlai0Jmkz
bpbYpjkaDF2ngeEb9KT5FiVlhkBrHJn7K1d+R/u0DI3aaDMKcD85eILGcSu5yzq5
5cGDva+JsaClzXAf9n0NF9E4SZ00Dme3khPm4AvhK68Z3CEJEAJgyq6aGU/FVgzU
blppJj8vO2RMT7AjAmGV1b+/A60KpCn4xC/4rUQIdEffjLZLayEPF0COTjwdnsq1
be0UJDp1osDJ4HZDxa7qCL2qEe6C5Hba+XaqfWOp6aK7K/b/Yc+Q6PICCoBBpNmF
nKA/LCECgYEA6U72gkdzisCHuSmGIL15xmk+LNPIpnG8En1cFOIZfLiI+8YPxlOU
V4Wd6N3csx0tAfiKTq18KI6ksQ/R9VA5pq/FObdZDlcREgvZv9F6nj0SdmShQZk5
A8i3b4KGE3riYXT26gCxS2A4zW9+sW+SdRoyRS8uXwlRlgsuuSeSnssCgYEAz+f/
8mXswDVX7TdlgkpX0DFGpGP8MJIgHhtZaJhMWvHMQu0FJttqwbscxFMO4LSEE1Pl
ZiEC6yzBRxcS1xDeQobqjlC2lDPFt2xzMDrKYmbZZaEa+GEIXGuH8zxJopkQefeM
7Qw+XTP6V0LF4UAD0HnWWyY0GLptpy5LRorYCTECgYEApYt38n0MiPmP1FyYZYbM
b3KhwWEM0L2G+3+j5NWBzDOMT0n8S3dmnKucnm0+eoFLPEjEqosCvCxqw5A8JFqm
bZXu1cM5F6nD3RA3k5np7XncLdG9cjRsdjjnn+H3jL72/rvlr6iKJLfD1lE0jmZi
f2D1Jo4R0zFjiJmqr4payP0CgYEAuIkZ+tNRMsGmS52R8fV+wAIcy6kbnRj2fQKV
d2tGyqo4PWcX3Yd/2Hj2baOzXuubF3St9tpyNr/AxhLK3C3SuYX7B1rI0/6oDciq
7TIhlPnpGHXI9JFb1Hx1bQYj7biikT+SzIzDhgKuv2k7LlWdjRu3kav1LcW7slo6
4mA2pOECgYEAyi9SdhEojWyJm0FBLAMB4hQXXR4zNtDmi+egUnoJTQaZfdGt2DjV
FIJ97iG+eZMVttVv2NLEkaresLihz3eo6OOBcynMJMjTN0pYZ0Lt0P6UFxWQmDdS
RiehfFO7bqpIVWpHmFSYjyJ3EqL4OhwlpXYF769jXzx1PQ60TlyOXfk=
-----END RSA PRIVATE KEY-----
EOF

chmod 600 /home/pi/.ssh/id_rsa

cat << EOF > /home/pi/.ssh/config
Host gitlab.gettwifi.com
    Hostname gitlab.gettwifi.com
    User git
    IdentityFile ~/.ssh/id_rsa
EOF

#mkdir /home/pi/scanner

chown pi -R /home/pi/.ssh
#chown pi -R /home/pi/scanner

su - pi -c "git clone git@gitlab.gettwifi.com:k.gribanov/raspberryscanner.git /home/pi/scanner"

if [[ ! -d /home/pi/scanner/queue ]]; then
mkdir /home/pi/scanner/queue
fi
if [[ ! -d /home/pi/scanner/statistic ]]; then
mkdir /home/pi/scanner/statistic
fi

if [[ ! -d /var/log/scanner ]]; then
mkdir /var/log/scanner
fi

cat << EOF > /lib/systemd/system/scanner.service
[Unit]
Description=Wifi scanner
After=multi-user.target

[Service]
Type=simple
ExecStart=/home/pi/scanner/start.sh
Restart=on-abort
WorkingDirectory=/home/pi/scanner

[Install]
WantedBy=multi-user.target

EOF

chmod 644 /lib/systemd/system/scanner.service
systemctl daemon-reload
systemctl enable scanner.service
grep -q fetchnew.gettwifi.com /etc/hosts
if [[ ${?} -ne 0 ]]; then
echo "${GATEWAYIP}      fetchnew.gettwifi.com" >> /etc/hosts
fi
crontab -l | grep -q '* * * * * cd /home/pi/scanner && ./heartbeat.py'
if [[ ${?} -ne 0 ]]; then
(crontab -l ; echo '* * * * * cd /home/pi/scanner && ./heartbeat.py -n $USERNAME -t $TOCKEN >/dev/null 2>&1') | crontab -
fi
#reboot