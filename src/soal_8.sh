# Di Node Elendil (10.79.1.2)
# Buat file Soal_8.sh
cat > Soal_8.sh << 'EOF'
#!/bin/bash
# Script Setup Worker Laravel - Elendil (Soal 8 & 9 Final)

# --- Variabel Konfigurasi ---
NODE_NAME="elendil"
NODE_PORT="8001"
APP_PATH="/var/www/laravel"
DB_HOST="10.79.4.3"
DB_NAME="laravel_db"
DB_USER="laravel_user"
DB_PASS="root123"
DOMAIN="$NODE_NAME.k31.com"

echo "--- STARTING SETUP FOR $NODE_NAME ---"

# [1/5] Kloning Kode dan Instalasi Dependensi
echo "[$NODE_PORT] 1/5: Kloning Kode dan Instalasi Dependensi..."
rm -rf $APP_PATH
git clone https://github.com/elshiraphine/laravel-simple-rest-api $APP_PATH
chown -R www-data:www-data $APP_PATH
git config --global --add safe.directory $APP_PATH

cd $APP_PATH
cp .env.example .env
php artisan key:generate
# composer update dengan mengabaikan versi PHP 8.4
composer update --ignore-platform-reqs --no-dev --optimize-autoloader

# [2/5] Konfigurasi Koneksi Database (.env)
echo "[$NODE_PORT] 2/5: Mengkonfigurasi Koneksi Database (.env)..."
sed -i "s|^APP_URL=.*|APP_URL=http://$DOMAIN|" $APP_PATH/.env
sed -i "s|^DB_HOST=.*|DB_HOST=$DB_HOST|" $APP_PATH/.env
sed -i "s|^DB_DATABASE=.*|DB_DATABASE=$DB_NAME|" $APP_PATH/.env
sed -i "s|^DB_USERNAME=.*|DB_USERNAME=$DB_USER|" $APP_PATH/.env
sed -i "s|^DB_PASSWORD=.*|DB_PASSWORD=$DB_PASS|" $APP_PATH/.env

# [3/5] Migrasi Database (HANYA DI ELENDIL)
echo "[$NODE_PORT] 3/5: Migrasi Database ke Palantir..."
php artisan migrate:fresh --seed
if [ $? -eq 0 ]; then
    echo "   >> Migrasi Sukses! DB Worker sudah disiapkan."
else
    echo "   >> Migrasi GAGAL! Periksa Palantir (0.0.0.0) dan hak akses user."
fi

# [4/5] Konfigurasi Nginx Worker
echo "[$NODE_PORT] 4/5: Konfigurasi Nginx ($DOMAIN @ $NODE_PORT)..."
cat > /etc/nginx/sites-available/$NODE_NAME << EOF_NGINX
server {
    listen $NODE_PORT;
    server_name $DOMAIN;

    # Tolak akses IP (Persyaratan Soal 8)
    if (\$host != \$server_name) {
        return 404;
    }

    root $APP_PATH/public;
    index index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }
}
EOF_NGINX

# [5/5] Aktivasi dan Restart Layanan
echo "[$NODE_PORT] 5/5: Aktivasi Layanan Nginx/PHP..."
ln -s /etc/nginx/sites-available/$NODE_NAME /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default 

service nginx restart
service php8.4-fpm restart
echo "--- SETUP $NODE_NAME SELESAI ---"
EOF

# Jadikan executable dan Jalankan
chmod +x Soal_8.sh
bash Soal_8.sh




# Di Node Palantir (10.79.4.3)
apt update -y
apt install -y mariadb-server mariadb-client
service mariadb start


# Di Node Palantir
mysql -u root 
# Setelah masuk, jalankan perintah SQL ini secara manual:
CREATE DATABASE IF NOT EXISTS laravel_db;
CREATE USER IF NOT EXISTS 'laravel_user'@'%' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'%';
FLUSH PRIVILEGES;
EXIT


# Di Node Palantir
# Mengedit bind-address menjadi 0.0.0.0
sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb restart
# Verifikasi: netstat -tuln | grep 3306 harus menunjukkan 0.0.0.0:3306


# Di Node Elendil (dan nanti di Isildur/Anarion)
rm -rf /var/www/laravel
git clone https://github.com/elshiraphine/laravel-simple-rest-api /var/www/laravel
chown -R www-data:www-data /var/www/laravel
git config --global --add safe.directory /var/www/laravel
cd /var/www/laravel
cp .env.example .env
php artisan key:generate
# Solusi bentrokan versi PHP/Composer:
composer update --ignore-platform-reqs --no-dev --optimize-autoloader


# Di Node Elendil
php artisan migrate:fresh --seed

# Di Node Elendil
# Buat file /etc/nginx/sites-available/elendil (dengan listen 8001, server_name elendil.k31.com)
# Gunakan template dari tutorial sebelumnya.

ln -s /etc/nginx/sites-available/elendil /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service nginx restart
service php8.4-fpm restart