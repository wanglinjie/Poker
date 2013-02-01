<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(dirname(APP_ADMIN_ROOT) . '/core.php');
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location:login.php');
    return false;
}

$smarty->display('admin/index.tpl');
?>
