<?php

header('Cache-control: public, s-maxage=86400');
header('uri: hola');

echo (date('H:i:s'));
