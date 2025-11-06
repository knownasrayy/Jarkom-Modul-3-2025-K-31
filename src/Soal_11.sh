# Di Node Klien (Amandil, Gilgalad, atau Khamul)
# Buat file Soal_11.sh
cat > Soal_11.sh << 'EOF'
#!/bin/bash
# Script Benchmark Serangan dan Strategi Bertahan (Soal 11)

LB_DOMAIN="elros.k31.com"

echo "--- STARTING SOAL 11: BENCHMARK SERANGAN PADA ELROS ---"

# [1/4] Instalasi Prasyarat (Apache Benchmark)
echo "[1/4] Memastikan Apache Benchmark (ab) terinstal..."
apt-get update > /dev/null 2>&1
apt-get install -y apache2-utils > /dev/null 2>&1

# [2/4] Serangan Awal (Verifikasi Round Robin)
# Serangan Awal: 100 permintaan (-n 100), 10 bersamaan (-c 10)
echo -e "\n[2/4] Serangan Awal (Verifikasi Round Robin):"
echo "Running: ab -n 100 -c 10 http://$LB_DOMAIN/api/airing"
ab -n 100 -c 10 http://$LB_DOMAIN/api/airing | grep -E 'Failed requests:|Time per request:|Requests per second:'

echo ">>> VERIFIKASI: Cek log Nginx di Elendil, Isildur, Anarion. Distribusi harus 33/33/33."
sleep 5

# [3/4] Serangan Penuh (Menguji Batas Sistem)
# Serangan Penuh: 2000 permintaan (-n 2000), 100 bersamaan (-c 100)
echo -e "\n[3/4] Serangan Penuh (Analisis Beban):"
echo "Running: ab -n 2000 -c 100 http://$LB_DOMAIN/api/airing"
ab -n 2000 -c 100 http://$LB_DOMAIN/api/airing | grep -E 'Failed requests:|Time per request:|Requests per second:'

echo ">>> ANALISIS: Cek htop pada worker dan /var/log/nginx/error.log di Elros untuk kegagalan."

# --- STRATEGI BERTAHAN (Weight) ---
echo -e "\n[4/4] Strategi Bertahan: Implementasi Weight dan Uji Ulang."
echo ">>> AKSI: Secara manual, edit /etc/nginx/sites-available/elros-lb.conf di Elros:"
echo "upstream kesatria_numenor { server 10.79.1.2:8001 weight=3; server 10.79.1.3:8002; server 10.79.1.4:8003; }"
echo ">>> AKSI: Jalankan 'service nginx restart' di Elros."

# Uji Ulang Serangan Penuh dengan Weight
echo -e "\nUji Ulang Serangan Penuh dengan Weight (2000 Requests, 100 Concurrency):"
ab -n 2000 -c 100 http://$LB_DOMAIN/api/airing | grep -E 'Failed requests:|Time per request:|Requests per second:'

echo -e "\n--- VERIFIKASI SOAL 11 SELESAI ---"
EOF

# Jadikan executable dan Jalankan
chmod +x Soal_11.sh
bash Soal_11.sh