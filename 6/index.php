<?php
echo "Hola: " . isset($_POST['name']) ? $_POST['name'] : ' nadie';
?>
<form action="index.php" method="post">
    Nombre <input type="text" name="name">
    <input type="submit" />
</form>
