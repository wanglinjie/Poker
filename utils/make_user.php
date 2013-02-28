<?php
require('../libs/db.php');

$db = new DB;
$db->connect();
$db->query("DELETE FROM barrack;");
$db->query("INSERT INTO barrack(consumer, password, role_id) VALUES('admin', '" . md5('123') . "', 1);");
$db->query("INSERT INTO barrack(consumer, password, role_id) VALUES('user1', '" . md5('123') . "', 2);");
?>
