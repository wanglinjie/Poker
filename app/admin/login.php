<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check()){
    header('Location: index.php');
}

if($_POST){
    $consumer = escape($_POST['consumer']);
    $password = escape($_POST['password']);
    $remember = escape($_POST['remember']);

    $role_id = consumer_check($consumer, $password);
    if($role_id){
        if($remember){
            setcookie('consumer', $consumer, time()+3600);
            setcookie('role_id', $role_id, time()+3600);
        }
        login($consumer, $role_id);
        cache_role();
        header('Location:index.php');
    }else{
        $smarty->assign('server_msg', '登陆失败');
    }
}

$smarty->display('admin/login.tpl');
?>
