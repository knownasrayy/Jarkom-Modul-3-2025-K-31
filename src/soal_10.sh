# 🖥️ Node: Erendis (10.79.3.3)

# 1. Edit file zona maju (/etc/bind/zones/db.k31.com)
nano /etc/bind/zones/db.k31.com
# Tambahkan/Ubah baris Elros:
elros           IN       A       10.79.1.7 

# 2. Wajib: Tingkatkan Serial Number di SOA record (misal: 2025110201 -> 2025110202)
# 3. Restart BIND9
service bind9 restart


# 🖥️ Node: Elros (10.79.1.7)

# 1. Pastikan Nginx terinstal
apt-get update && apt-get install -y nginx

# 2. Buat file konfigurasi Load Balancer (/etc/nginx/sites-available/elros-lb.conf)
cat > /etc/nginx/sites-available/elros-lb.conf << EOF
# Upstream untuk Worker Laravel (Ksatria Numenor)
upstream kesatria_numenor {
    # Round Robin adalah default
    server 10.79.1.2:8001; # Elendil
    server 10.79.1.3:8002; # Isildur
    server 10.79.1.4:8003; # Anarion
}

server {
    listen 80;
    server_name elros.k31.com; 

    # Blokir akses IP (memastikan akses hanya lewat domain, Soal 8)
    if (\$host != \$server_name) {
        return 404;
    }

    location / {
        # Teruskan permintaan ke upstream Round Robin
        proxy_pass http://kesatria_numenor;

        # Header yang diperlukan
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# 3. Aktifkan dan Restart Nginx
ln -s /etc/nginx/sites-available/elros-lb.conf /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default 
service nginx restart


# 🖥️ Node: Client (Amandil, Gilgalad, atau Khamul)

# 1. Instal apache2-utils (ab)
apt-get update && apt-get install -y apache2-utils

# 2. Serangan Awal: 100 permintaan (-n 100), 10 bersamaan (-c 10)
echo "--- UJI DISTRIBUSI ROUND ROBIN ---"
ab -n 100 -c 10 http://elros.k31.com/api/airing

# 3. Verifikasi Log Nginx di Worker (Elendil, Isildur, dan Anarion)
# Output harus menunjukkan request didistribusikan secara merata (~33-34 request per worker).
tail /var/log/nginx/access.log