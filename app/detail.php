<?php
include('core.php');

$id = $_GET['id'];
$shire = get_shire_by_id($id);
$smarty->assign('shire', $shire);

$smarty->display('detail.tpl');
?>
