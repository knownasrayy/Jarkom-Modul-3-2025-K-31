# Jarkom-Modul-3-2025-K-31

## Angggota

| Anggota | NRP  |
| ------- | --- |
| Shinta Alya Ramadani | 5027241016 |
| Rayhan Agnan Kusuma | 5027241102 |

## Prefix IP yang digunakan untuk kelompok K-31

| Nama Kelompok   | Prefix IP |
| ----------- | --------- | 
| K-31         |      10.79   | 

## Nomor 1
<img width="782" height="600" alt="image" src="https://github.com/user-attachments/assets/8cef9fa7-3425-4bf1-9862-d8b24f41b6af" />

#### Glosarium untuk Soal Praktikum Modul 3 :

| Node         | Role / Kategori           | Image Docker              | IP Type         |
|--------------|---------------------------|---------------------------|-----------------|
| **Durin**        | Router (DHCP Relay)       | nevarre/gns3-debi:new     | Dynamic         |
| **Minastir**     | Forward Proxy             | nevarre/gns3-debi:new     | Static          |
| **Aldarion**     | DHCP Server               | nevarre/gns3-debi:new     | Static          |
| **Erendis**      | DNS Master                | nevarre/gns3-debi:new     | Static          |
| **Amdir**        | DNS Slave                 | nevarre/gns3-debi:new     | Static          |
| **Palantir**     | Database Server           | nevarre/gns3-debi:new     | Static          |
| **Narvi**        | Database Slave            | nevarre/gns3-debi:new     | Static          |
| **Elros**        | Load Balancer (Laravel)   | nevarre/gns3-debi:new     | Static          |
| **Pharazon**     | Load Balancer (PHP)       | nevarre/gns3-debi:new     | Static          |
| **Elendil**      | Laravel Worker-1          | nevarre/gns3-debi:new     | Static          |
| **Isildur**      | Laravel Worker-2          | nevarre/gns3-debi:new     | Static          |
| **Anarion**      | Laravel Worker-3          | nevarre/gns3-debi:new     | Static          |
| **Galadriel**    | PHP Worker-1              | nevarre/gns3-debi:new     | Static          |
| **Celeborn**     | PHP Worker-2              | nevarre/gns3-debi:new     | Static          |
| **Oropher**      | PHP Worker-3              | nevarre/gns3-debi:new     | Static          |
| **Miriel**       | Client-Static-1           | nevarre/gns3-debi:new     | Static          |
| **Celebrimbor**  | Client-Static-2           | nevarre/gns3-debi:new     | Static          |
| **Gilgalad**     | Client-Dynamic-1          | nevarre/gns3-debi:new     | Dynamic         |
| **Amandil**      | Client-Dynamic-2          | nevarre/gns3-debi:new     | Dynamic         |
| **Khamul**       | Client-Fixed-Address      | nevarre/gns3-debi:new     | Fixed Address   |

#### Soal (Inisialisasi Node & Akses Internet)
Aktifkan seluruh node (kecuali router Durin sebagai penghubung antar jaringan) dan pastikan setiap node dapat melakukan konektivitas awal ke internet menggunakan nameserver 192.168.122.1 untuk kebutuhan instalasi paket awal.

#### Step by Step
```
# SETUP SEMUA NODE
# Node Durin
auto lo
iface lo inet loopback
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth0
iface eth0 inet dhcp

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

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.79.0.0/16
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


# Node Elendil
auto eth0
iface eth0 inet static
    address 10.79.1.2
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Isildur
auto eth0
iface eth0 inet static
    address 10.79.1.3
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Anarion
auto eth0
iface eth0 inet static
    address 10.79.1.4
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Miriel
auto eth0
iface eth0 inet static
    address 10.79.1.5
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Amandil
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Elros
auto eth0
iface eth0 inet static
    address 10.79.1.7
    netmask 255.255.255.0
    gateway 10.79.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Gilgalad
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Celebrimbor
auto eth0
iface eth0 inet static
    address 10.79.2.3
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Pharazon
auto eth0
iface eth0 inet static
    address 10.79.2.4
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Galadriel
auto eth0
iface eth0 inet static
    address 10.79.2.5
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Celeborn
auto eth0
iface eth0 inet static
    address 10.79.2.6
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Oropher
auto eth0
iface eth0 inet static
    address 10.79.2.7
    netmask 255.255.255.0
    gateway 10.79.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Khamul (Client-Fixed-Address)
auto eth0
iface eth0 inet dhcp
    hwaddress ether 02:42:dc:08:82:00
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Erendis
auto eth0
iface eth0 inet static
    address 10.79.3.3
    netmask 255.255.255.0
    gateway 10.79.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Amdir
auto eth0
iface eth0 inet static
    address 10.79.3.4
    netmask 255.255.255.0
    gateway 10.79.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Aldarion
auto eth0
iface eth0 inet static
    address 10.79.4.2
    netmask 255.255.255.0
    gateway 10.79.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Palantir
auto eth0
iface eth0 inet static
    address 10.79.4.3
    netmask 255.255.255.0
    gateway 10.79.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Narvi
auto eth0
iface eth0 inet static
    address 10.79.4.4
    netmask 255.255.255.0
    gateway 10.79.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Node Minastir
auto eth0
iface eth0 inet static
    address 10.79.5.2
    netmask 255.255.255.0
    gateway 10.79.5.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf


# TEST
# Jaga-jaga jika belum install
apt-get update
apt-get install -y nano dnsutils lynx htop curl apache2-utils

# Node manapun
ping -c 3 8.8.8.8
ping -c 3 google.com
```

## Nomor 2
#### Soal (Konfigurasi DHCP Server & Relay)
Konfigurasikan Aldarion sebagai DHCP Server dan Durin sebagai DHCP Relay. Tetapkan pembagian IP sebagai berikut:
- Klien dinamis manusia: [prefix ip].1.6 – [prefix ip].1.34 dan [prefix ip].1.68 – [prefix ip].1.94
- Klien dinamis elf: [prefix ip].2.35 – [prefix ip].2.67 dan [prefix ip].2.96 – [prefix ip].2.121
- Node Khamul diberikan fixed-address pada [prefix ip].3.95
Pastikan klien menerima IP sesuai kategori dan Durin meneruskan request DHCP ke server.

#### Step by Step
```
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
```

## Nomor 3
#### Soal (Konfigurasi Forward Proxy)
Konfigurasikan Minastir sebagai forward proxy sehingga seluruh node (selain Durin) hanya dapat mengakses jaringan eksternal melalui Minastir.

#### Step by Step
```
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
```

## Nomor 4
#### Soal (Konfigurasi DNS Master–Slave & Domain Utama)
Konfigurasikan Erendis sebagai DNS Master dan Amdir sebagai DNS Slave untuk domain utama <xxxx>.com. Tambahkan record DNS untuk node Palantir, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, dan Oropher sesuai IP masing-masing.

Pastikan replikasi zona DNS antara master dan slave berfungsi.

#### Step by Step
```
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
    also-notify { 10.79.3.4; };     // DNS Slave Amdir
    allow-transfer { 10.79.3.4; };   // Izinkan transfer ke Amdir
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
    also-notify { 10.79.3.4; };     // DNS Slave Amdir
    allow-transfer { 10.79.3.4; };   // Izinkan transfer ke Amdir
};

zone "3.79.10.in-addr.arpa" { // Reverse zone untuk subnet 10.79.3.x
    type master;
    file "/etc/bind/zones/db.10.79.3";
    also-notify { 10.79.3.4; };
    allow-transfer { 10.79.3.4; };
};

# 🖥️ Node: Erendis
nano /etc/bind/zones/db.10.79.3

$TTL    604800
@       IN      SOA     ns1.k31.com. root.k31.com. ( 
                        2025110201  ; Serial (Sama dengan zona maju)
                        // ... nilai lainnya
                        604800 )

@       IN      NS      ns1.k31.com. 
@       IN      NS      ns2.k31.com. 

3       IN      PTR     ns1.k31.com. // 10.79.3.3
4       IN      PTR     ns2.k31.com. // 10.79.3.4


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

```

## Nomor 5
#### Soal (Penambahan Alias, PTR, dan TXT Record)
Tambahkan:
- CNAME alias: www.<xxxx>.com → <xxxx>.com
- PTR record untuk Erendis dan Amdir (reverse DNS)

TXT record:
- "Cincin Sauron" menunjuk ke IP node Elros
- "Aliansi Terakhir" menunjuk ke IP node Pharazon

Pastikan slave menerima seluruh record melalui replikasi.

#### Step by Step

## Nomor 6
#### Soal
Aldarion menetapkan aturan waktu peminjaman tanah. Ia mengatur:
Client Dinamis Keluarga Manusia dapat meminjam tanah selama setengah jam.
Client Dinamis Keluarga Peri hanya seperenam jam.
Batas waktu maksimal peminjaman untuk semua adalah satu jam.
#### Step by Step

## Nomor 7
#### Soal
Para Ksatria Númenor (Elendil, Isildur, Anarion) mulai membangun benteng pertahanan digital mereka menggunakan teknologi Laravel. Instal semua tools yang dibutuhkan (php8.4, composer, nginx) dan dapatkan cetak biru benteng dari Resource-laravel di setiap node worker Laravel. Cek dengan lynx di client.
#### Step by Step

## Nomor 8
#### Soal
Setiap benteng Númenor harus terhubung ke sumber pengetahuan, Palantir. Konfigurasikan koneksi database di file .env masing-masing worker. Setiap benteng juga harus memiliki gerbang masuk yang unik; atur nginx agar Elendil mendengarkan di port 8001, Isildur di 8002, dan Anarion di 8003. Jangan lupa jalankan migrasi dan seeding awal dari Elendil. Buat agar akses web hanya bisa melalui domain nama, tidak bisa melalui ip.
#### Step by Step

## Nomor 9
#### Soal
Pastikan setiap benteng berfungsi secara mandiri. Dari dalam node client masing-masing, gunakan lynx untuk melihat halaman utama Laravel dan curl /api/airing untuk memastikan mereka bisa mengambil data dari Palantir.
#### Step by Step

## Nomor 10
#### Soal
Pemimpin bijak Elros ditugaskan untuk mengkoordinasikan pertahanan Númenor. Konfigurasikan nginx di Elros untuk bertindak sebagai reverse proxy. Buat upstream bernama kesatria_numenor yang berisi alamat ketiga worker (Elendil, Isildur, Anarion). Atur agar semua permintaan yang datang ke domain elros.<xxxx>.com diteruskan secara merata menggunakan algoritma Round Robin ke backend.
#### Step by Step

## Nomor 11
#### Soal
Musuh mencoba menguji kekuatan pertahanan Númenor. Dari node client, luncurkan serangan benchmark (ab) ke elros.<xxxx>.com/api/airing/:
Serangan Awal: -n 100 -c 10 (100 permintaan, 10 bersamaan).
Serangan Penuh: -n 2000 -c 100 (2000 permintaan, 100 bersamaan). Pantau kondisi para worker dan periksa log Elros untuk melihat apakah ada worker yang kewalahan atau koneksi yang gagal.
Strategi Bertahan: Tambahkan weight dalam algoritma, kemudian catat apakah lebih baik atau tidak.
#### Step by Step

## Nomor 12
#### Soal
Para Penguasa Peri (Galadriel, Celeborn, Oropher) membangun taman digital mereka menggunakan PHP. Instal nginx dan php8.4-fpm di setiap node worker PHP. Buat file index.php sederhana di /var/www/html masing-masing yang menampilkan nama hostname mereka. Buat agar akses web hanya bisa melalui domain nama, tidak bisa melalui ip.
#### Step by Step

## Nomor 13
#### Soal
Setiap taman Peri harus dapat diakses. Konfigurasikan nginx di setiap worker PHP untuk meneruskan permintaan file .php ke socket php-fpm yang sesuai. Atur agar Galadriel mendengarkan di port 8004, Celeborn di 8005, dan Oropher di 8006.
#### Step by Step

## Nomor 14
#### Soal
Keamanan adalah prioritas. Terapkan Basic HTTP Authentication pada nginx di setiap worker PHP, sehingga hanya mereka yang tahu kata sandi (user: noldor, pass: silvan) yang bisa masuk.
#### Step by Step

## Nomor 15
#### Soal
Para Peri ingin tahu siapa yang mengunjungi taman mereka. Modifikasi konfigurasi Nginx di worker PHP untuk menambahkan header X-Real-IP yang akan diteruskan ke PHP. Ubah file index.php untuk menampilkan alamat IP pengunjung asli saat ini.
#### Step by Step

## Nomor 16
#### Soal
Raja Númenor terakhir yang ambisius, Pharazon, mencoba mengawasi taman-taman Peri. Konfigurasikan Nginx di Pharazon sebagai reverse proxy. Buat upstream Kesatria_Lorien berisi alamat ketiga worker PHP. Atur agar permintaan ke pharazon.<xxxx>.com diteruskan ke backend, dan pastikan konfigurasi Nginx di Pharazon juga meneruskan informasi Basic Authentication yang dimasukkan pengguna ke worker.
#### Step by Step

## Nomor 17
#### Soal
Dari node client, lakukan benchmark ke pharazon.<xxxx>.com, jangan lupa menyertakan kredensial autentikasi. Amati distribusi beban ke para worker. Kemudian, simulasikan salah satu taman Peri runtuh (misal: service nginx stop di Galadriel) dan jalankan lagi benchmark. Apakah Pharazon masih bisa mengarahkan pengunjung ke taman yang tersisa? Periksa log Pharazon.
#### Step by Step

## Nomor 18
#### Soal
Kekuatan Palantir sangat vital. Untuk melindunginya, konfigurasikan replikasi database Master-Slave menggunakan MariaDB. Jadikan Palantir sebagai Master. Konfigurasikan Narvi sebagai Slave yang secara otomatis menyalin semua data dari Palantir. Buktikan replikasi berhasil dengan membuat tabel baru di Master dan memeriksanya di Slave.
#### Step by Step

## Nomor 19
#### Soal
Gelombang serangan dari Mordor semakin intens. Implementasikan rate limiting pada kedua Load Balancer (Elros dan Pharazon) menggunakan Nginx. Batasi agar satu alamat IP hanya bisa melakukan 10 permintaan per detik. Uji coba dengan menjalankan ab dari satu client dengan konkurensi tinggi (-c 50 atau lebih) dan periksa log Nginx untuk melihat pesan request yang ditolak atau ditunda karena rate limit.
#### Step by Step

## Nomor 20
#### Soal
Beban pada para worker semakin berat. Aktifkan Nginx Caching pada Pharazon untuk menyimpan salinan halaman PHP yang sering diakses. Gunakan curl pada domain nama Pharazon dari client untuk memeriksa response header. Buktikan bahwa permintaan kedua dan seterusnya untuk halaman yang sama mendapatkan status HIT dari cache dan tidak lagi membebani worker PHP.
#### Step by Step
