# ===================================================================
# Node Durin (Router)
# ===================================================================
# Mengaktifkan IP forwarding (PENTING!)
sysctl -w net.ipv4.ip_forward=1

auto eth0
iface eth0 inet dhcp
    # Set DNS sementara untuk Durin agar bisa install paket
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth1
iface eth1 inet static
    address 10.79.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.79.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.79.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 10.79.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 10.79.5.1
    netmask 255.255.255.0

# Aturan NAT untuk mengizinkan jaringan internal (10.79.0.0/16) ke internet via eth0
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.79.0.0/16

# Aturan FORWARD untuk mengizinkan routing antar jaringan internal
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth4 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth5 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth4 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth5 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth4 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth5 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth5 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth4 -j ACCEPT

#2. Izinkan trafik BALASAN dari internet (eth0) kembali ke internal
# (Ini adalah aturan stateful yang sangat penting)
iptables -A FORWARD -i eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# ===================================================================
# Node Jaringan 1 (Keluarga Manusia, sebagian)
# ===================================================================

# Node Elendil (10.79.1.2) 
auto eth0
iface eth0 inet static
    address 10.79.1.2
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Isildur (10.79.1.3) 
auto eth0
iface eth0 inet static
    address 10.79.1.3
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Anarion (10.79.1.4) 
auto eth0
iface eth0 inet static
    address 10.79.1.4
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Miriel (10.79.1.5) 
auto eth0
iface eth0 inet static
    address 10.79.1.5
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Amandil (DHCP) 
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Elros (10.79.1.6) 
auto eth0
iface eth0 inet static
    address 10.79.1.6
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Khamul (DHCP - Fixed) 
auto eth0
iface eth0 inet dhcp
    # Pastikan MAC Address ini sesuai dengan GNS3 Anda
    hwaddress ether 02:42:dc:08:82:00
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# ===================================================================
# Node Jaringan 2 (Manusia + Peri)
# ===================================================================

# Node Minastir (10.79.2.2) 
auto eth0
iface eth0 inet static
    address 10.79.2.2
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Pharazon (10.79.2.3) 
auto eth0
iface eth0 inet static
    address 10.79.2.3
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Celebrimbor (10.79.2.4) 
auto eth0
iface eth0 inet static
    address 10.79.2.4
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# ===================================================================
# Node Jaringan 3 (Manusia + Peri)
# ===================================================================

# Node Aldarion (10.79.3.2) 
auto eth0
iface eth0 inet static
    address 10.79.3.2
    netmask 255.255.255.0
    gateway 10.79.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Erendis (10.79.3.3) 
auto eth0
iface eth0 inet static
    address 10.79.3.3
    netmask 255.255.255.0
    gateway 10.79.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Amdir (10.79.3.4) 
auto eth0
iface eth0 inet static
    address 10.79.3.4
    netmask 255.255.255.0
    gateway 10.79.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# ===================================================================
# Node Jaringan 4 (Manusia + Kurcaci)
# ===================================================================

# Node Palantir (10.79.4.2) 
auto eth0
iface eth0 inet static
    address 10.79.4.2
    netmask 255.255.255.0
    gateway 10.79.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Narvi (10.79.4.3) 
auto eth0
iface eth0 inet static
    address 10.79.4.3
    netmask 255.255.255.0
    gateway 10.79.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# ===================================================================
# Node Jaringan 5 (Keluarga Peri)
# ===================================================================

# Node Galadriel (10.79.5.2) 
auto eth0
iface eth0 inet static
    address 10.79.5.2
    netmask 255.255.255.0
    gateway 10.79.5.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Celeborn (10.79.5.3) 
auto eth0
iface eth0 inet static
    address 10.79.5.3
    netmask 255.255.255.0
    gateway 10.79.5.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Oropher (10.79.5.4) 
auto eth0
iface eth0 inet static
    address 10.79.5.4
    netmask 255.255.255.0
    gateway 10.79.5.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Gilgalad (DHCP) 
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# ===================================================================
# TEST SCRIPT
# ===================================================================

# Jaga-jaga jika belum install (Jalankan di semua node)
apt-get update
apt-get install -y nano dnsutils lynx htop curl apache2-utils

# Tes koneksi dari node non-router (misal: Elendil)
ping -c 3 8.8.8.8
ping -c 3 google.com
