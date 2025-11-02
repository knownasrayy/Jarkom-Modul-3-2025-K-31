Instalasi Bind9 di Minastir
apt-get update
apt-get install -y bind9

Konfigurasi named.conf.options
nano /etc/bind/named.conf.options

options {
    directory "/var/cache/bind";

    // DNS Master di Erendis (DNS utama)
    forwarders {
        10.79.3.3;       // IP DNS Master (Erendis)
        192.168.122.1;   // Backup ke nameserver eksternal
        8.8.8.8;          // Opsional, DNS publik
    };

    dnssec-validation auto;

    allow-query { any; };
    listen-on-v6 { any; };
};

AKTIVASI SERVICE
ln -s /etc/init.d/named /etc/init.d/bind9

RESTART
service bind9 restart
service bind9 status

TES
dig @10.79.5.2 google.com
host google.com 10.79.5.2
ping -c 3 google.com

nslookup k31.com 10.79.5.2
dig @10.79.5.2 k31.com
