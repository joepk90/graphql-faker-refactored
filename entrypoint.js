const path = require('path');
const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');


const app = express();
const PORT = process.env.PORT || 8080;

// debug
// app.use((req, res, next) => {
//     console.log(`[Proxy] ${req.method} ${req.url}`);
//     next();
// });

app.use('/api', createProxyMiddleware({ target: 'http://localhost:3000', changeOrigin: true }));
app.use('/', createProxyMiddleware({ target: 'http://localhost:5173', changeOrigin: true }));

app.listen(PORT, () => {
    console.log(`Proxy Server is running on http://localhost:${PORT}`);
});