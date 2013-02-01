<?php
function auth_check(){
    session_start();
    if(isset($_SESSION['consumer']) || 
            ($_COOKIE && $_COOKIE['consumer'])){
        return true;
    }else{
        return false;
    }
}

function login($consumer){
    session_start();
    $_SESSION['consumer'] = $consumer;
}

function logout(){
    session_start();
    unset($_SESSION['consumer']);
    setcookie('consumer', '', time()-3600);
}
?>
