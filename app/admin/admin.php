<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

$role = cache_role();
$smarty->assign('role_id', $role['role_id']);
$smarty->assign('role_type', $role['role_type']);

$broken_class = escape($_GET['broken_class']);

$page = $_GET['p'];
$page = $page == NULL?1:$page;

if($role['role_id'] == 1){
    //后勤管理人员
    //接收参数
    // 是否包含assign_feedback
    $assign_feedback = escape($_GET['assign_feedback']);
    if($assign_feedback){
        $smarty->assign('assign_feedback_admin', 1);
    }
    $total_counts = admin_get_shires_count_with_assign_feedback($assign_feedback, $broken_class);
    $total = ceil($total_counts/20);
    $shires = admin_get_shires_with_assign_feedback($assign_feedback, $page, $broken_class);

    $role_types = get_role_types();
    $smarty->assign('roles', $role_types);    

    $smarty->assign('page', $page);
    $smarty->assign('total_counts', $total_counts);
    $smarty->assign('total', $total);
    $smarty->assign('shires', $shires);
    $smarty->display('admin/admin_show.tpl');
}else{
    //维修人员
    //接收参数
    // 是否包含admin_feedback
    // 是否包含repair_feedback
    $admin_feedback = escape($_GET['admin_feedback']);
    $repair_feedback = escape($_GET['repair_feedback']);
    if($admin_feedback){
        //后勤反馈
        $total_counts = user_get_shires_count_with_admin_feedback($role['role_id'], $broken_class);
        $total = ceil($total_counts/20);
        $shires = user_get_shires_with_admin_feedback($role['role_id'], $page, $broken_class);
        $smarty->assign('page', $page);
        $smarty->assign('total_counts', $total_counts);
        $smarty->assign('total', $total);
        $smarty->assign('shires', $shires);
        $smarty->display('admin/user_callback.tpl');
    }elseif($repair_feedback){
        //维修反馈
        $total_counts = user_get_shires_count_with_repair_feedback($role['role_id'], $broken_class);
        $total = ceil($total_counts/20);
        $shires = user_get_shires_with_repair_feedback($role['role_id'], $page, $broken_class);
        $smarty->assign('page', $page);
        $smarty->assign('total_counts', $total_counts);
        $smarty->assign('total', $total);
        $smarty->assign('shires', $shires);
        $smarty->display('admin/user_feedback.tpl');
    }else{
        //报修新单
        $total_counts = user_get_shires_count($role['role_id']);
        $total = ceil($total_counts/20);
        $shires = user_get_shires($role['role_id'], $page, $broken_class);
        $smarty->assign('page', $page);
        $smarty->assign('total_counts', $total_counts);
        $smarty->assign('total', $total);
        $smarty->assign('shires', $shires);
        $smarty->display('admin/user_show.tpl');
    }
}
?>
