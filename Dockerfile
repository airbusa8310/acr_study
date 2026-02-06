# 使用 Nginx 官方镜像作为基础镜像
FROM nginx:alpine

# 复制静态文件到 Nginx 默认目录
COPY index.html /usr/share/nginx/html/

# 暴露端口
EXPOSE 80

# Nginx 默认会启动，不需要额外命令
