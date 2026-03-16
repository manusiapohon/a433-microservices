#!/bin/bash

# 1. Membuat Docker image dari Dockerfile dengan nama item-app dan tag v1
echo "Membangun image item-app:v1..."
docker build -t item-app:v1 .

# 2. Melihat daftar image di lokal
echo "Daftar image di lokal saat ini:"
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub (tagging)
# Format: docker tag [image_lokal]:[tag] [username]/[nama_repo]:[tag]
echo "Memberi tag untuk Docker Hub..."
docker tag item-app:v1 trmns/item-app-dicoding:v1

# 4. Login ke Docker Hub via Terminal menggunakan Personal Access Token (PAT)
# Catatan: Sangat disarankan untuk menyimpan TOKEN dalam environment variable demi keamanan
echo "Melakukan login ke Docker Hub..."
echo $PASSWORD_DOCKER_HUB | docker login -u trmns --password-stdin

# 5. Mengunggah image ke Docker Hub
echo "Mengunggah image ke repository trmns/item-app-dicoding..."
docker push trmns/item-app-dicoding:v1

echo "Proses selesai!"
