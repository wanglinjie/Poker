<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location:login.php');
    return false;
}

/*TODO
$shires_count_with0state = get_shire_count(0);
$total_shires_count = get_shire_count(-1);
$efficiency = ($total_shires_count-$shires_count_with0state)/($total_shires_count+1);
*/

$role = cache_role();
$smarty->assign('role_id', $role['role_id']);
$smarty->assign('role_type', $role['role_type']);

/*
$smarty->assign('shires_count_with0state', $shires_count_with0state);
$smarty->assign('total_shires_count', $total_shires_count);
$smarty->assign('efficiency', $efficiency);
*/
$smarty->display('admin/index.tpl');
?>
