#!/bin/bash

# Docker 静态网站构建和运行脚本

echo "🐳 Docker 静态网站构建脚本"
echo "================================"

# 检查 Docker 是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ Docker 未安装！"
    echo "请先安装 Docker Desktop:"
    echo "1. 访问: https://docs.docker.com/desktop/install/mac-install/"
    echo "2. 下载并安装 Docker Desktop for Mac"
    echo "3. 启动 Docker Desktop 应用程序"
    exit 1
fi

echo "✅ Docker 已安装"

# 检查 Docker 是否运行
if ! docker info &> /dev/null; then
    echo "❌ Docker 未运行！"
    echo "请启动 Docker Desktop 应用程序"
    exit 1
fi

echo "✅ Docker 正在运行"

# 构建镜像
echo ""
echo "🔨 正在构建镜像..."
if docker build -t my-static-site:1.0 .; then
    echo "✅ 镜像构建成功！"
else
    echo "❌ 镜像构建失败！"
    exit 1
fi

# 运行容器
echo ""
echo "🚀 正在启动容器..."
if docker run -d -p 8080:80 --name my-static-container my-static-site:1.0; then
    echo "✅ 容器启动成功！"
    echo ""
    echo "🌐 网站已启动！"
    echo "访问地址: http://localhost:8080"
    echo ""
    echo "📋 管理命令:"
    echo "  查看运行状态: docker ps"
    echo "  停止容器:     docker stop my-static-container"
    echo "  删除容器:     docker rm my-static-container"
    echo "  删除镜像:     docker rmi my-static-site:1.0"
else
    echo "❌ 容器启动失败！"
    exit 1
fi