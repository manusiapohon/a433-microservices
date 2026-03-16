# 1. Menggunakan base image Node.js versi 14
FROM node:14

# 2. Menentukan bahwa working directory untuk container adalah /app
WORKDIR /app

# 3. Menyalin seluruh source code ke working directory di container
COPY . .

# 4. Menentukan environment variable (production mode & database host)
ENV NODE_ENV=production DB_HOST=item-db

# 5. Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# 6. Ekspos port yang digunakan oleh aplikasi
EXPOSE 8080

# 7. Jalankan server saat container diluncurkan
CMD ["npm", "start"]
