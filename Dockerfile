FROM node:alpine3.20

# 只有这一行变了：把 /tmp 改成 /app 或 /home/node
WORKDIR /app  

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash &&\
    chmod +x app.js &&\
    npm install

CMD ["node", "app.js"]
