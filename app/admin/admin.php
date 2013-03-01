<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

$type = $_GET['type'];
$type = $type == NULL?0:$type;
$state = $type;

$role = cache_role();
$smarty->assign('role_id', $role['role_id']);
$smarty->assign('role_type', $role['role_type']);

$page = $_GET['p'];
$page = $page == NULL?1:$page;

$total_counts = get_shire_count_by_role($state, $role['role_id']);
$total = ceil($total_counts/20);
$shires = get_shires_by_role($state, $role['role_id'], $page);

$all_role_types = get_all_role_types();
$smarty->assign('roles', $all_role_types);

$smarty->assign('type', $type);
$smarty->assign('page', $page);
$smarty->assign('total', $total);
$smarty->assign('total_counts', $total_counts);
$smarty->assign('shires', $shires);
$smarty->display('admin/admin.tpl');
?>
