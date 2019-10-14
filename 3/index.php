<html>
<head></head>
<body>
<?php
header('Cache-Control: public, s-maxage=20');
echo date('H:i:s');
?>
<esi:include src="esi.php" ></esi:include>
</body>
</html>
