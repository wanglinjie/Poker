<?php
include('core.php');

$page = $_GET['p'];
$page = $page == NULL?1:$page;
$total_counts = get_shire_count(-1);
$total = ceil($total_counts/20);
$shires = get_shires(-1, $page);

$smarty->assign('page', $page);
$smarty->assign('total', $total);
$smarty->assign('total_counts', $total_counts);
$smarty->assign('shires', $shires);
$smarty->display('index.tpl');
?>
