<?php
define('APP_ROOT', dirname(__FILE__));
define('SMARTY_APP_ROOT', dirname(APP_ROOT));
define('SMARTY_LIB_ROOT', SMARTY_APP_ROOT . '/libs');

require(SMARTY_LIB_ROOT . '/smarty.php');
require(SMARTY_LIB_ROOT . '/db.php');
require(APP_ROOT . '/utils/helper.php');

$smarty = new MySmarty;
$url_domain = get_url_domain();
$smarty->assign('domain', $url_domain);
$smarty->assign('public', $url_domain . '/static');
?>
