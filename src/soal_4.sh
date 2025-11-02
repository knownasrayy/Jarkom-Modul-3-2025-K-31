# 🖥️ Node: Erendis (10.79.3.3)
apt-get update
apt-get install -y bind9 dnsutils

# Buat folder zona
mkdir -p /etc/bind/zones


# 🖥️ Node: Erendis
nano /etc/bind/named.conf.local

# Tambahkan konfigurasi ini:
zone "k31.com" { 
    type master;
    file "/etc/bind/zones/db.k31.com"; 
    also-notify { 10.79.3.4; };     // DNS Slave Amdir
    allow-transfer { 10.79.3.4; };   // Izinkan transfer ke Amdir
};

zone "3.79.10.in-addr.arpa" { // Reverse zone untuk subnet 10.79.3.x
    type master;
    file "/etc/bind/zones/db.10.79.3";
    also-notify { 10.79.3.4; };
    allow-transfer { 10.79.3.4; };
};


# 🖥️ Node: Erendis
nano /etc/bind/named.conf.local

# Tambahkan konfigurasi ini:
zone "k31.com" { 
    type master;
    file "/etc/bind/zones/db.k31.com"; 
    also-notify { 10.79.3.4; };     // DNS Slave Amdir
    allow-transfer { 10.79.3.4; };   // Izinkan transfer ke Amdir
};

zone "3.79.10.in-addr.arpa" { // Reverse zone untuk subnet 10.79.3.x
    type master;
    file "/etc/bind/zones/db.10.79.3";
    also-notify { 10.79.3.4; };
    allow-transfer { 10.79.3.4; };
};

# 🖥️ Node: Erendis
nano /etc/bind/zones/db.10.79.3

$TTL    604800
@       IN      SOA     ns1.k31.com. root.k31.com. ( 
                        2025110201  ; Serial (Sama dengan zona maju)
                        // ... nilai lainnya
                        604800 )

@       IN      NS      ns1.k31.com. 
@       IN      NS      ns2.k31.com. 

3       IN      PTR     ns1.k31.com. // 10.79.3.3
4       IN      PTR     ns2.k31.com. // 10.79.3.4


# 🖥️ Node: Erendis
service bind9 restart


# 🖥️ Node: Amdir (10.79.3.4)
apt-get update
apt-get install -y bind9 dnsutils

# Konfigurasi file named.conf.local
nano /etc/bind/named.conf.local

zone "k31.com" {
    type slave;
    masters { 10.79.3.3; }; // Master Erendis
    file "/var/lib/bind/db.k31.com";
};

zone "3.79.10.in-addr.arpa" {
    type slave;
    masters { 10.79.3.3; };
    file "/var/lib/bind/db.10.79.3";
};


# 🖥️ Node: Amdir
service bind9 restart

# Verifikasi transfer zona (file db.k31.com dan db.10.79.3 akan muncul di /var/lib/bind)
ls -l /var/lib/bind | grep k31



# 🖥️ Node: Amdir
service bind9 restart

# Verifikasi transfer zona (file db.k31.com dan db.10.79.3 akan muncul di /var/lib/bind)
ls -l /var/lib/bind | grep k31