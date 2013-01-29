<?php
if((strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6.') !== FALSE)){
    header("Location:ie6/index.html");
}else{
    header("Location:app/index.php");
}
?>
