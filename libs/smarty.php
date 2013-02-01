<?php

//smarty.php
//  load the smarty libs and initialize the smarty class.

$libs_path = dirname(__FILE__);
$smarty_root = dirname($libs_path);

define('SMARTY_LIB_PATH', $libs_path . '/Smarty/Smarty.class.php');
define('SMARTY_TEMPLATE_PATH', $smarty_root . '/templates/');
define('SMARTY_COMPILE_PATH', $smarty_root . '/templates_c/');
define('SMARTY_CONFIG_PATH', $smarty_root . '/configs/');
define('SMARTY_CACHE_PATH', $smarty_root . '/cache/');

require_once(SMARTY_LIB_PATH);

class MySmarty extends Smarty{
    function __construct(){
        $this->Smarty();
        $this->template_dir = SMARTY_TEMPLATE_PATH;
        $this->compile_dir = SMARTY_COMPILE_PATH;
        $this->config_dir = SMARTY_CONFIG_PATH;
        $this->cache_dir = SMARTY_CACHE_PATH;

        //other smarty configurations
        //..
    }
}
?>
