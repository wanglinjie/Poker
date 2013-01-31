<?php
include('core.php');

if($_POST){
    $reporter = escape($_POST['reporter']);
    $report_time = date('Y/m/d');
    $contact_num = escape($_POST['contact_num']);
    $department = escape($_POST['department_decode']);
    $place = escape($_POST['place']);
    $broken_item = escape($_POST['broken_item']);
    $reason = escape($_POST['reason']);
    $detail = escape($_POST['detail']);

    update_shire($reporter,$report_time,$contact_num,$department,
        $place,$broken_item,$reason,$detail,0,'','','');
    $smarty->assign('server_msg', '申报成功!');
}

$smarty->display('update.tpl');
?>
