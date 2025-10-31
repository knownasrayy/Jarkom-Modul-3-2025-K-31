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
#### Step by Step

## Nomor 7
#### Soal
#### Step by Step

## Nomor 8
#### Soal
#### Step by Step

## Nomor 9
#### Soal
#### Step by Step

## Nomor 10
#### Soal
#### Step by Step

## Nomor 11
#### Soal
#### Step by Step

## Nomor 12
#### Soal
#### Step by Step

## Nomor 13
#### Soal
#### Step by Step

## Nomor 14
#### Soal
#### Step by Step

## Nomor 15
#### Soal
#### Step by Step

## Nomor 16
#### Soal
#### Step by Step

## Nomor 17
#### Soal
#### Step by Step

## Nomor 18
#### Soal
#### Step by Step

## Nomor 19
#### Soal
#### Step by Step

## Nomor 20
#### Soal
#### Step by Step
