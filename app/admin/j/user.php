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
        'r'     => 0,
        'msg'   => 'auth required!',
    ));
}

$shire_id = escape($_POST['shire_id']);
$feedback = intval(escape($_POST['feedback']));
$request_days = escape($_POST['request_days']);
$extra_data = escape($_POST['extra_data']);

if($feedback == 1){
    $request_days = intval($request_days);
}else{
    $request_days = 0;
}
do_user_feedback($shire_id, $feedback, $request_days, $extra_data);

return jsonize(Array(
    'r'     =>  1,
    'msg'   =>  'succed!',
));
?>
