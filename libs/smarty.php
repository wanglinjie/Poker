<?php

//smarty.php
//  load the smarty libs and initialize the smarty class.

define('SMARTY_LIB_PATH', 'Smarty/Smarty.class.php');
define('SMARTY_TEMPLATE_PATH', '../templates/');
define('SMARTY_COMPILE_PATH', '../templates_c/');
define('SMARTY_CONFIG_PATH', '../configs/');
define('SMARTY_CACHE_PATH', '../cache/');

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
