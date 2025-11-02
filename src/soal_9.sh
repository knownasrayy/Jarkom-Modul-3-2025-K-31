# Di Node Klien (misalnya Amandil)

echo "--- UJI ELENDIL (8001) ---"
# Cek status HTTP (harus 200) dan tampilkan 5 baris pertama konten
curl -s -w "%{http_code}\n" http://elendil.k31.com:8001 | head -n 5

echo "--- UJI ISILDUR (8002) ---"
curl -s -w "%{http_code}\n" http://isildur.k31.com:8002 | head -n 5

echo "--- UJI ANARION (8003) ---"
curl -s -w "%{http_code}\n" http://anarion.k31.com:8003 | head -n 5

# Di Node Klien (misalnya Amandil)

echo "--- UJI INTEGRASI DATABASE PALANTIR (API) ---"

# Uji Elendil: Mencari JSON 'success' atau 'data'
curl -s http://elendil.k31.com:8001/api/airing | grep -E '("success":true|"data":\[)'

# Uji Isildur: Mencari JSON 'success' atau 'data'
curl -s http://isildur.k31.com:8002/api/airing | grep -E '("success":true|"data":\[)'

# Uji Anarion: Mencari JSON 'success' atau 'data'
curl -s http://anarion.k31.com:8003/api/airing | grep -E '("success":true|"data":\[)'