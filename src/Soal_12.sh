# 🖥️ Jalankan di Galadriel, Celeborn, dan Oropher

# 1. Instalasi Dasar
apt-get update
apt-get install -y nginx php8.4 php8.4-fpm

# 2. Siapkan Direktori & File Web
mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# 3. Buat File index.php (Menampilkan Hostname)
cat > /var/www/html/index.php <<'EOF'
<?php
echo "Hostname: " . htmlspecialchars(gethostname(), ENT_QUOTES, 'UTF-8') . "\n";
?>
EOF


# 🖥️ Node: Galadriel (10.79.2.5)
cat > /etc/nginx/sites-available/galadriel <<'EOF'
server {
    listen 8004;
    server_name galadriel.k31.com;

    # Soal 12: Tolak akses via IP, hanya izinkan domain
    if ($host != "galadriel.k31.com") {
        return 444; # Mengembalikan koneksi kosong/ditolak
    }

    root /var/www/html;
    index index.php index.html index.htm;

    # Soal 13: Konfigurasi FastCGI untuk PHP-FPM
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF
ln -s /etc/nginx/sites-available/galadriel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service php8.4-fpm restart; service nginx restart



# 🖥️ Node: Celeborn (10.79.2.6)
# Ulangi konfigurasi di atas, ubah listen ke 8005 dan server_name ke celeborn.k31.com.
ln -s /etc/nginx/sites-available/celeborn /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service php8.4-fpm restart; service nginx restart


# 🖥️ Node: Oropher (10.79.2.7)
# Ulangi konfigurasi di atas, ubah listen ke 8006 dan server_name ke oropher.k31.com.
ln -s /etc/nginx/sites-available/oropher /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service php8.4-fpm restart; service nginx restart


# 🖥️ Node: Client (Amandil)

# Uji Galadriel
curl http://galadriel.k31.com:8004
# Hasil: Hostname: galadriel

# Uji Celeborn
curl http://celeborn.k31.com:8005
# Hasil: Hostname: celeborn

# Uji Oropher
curl http://oropher.k31.com:8006
# Hasil: Hostname: oropher

# Uji Pembatasan IP (Coba akses via IP)
# curl http://10.79.2.5:8004 
# Hasil: (Harus gagal, ditolak/empty reply 444)


