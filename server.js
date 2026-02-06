const express = require('express');
const app = express();
const PORT = 3000;

// 静态文件服务
app.use(express.static('public'));

// 主页路由
app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Docker Web 应用</title>
      <style>
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }
        body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          min-height: 100vh;
          display: flex;
          justify-content: center;
          align-items: center;
        }
        .container {
          background: white;
          padding: 50px;
          border-radius: 10px;
          box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
          max-width: 600px;
          text-align: center;
        }
        h1 {
          color: #667eea;
          margin-bottom: 20px;
          font-size: 2.5em;
        }
        p {
          color: #555;
          font-size: 1.1em;
          line-height: 1.6;
          margin-bottom: 20px;
        }
        .info {
          background: #f0f4ff;
          padding: 20px;
          border-radius: 8px;
          margin: 20px 0;
          border-left: 4px solid #667eea;
        }
        .info strong {
          color: #667eea;
        }
      </style>
    </head>
    <body>
      <div class="container">
        <h1>🐳 Docker Web 应用</h1>
        <p>欢迎来到 Docker 容器中运行的 Web 应用！</p>
        <div class="info">
          <p><strong>✓ 应用正在运行</strong></p>
          <p>这是一个基于 Node.js 和 Express 的简单 Web 服务器</p>
        </div>
        <p>🎉 如果您看到这个页面，说明 Docker 容器已成功启动！</p>
      </div>
    </body>
    </html>
  `);
});

// 健康检查端点
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// 启动服务器
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Web 服务器运行在 http://0.0.0.0:${PORT}`);
});
