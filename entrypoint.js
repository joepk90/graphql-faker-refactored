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

app.use('/api', createProxyMiddleware({
    target: 'http://localhost:3000',
    changeOrigin: true,
    pathRewrite: {
      '^/api': '', // removes /api prefix when forwarding
    },
}));

app.use('/', createProxyMiddleware({ target: 'http://localhost:5173', changeOrigin: true }));

app.listen(PORT, () => {
    console.log(`Proxy Server is running on http://localhost:${PORT}`);
});

// Handle graceful shutdown
const shutdown = (msg) => {
    console.log(msg)
    console.log('🛑 Gracefully shutting down...');
    server.close(() => {
        console.log('✅ Server closed.');
        process.exit(0); // Exit cleanly
    });

    // Force exit if still hanging after 10 seconds
    setTimeout(() => {
        console.error('❌ Force exiting...');
        process.exit(1);
    }, 10000);
}

process.on('exit', shutdown)
process.on('SIGINT', shutdown)
process.on('SIGTERM', shutdown)
