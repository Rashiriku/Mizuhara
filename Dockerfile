FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  npm i pm2 \
  pm2 start heart.js \
  pm2 save \
  pm2 logs \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

CMD ["node", "index.js"]
COPY package.json .

RUN npm install

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
