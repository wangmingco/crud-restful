<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/../vendor/autoload.php';
require 'db.php';

$app = AppFactory::create();

$app->get('/helloworld', function (Request $request, Response $response, $args) {
    $response->getBody()->write("welcome");
    return $response;
});

$app->get('/selectAll', function (Request $request, Response $response, $args) {
    return selectAll();
});

$app->run();