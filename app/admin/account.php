<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(dirname(APP_ADMIN_ROOT) . '/core.php');
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    header('Location: login.php');
}

if($_POST){
    $consumer = escape($_POST['consumer']);
    $password = escape($_POST['password']);
    $re_password = escape($_POST['re_password']);

    if($password != $re_password){
        $smarty->assign('server_msg', '两次密码不一致!');
    }else{
        $flag = add_new_consumer($consumer, $password);
        if($flag){
            $smarty->assign('server_msg', '添加成功!');
        }else{
            $smarty->assign('server_msg', '用户已存在!');
        }
    }
}

$smarty->display('admin/account.tpl');
?>
