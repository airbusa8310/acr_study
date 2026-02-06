# 使用阿里云公共镜像库中的 Nginx 镜像作为基础镜像
From registry.openanolis.cn/openanolis/nginx:1.14.1-8.6

# 复制静态文件到 Nginx 默认目录
COPY index.html /usr/share/nginx/html/

# 暴露端口
EXPOSE 80

# Nginx 默认会启动，不需要额外命令
