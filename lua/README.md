## 安装openresty
1. `brew install openresty/brew/openresty`

## 配置nginx
将nginx可执行文件添加到PATH环境变量上
1. `PATH=/usr/local/Cellar/openresty/1.15.8.2/nginx/sbin/nginx:$PATH`

## 启动服务
1. `nginx -p \`pwd\`/ -c conf/nginx.conf`
