<?php
include('core.php');

if($_GET){
    $search = escape($_GET['search']);
    preg_match('/#2013(\d+)$/', $search, $matches);
    if($matches){
        $shires = find_shires($matches[1]);
        $smarty->assign('query_result', True);
        $smarty->assign('shires', $shires);
    }else{
        $smarty->assign('server_msg', '搜索字符串不合法!');
    }
}

$smarty->display('search.tpl');
?>
