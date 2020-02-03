## 安装 composer
* `curl -sS https://getcomposer.org/installer | php`
* `mv composer.phar /usr/local/bin/composer`

## 安装pdo_mysql扩展
下载电脑上对应的php安装包
1. `cd php-7.4.1/ext/pdo_mysql`
2. `./configure --with-php-config=/usr/bin/php-config --with-pdo-mysql=/usr/local/mysql`
3. `make`
4. `make install`
5. `sudo cp /private/etc/php.ini.default /private/etc/php.ini`
6. `vi /private/etc/php.ini` 添加 `extension=/usr/lib/php/extensions/no-debug-non-zts-20160303/pdo_mysql.so`

## 安装slim
* `composer require slim/slim:"4.*"`
* `composer require slim/psr7`
* `composer require nyholm/psr7 nyholm/psr7-server`
* `composer require guzzlehttp/psr7 http-interop/http-factory-guzzle`
* `composer require catfan/medoo`

或者直接使用
* `composer install` 根据composer.json文件中的依赖进行安装

## 启动服务
* `php -S localhost:5004`
