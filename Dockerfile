# 使用你私有阿里云镜像仓库中的 Nginx 镜像作为基础镜像
FROM registry.cn-shanghai.aliyuncs.com/ack_namespace1/nginx:alpine

# 复制静态文件到 Nginx 默认目录
COPY index.html /usr/share/nginx/html/

# 暴露端口
EXPOSE 80

# Nginx 默认会启动，不需要额外命令
