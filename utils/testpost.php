<?php
require('../libs/db.php');
require('../app/utils/helper.php');
require('../app/utils/helpfun.php');
require('../app/admin/j/helper.php');//

$report_id=escape($_POST['report_id']);
$reporter=escape($_POST['reporter']);
$department=escape($_POST['department']);
$broken_item_class=escape($_POST['broken_item_class']);
$broken_item=escape($_POST['broken_item']);
$reason=escape($_POST['reason']);
$place=escape($_POST['place']);
$state=escape($_POST['state']);
$role_id=escape($_POST['role_id']);
$assign_feedback=escape($_POST['assign_feedback']);
$type=escape($_POST['type']); 

/*
if($type == 'add'){
	return jsonize(Array('r'=>1, 'msg'=>'Hello'));
}
*/

if($type=='add')
{
	update_shiretest($report_id,$reporter,$department,$broken_item_class,
	$broken_item,$reason,$place,$state,$role_id,$assign_feedback);
	return jsonize(Array('r'=>1, 'msg'=>'Hello'));
}
	/*
	$auth_check = check_reporter($report_id, $reporter);
	if(!$auth_check)
	{
		return jsonize(Array('r'=>1, 'msg'=>'Hello'));	
	}
	else
	{
		*/
/*		
	}
}
else
{
	echo "hello";
}
*/
?>
