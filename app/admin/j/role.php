<?php
define('ADMIN_AJAX_ROOT', dirname(__FILE__));
define('APP_ADMIN_ROOT', dirname(ADMIN_AJAX_ROOT));
define('APP_ROOT', dirname(APP_ADMIN_ROOT));
define('SMARTY_APP_ROOT', dirname(APP_ROOT));
define('SMARTY_LIB_ROOT', SMARTY_APP_ROOT . '/libs');
include(ADMIN_AJAX_ROOT . '/helper.php');
include(APP_ADMIN_ROOT . '/middleware.php');

if(auth_check() == false){
    return jsonize(Array(
        'r'     =>  0,
        'msg'   => 'auth required!',
    ));
}

$type = escape($_POST['type']);
if($type == 'add'){
    $role_type = escape($_POST['role_type']);
    $r = add_role_type($role_type);
    if($r == 0){
        $msg = '类型已存在!';
    }
}elseif($type == 'del'){
    $role_id = escape($_POST['role_id']);
    $r = del_role_type($role_id);
    if($r == 0){
        $msg = '存在该身份类型的用户.若想删除请联系管理员!';
    }
}

return jsonize(Array(
    'r'     =>  $r,
    'msg'   =>  $msg
));
?>
