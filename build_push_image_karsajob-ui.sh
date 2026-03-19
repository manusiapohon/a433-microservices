#!/bin/bash

# 1. Mengambil variabel dari Environment
# Jika variabel kosong, skrip akan berhenti untuk keamanan
if [ -z "$DOCKER_HUB_USER" ] || [ -z "$DOCKER_HUB_TOKEN" ]; then
    echo "Error: DOCKER_HUB_USER atau DOCKER_HUB_TOKEN belum diatur di environment!"
    exit 1
fi

IMAGE_NAME="karsajobs-ui"
IMAGE_TAG="latest"

# 2. Login ke Docker Hub menggunakan Personal Access Token
echo "--- Login ke Docker Hub ---"
echo $DOCKER_HUB_TOKEN | docker login -u $DOCKER_HUB_USER --password-stdin

# 3. Build Docker Image
echo "--- Memulai proses Build Image: $IMAGE_NAME:$IMAGE_TAG ---"
docker build -t $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG .

# Cek apakah build berhasil
if [ $? -eq 0 ]; then
    echo "--- Build Berhasil! ---"
else
    echo "--- Build Gagal! ---"
    exit 1
fi

# 4. Push Image ke Docker Hub
echo "--- Memulai proses Push ke Docker Hub ---"
docker push $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG

# 5. Logout (Opsional, untuk keamanan tambahan)
docker logout
