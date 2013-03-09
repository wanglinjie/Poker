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
    $total_counts = admin_get_all_shires_count($broken_class);
    $total = ceil($total_counts/20);
    $shires = admin_get_all_shires($page, $broken_class);
}else{
    $total_counts = user_get_all_shires_count($role['role_id'], $broken_class);
    $total = ceil($total_counts/20);
    $shires = user_get_all_shires($role['role_id'], $page, $broken_class);
}

$smarty->assign('page', $page);
$smarty->assign('total_counts', $total_counts);
$smarty->assign('total', $total);
$smarty->assign('shires', $shires);
$smarty->display('admin/show.tpl');
?>
