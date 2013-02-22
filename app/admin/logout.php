<?php
define('APP_ADMIN_ROOT', dirname(__FILE__));
include(APP_ADMIN_ROOT . '/middleware.php');

logout();
header('Location:' . $url_domain . '/index.php');
?>
