<?php
function update_shiretest($report_id,$reporter,$department,$broken_item_class,
	$broken_item,$reason,$place,$state,$role_id,$assign_feedback){
	$sql = "INSERT INTO shire(report_id,reporter,department,broken_item_class,"
		."broken_item,reason,place,state,role_id,assign_feedback) VALUES('$report_id',"
		."'$reporter','$department','$broken_item_class','$broken_item','$reason','$place',"
		."'$state','$role_id','$assign_feedback');";
    $db = new DB;
    $db->connect();
    $db->query($sql);
}
?>