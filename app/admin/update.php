<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(dirname(APP_ADMIN_ROOT) . '/core.php');
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

if($_POST){
    $consumer = $_SESSION['consumer'];
    $consumer_in_form = escape($_POST['consumer']);
    $origin_password = escape($_POST['origin_password']);
    $password = escape($_POST['password']);
    $re_password = escape($_POST['re_password']);

    if($consumer != $consumer_in_form or $password!=$re_password){
        $smarty->assign('server_msg', 'Error');
    }else{
        $flag = update_consumer_password($consumer, $origin_password, $password);
        if($flag){
            $smarty->assign('server_msg', '修改成功!');
        }else{
            $smarty->assign('server_msg', '原始密码错误!');
        }
    }
}

$smarty->assign('consumer', $_SESSION['consumer']);
$smarty->display('admin/update.tpl');
?>
