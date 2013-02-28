<?php
require('../libs/db.php');

$sql = "INSERT INTO role(role_id, role_type) "
     . "VALUES(%s, '%s');";

$db = new DB;
$db->connect();
$db->query("DELETE FROM role;");
$db->query("INSERT INTO role(role_id, role_type) VALUES(1, '管理员');");
$db->query("INSERT INTO role(role_id, role_type) VALUES(2, '电气维修人员');");
?>
