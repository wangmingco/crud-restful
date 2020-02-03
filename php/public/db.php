<?php

require __DIR__ . '/../vendor/autoload.php';

use Medoo\Medoo;
 
function getDatabase()
{
    $database = new Medoo([
		// required
		'database_type' => 'mysql',
		'database_name' => 'helloworld',
		'server' => 'localhost',
		'username' => 'root',
		'password' => 'root',
	 
		// [optional]
		'charset' => 'utf8',
		'port' => 3306,
	 
		// [optional] Enable logging (Logging is disabled by default for better performance)
		'logging' => true,
	 
		// [optional] MySQL socket (shouldn't be used with server and port)
		'socket' => '/tmp/mysql.sock',
	 
		// [optional] driver_option for connection, read more from http://www.php.net/manual/en/pdo.setattribute.php
		'option' => [
			PDO::ATTR_CASE => PDO::CASE_NATURAL
		],
	 
		// [optional] Medoo will execute those commands after connected to the database for initialization
		'command' => [
			'SET SQL_MODE=ANSI_QUOTES'
		]
	]);
    return $database;
}

function selectAll() 
{
	$database = getDatabase();
	$data = $database->query("SELECT * FROM helloworld")->fetchAll();
	return $data;
}

print_r(selectAll());