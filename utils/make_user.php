<?php
require('../libs/db.php');

$sql = "INSERT INTO barrack(consumer, password) "
     . "VALUES('user1','" . md5('123') . "');";

$db = new DB;
$db->connect();
$db->query($sql);
?>
