<?php
include('core.php');

$page = $_GET['p'];
$page = $page == NULL?1:$page;
$total = get_shire_count(-1);
$shires = get_shires(-1, $page);

$smarty->assign('shires', $shires);
$smarty->display('index.tpl');
?>
