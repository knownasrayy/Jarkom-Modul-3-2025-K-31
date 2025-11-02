# 🖥️ Di Elendil, Isildur, dan Anarion
ping -c 3 8.8.8.8
ping -c 3 google.com

# Jika resolusi DNS gagal (ping google.com gagal), gunakan nameserver publik sementara:
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# 🖥️ Di Elendil, Isildur, dan Anarion

# Hapus file sources list PHP lama (jika ada error)
rm -f /etc/apt/sources.list.d/php.list
rm -f /etc/apt/sources.list.d/debian.sources # (Hanya jika perlu)

# Tambahkan source list Debian dasar (jika hilang)
cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian stable main contrib non-free
deb http://deb.debian.org/debian stable-updates main contrib non-free
deb http://deb.debian.org/debian-security stable-security main contrib non-free
EOF

# Update & Instal paket dasar
apt-get update
apt-get install -y lsb-release ca-certificates curl wget gnupg unzip nginx

# Tambahkan repository PHP 8.4 (Sury)
mkdir -p /etc/apt/keyrings
wget -qO /etc/apt/keyrings/sury.gpg https://packages.sury.org/php/apt.gpg
echo "deb [signed-by=/etc/apt/keyrings/sury.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt-get update

# Instal PHP 8.4, Composer, dan ekstensi yang diperlukan
apt-get install -y php8.4 php8.4-cli php8.4-fpm php8.4-mbstring php8.4-xml php8.4-curl composer

# Verifikasi:
php -v
service php8.4-fpm status



# 🖥️ Di Elendil, Isildur, dan Anarion

# Hapus simulasi index.html sebelumnya (jika ada)
rm -rf /var/www/laravel

# Kloning cetak biru benteng (Resource-Laravel)
git clone https://github.com/elshiraphine/laravel-simple-rest-api /var/www/laravel
chown -R www-data:www-data /var/www/laravel # Tetapkan ownership
git config --global --add safe.directory /var/www/laravel # Perbaiki isu git ownership

# Instal Dependensi (Hanya jika belum dilakukan di Soal 8)
cd /var/www/laravel
composer update --ignore-platform-reqs --no-dev --optimize-autoloader



# 🖥️ Di Elendil, Isildur, dan Anarion
nano /etc/nginx/sites-available/default

# Hapus/Ganti isi default dengan konfigurasi ini:
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/laravel/public;
    index index.php index.html;

    server_name _;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }
}

# Aktifkan dan restart layanan
service nginx restart
service php8.4-fpm restart



# 🖥️ Di Node Klien (misal Amandil)

# Instal lynx (jika belum terinstal)
apt-get update && apt-get install -y lynx

# Akses tiap worker (via IP karena DNS belum diatur sepenuhnya)
lynx 10.79.1.2 # Elendil
lynx 10.79.1.3 # Isildur
lynx 10.79.1.4 # Anarion
