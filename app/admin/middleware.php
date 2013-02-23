<?php
include(dirname(APP_ADMIN_ROOT) . '/core.php');

function cache_role(){
    session_start();
    if(!isset($_SESSION['role_type'])){
        $role_id = $_SESSION['role_id'];
        $role_type = translate_role_id($role_id);
        $_SESSION['role_type'] = $role_type;
    }
    return Array(
        'role_id'   =>  $_SESSION['role_id'],
        'role_type' =>  $_SESSION['role_type']
    );
}

function auth_check(){
    //TODO:安全问题
    session_start();
    if(
        (isset($_SESSION['consumer']) && isset($_SESSION['role_id']))
        || 
        ($_COOKIE && $_COOKIE['consumer'] && $_COOKIE['role_id'])
    ){
        return true;
    }else{
        return false;
    }
}

function login($consumer, $role_id){
    session_start();
    $_SESSION['consumer'] = $consumer;
    $_SESSION['role_id'] = $role_id;
}

function logout(){
    session_start();
    unset($_SESSION['consumer']);
    unset($_SESSION['role_id']);
    if(isset($_SESSION['role_type'])){
        unset($_SESSION['role_type']);
    }
    setcookie('consumer', '', time()-3600);
    setcookie('role', '', time()-3600);
}
?>
