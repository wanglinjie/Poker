<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

$role = cache_role();
$smarty->assign('role_id', $role['role_id']);
$smarty->assign('role_type', $role['role_type']);

$part_role_types = get_part_role_types();
$smarty->assign('roles', $part_role_types);
$smarty->display('admin/manage_role.tpl');
?>
