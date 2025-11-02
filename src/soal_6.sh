# 🖥️ Node: Aldarion
nano /etc/dhcp/dhcpd.conf

# Isi file /etc/dhcp/dhcpd.conf (Hanya bagian yang relevan dengan Lease Time & Soal 2)
# Sesuaikan IP Domain Name Servers dengan Erendis (10.79.3.3)
max-lease-time 3600; 
option domain-name-servers 10.79.3.3; 
authoritative;

# 🔹 Subnet Keluarga Manusia (10.79.1.0/24)
# Waktu Peminjaman: ½ jam (1800 detik) [cite: 174]
subnet 10.79.1.0 netmask 255.255.255.0 {
    range 10.79.1.6 10.79.1.34;
    range 10.79.1.68 10.79.1.94;
    option routers 10.79.1.1; 
    default-lease-time 1800; 
    max-lease-time 3600;
}

# 🔹 Subnet Keluarga Peri (10.79.2.0/24)
# Waktu Peminjaman: ⅙ jam (600 detik) [cite: 175]
subnet 10.79.2.0 netmask 255.255.255.0 {
    range 10.79.2.35 10.79.2.67;
    range 10.79.2.96 10.79.2.121;
    option routers 10.79.2.1; 
    default-lease-time 600; 
    max-lease-time 3600;
}

# 🔹 Fixed address untuk Khamul (Soal 2)
host Khamul {
    hardware ethernet 02:42:77:df:5f:00; # Ganti dengan MAC Address Khamul yang Benar
    fixed-address 10.79.3.95;
}

# ... (Pastikan subnet 10.79.3.0, 10.79.4.0, 10.79.5.0 juga didefinisikan)


# 🖥️ Node: Amandil (Client Dinamis Keluarga Manusia)
dhclient -r eth0 
dhclient eth0 
cat /var/lib/dhcp/dhclient.leases | grep default-lease-time
# Hasil: default-lease-time 1800;

# 🖥️ Node: Amandil (Client Dinamis Keluarga Manusia)
dhclient -r eth0 
dhclient eth0 
cat /var/lib/dhcp/dhclient.leases | grep default-lease-time
# Hasil: default-lease-time 1800;