# menggunakan base image Node.js versi 21 (Alpine Linux)
FROM node:21-alpine

# Menentukan working directory
WORKDIR /app

# Menyalin source code ke working directory di container
COPY . .

# Install dependencies
RUN npm install

# Mengekspos port yang digunakan aplikasi yaitu 3001
EXPOSE 3001

# Menjalankan Server
CMD ["npm", "start"]
