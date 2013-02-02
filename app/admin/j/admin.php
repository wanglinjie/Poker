<?php
define('ADMIN_AJAX_ROOT', dirname(__FILE__));
define('APP_ADMIN_ROOT', dirname(ADMIN_AJAX_ROOT));
define('APP_ROOT', dirname(APP_ADMIN_ROOT));
define('SMARTY_APP_ROOT', dirname(APP_ROOT));
define('SMARTY_LIB_ROOT', SMARTY_APP_ROOT . '/libs');
include(ADMIN_AJAX_ROOT . '/helper.php');
include(APP_ADMIN_ROOT . '/middleware.php');
include(SMARTY_LIB_ROOT . '/db.php');
include(APP_ROOT . '/utils/helper.php');

if(auth_check() == false){
    return jsonize(Array(
        'r'     =>  0,
        'msg'   => 'auth required!',
    ));
}

$shire_id = escape($_POST['shire_id']);
$state = escape($_POST['state']);
$state_context = escape($_POST['state_context']);
$feedback = escape($_POST['feedback']);

change_shire_state($shire_id, $state, $state_context, $feedback);
return jsonize(Array(
    'r'     =>  1,
    'msg'   =>  'succed!',
));
?>
