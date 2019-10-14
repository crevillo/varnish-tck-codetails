<?php
require __DIR__ . '/../vendor/autoload.php';

use Symfony\Component\HttpClient\HttpClient;

$client = HttpClient::create();
$response = $client->request(
    'BAN',
    'http://varnish',
    ['headers' => [
        'uri' => 'hola'
    ]]
);
