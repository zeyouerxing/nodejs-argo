FROM node:20-alpine

# 使用稳定工作目录（关键）
WORKDIR /app

# 先复制依赖文件（优化构建缓存）
COPY package*.json ./

# 安装依赖
RUN npm install --production

# 再复制源码
COPY . .

# 安装系统依赖（你原来保留）
RUN apk add --no-cache \
    bash \
    openssl \
    curl \
    gcompat \
    iproute2 \
    coreutils

# 暴露端口（Render 会用）
EXPOSE 3000

# 启动命令
CMD ["node", "index.js"]
