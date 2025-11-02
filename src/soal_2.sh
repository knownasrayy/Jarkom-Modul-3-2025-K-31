Aldaron (DHCP Server)

Install DHCP:
apt-get update
apt-get install -y isc-dhcp-server

nano /etc/default/isc-dhcp-server
INTERFACESv4="eth0"

nano /etc/dhcp/dhcpd.conf
authoritative;

# Subnet 1 - Keluarga Manusia (Switch1)
subnet 10.79.1.0 netmask 255.255.255.0 {
    range 10.79.1.6 10.79.1.34;
    range 10.79.1.68 10.79.1.94;
    option routers 10.79.1.1;
    option broadcast-address 10.79.1.255;
    option domain-name-servers 10.79.3.3;
}

# Subnet 2 - Keluarga Peri (Switch2)
subnet 10.79.2.0 netmask 255.255.255.0 {
    range 10.79.2.35 10.79.2.67;
    range 10.79.2.96 10.79.2.121;
    option routers 10.79.2.1;
    option broadcast-address 10.79.2.255;
    option domain-name-servers 10.79.3.3;
}

# Subnet 3 - Fixed Khamul
subnet 10.79.3.0 netmask 255.255.255.0 {
    option routers 10.79.3.1;
    option broadcast-address 10.79.3.255;
    option domain-name-servers 10.79.3.3;
}

# Subnet 4 (Aldarion, Palantir, Narvi)
subnet 10.79.4.0 netmask 255.255.255.0 {
    option routers 10.79.4.1;
    option broadcast-address 10.79.4.255;
    option domain-name-servers 10.79.3.3;
}

# Subnet 5 (Minastir)
subnet 10.79.5.0 netmask 255.255.255.0 {
    option routers 10.79.5.1;
    option broadcast-address 10.79.5.255;
    option domain-name-servers 10.79.3.3;
}

# Fixed-address Khamul
host Khamul {
    hardware ethernet 02:42:77:df:5f:00;
    fixed-address 10.79.3.95;
}

Restart DHCP SERVER:
service isc-dhcp-server restart
service isc-dhcp-server status

Durin jadi DHCP Relay

apt-get install -y isc-dhcp-relay

nano /etc/default/isc-dhcp-relay
SERVERS="10.79.4.2"
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""
—--------------------------------------------------------
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
sysctl -p

Restart DHCP RELAY:
service isc-dhcp-relay restart

Konfigurasi di Khamul
nano /etc/network/interfaces
auto eth0
iface eth0 inet dhcp

# Karena sudah diset fixed di DHCP server, dia akan tetap dapat 10.79.3.95.

Tes di Client DHCP

Bikin client kalau error
echo "nameserver 10.79.3.3" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-client -y


# cek di amandil dan gilgalad apakah sudah dapat IP
ip a | grep inet

# ping gateway
ping -c 3 10.79.1.1  # Amandil
ping -c 3 10.79.2.1  # Gilgalad

# test internet
ping -c 3 8.8.8.8

IP harus sesuai rentang :
Amandil → 10.79.1.6–10.79.1.34 atau 10.79.1.68–10.79.1.94
Gilgalad → 10.79.2.35–10.79.2.67 atau 10.79.2.96–10.79.2.121
Khamul → tetap 10.79.3.95
