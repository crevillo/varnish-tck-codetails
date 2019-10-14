<?php
header('Cache-Control: public, s-maxage=30');
header('Vary: ' . $_SERVER['HTTP_USER_AGENT']);
echo "AHORA Soy un: " . $_SERVER['HTTP_USER_AGENT'];
