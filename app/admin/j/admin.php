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

if($type == 'admin'){
    $shire_id = escape($_POST['shire_id']);
    $state = escape($_POST['state']);
    $state_context = escape($_POST['state_context']);
    $feedback = escape($_POST['feedback']);

    change_shire_state($shire_id, $state, $state_context, $feedback);
}elseif($type == 'assign'){
    $shire_id = escape($_POST['shire_id']);
    $role_id = escape($_POST['role_id']);

    assign_shire_to_role($shire_id, $role_id);
}

return jsonize(Array(
    'r'     =>  1,
    'msg'   =>  'succed!',
));
?>
