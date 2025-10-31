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

## Nomor 2
#### Soal (Konfigurasi DHCP Server & Relay)
Konfigurasikan Aldarion sebagai DHCP Server dan Durin sebagai DHCP Relay. Tetapkan pembagian IP sebagai berikut:
- Klien dinamis manusia: [prefix ip].1.6 – [prefix ip].1.34 dan [prefix ip].1.68 – [prefix ip].1.94
- Klien dinamis elf: [prefix ip].2.35 – [prefix ip].2.67 dan [prefix ip].2.96 – [prefix ip].2.121
- Node Khamul diberikan fixed-address pada [prefix ip].3.95
Pastikan klien menerima IP sesuai kategori dan Durin meneruskan request DHCP ke server.

#### Step by Step

## Nomor 3
#### Soal (Konfigurasi Forward Proxy)
Konfigurasikan Minastir sebagai forward proxy sehingga seluruh node (selain Durin) hanya dapat mengakses jaringan eksternal melalui Minastir.

#### Step by Step

## Nomor 4
#### Soal (Konfigurasi DNS Master–Slave & Domain Utama)
Konfigurasikan Erendis sebagai DNS Master dan Amdir sebagai DNS Slave untuk domain utama <xxxx>.com. Tambahkan record DNS untuk node Palantir, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, dan Oropher sesuai IP masing-masing.

Pastikan replikasi zona DNS antara master dan slave berfungsi.

#### Step by Step

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
