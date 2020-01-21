## 安装 composer
* `curl -sS https://getcomposer.org/installer | php`
* `mv composer.phar /usr/local/bin/composer`

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
