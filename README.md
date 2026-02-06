# Docker Web 应用

这是一个简单的 Docker 化 Web 应用示例。

## 项目结构

```
docker/
├── Dockerfile          # Docker 构建配置文件
├── server.js          # Express 服务器主文件
├── package.json       # Node.js 依赖配置
├── .dockerignore      # Docker 构建时忽略的文件
└── README.md          # 项目说明文档
```

## 构建镜像

```bash
# 构建镜像（标签为 my-web-app:1.0）
docker build -t my-web-app:1.0 .

# 或者使用最新标签
docker build -t my-web-app:latest .
```

## 运行容器

```bash
# 运行容器，将本地 3000 端口映射到容器的 3000 端口
docker run -p 3000:3000 my-web-app:1.0

# 后台运行容器
docker run -d -p 3000:3000 --name my-web-container my-web-app:1.0

# 查看运行中的容器
docker ps

# 停止容器
docker stop my-web-container

# 删除容器
docker rm my-web-container
```

## 访问应用

构建并运行容器后，在浏览器中访问：

- **主页**: http://localhost:3000
- **健康检查**: http://localhost:3000/health

## Dockerfile 说明

- **FROM node:18-alpine**: 使用官方 Node.js 18 镜像（Alpine Linux 基础，体积小）
- **WORKDIR /app**: 设置容器内工作目录
- **COPY**: 复制项目文件到容器
- **RUN npm install**: 安装生产环境依赖
- **EXPOSE 3000**: 暴露 3000 端口
- **CMD**: 启动应用程序

## 查看镜像信息

```bash
# 查看镜像大小和信息
docker images my-web-app

# 查看镜像历史
docker history my-web-app:1.0

# 进入运行中的容器
docker exec -it my-web-container /bin/sh
```

## 清理资源

```bash
# 删除镜像
docker rmi my-web-app:1.0

# 删除所有未使用的镜像
docker image prune
```

## 优化建议

如果想进一步优化镜像，可以考虑：

1. **多阶段构建**: 在 Dockerfile 中使用多个 FROM 语句
2. **缓存优化**: 调整 COPY 和 RUN 命令的顺序
3. **健康检查**: 在 Dockerfile 中添加 HEALTHCHECK 指令
4. **安全性**: 使用非 root 用户运行容器
