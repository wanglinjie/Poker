<?php
require('../libs/db.php');

$sql = "INSERT INTO shire(reporter,report_time,contact_num,department,place,reason,"
     . "broken_item,state,state_context,repair_time,feedback) VALUES('小黑','2013/01/31',"
     . "'18963168043','三公寓','二层厕所','厕所堵了','厕所',0,'','','')";

$db = new DB;
$db->connect();

$index = 0;
while($index<40){
    $db->query($sql);
    $index += 1;
}
?>
