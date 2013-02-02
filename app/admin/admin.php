<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(dirname(APP_ADMIN_ROOT) . '/core.php');
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

$type = $_GET['type'];
$type = $type == NULL?0:$type;
$state = $type;

$page = $_GET['p'];
$page = $page == NULL?1:$page;
$total_counts = get_shire_count($state);
$total = ceil($total_counts/20);
$shires = get_shires($state, $page);

$smarty->assign('type', $type);
$smarty->assign('page', $page);
$smarty->assign('total', $total);
$smarty->assign('total_counts', $total_counts);
$smarty->assign('shires', $shires);
$smarty->display('admin/admin.tpl');
?>
