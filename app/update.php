<?php
include('core.php');

if($_POST){
    $reporter = escape($_POST['reporter']);
    $report_id = escape($_POST['report_id']);
    $report_time = date('Y/m/d');
    $contact_num = escape($_POST['contact_num']);
    $department = escape($_POST['department_decode']);
    $place = escape($_POST['place']);
    $broken_item = escape($_POST['broken_item']);
    $reason = escape($_POST['reason']);
    $detail = escape($_POST['detail']);
    $filename = escape($_POST['filename']);
    $ip = $_SERVER['REMOTE_ADDR'];

    $auth_check = check_reporter($report_id, $reporter);
    if(!$auth_check){
        $smarty->assign('check_msg', '提交的工号/学生号与姓名不符.将由工作人员进行审核.');
    }
    $check = $check == True?1:0;
    update_shire($reporter,$report_id,$report_time,$contact_num,$department,
        $place,$broken_item,$reason,$detail, $filename, 0,'','','', $check, $ip);
    $smarty->assign('server_msg', '申报成功!');
}

$smarty->display('update.tpl');
?>
