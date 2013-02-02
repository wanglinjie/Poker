<?php
function jsonize($d){
    header('Content-type:application/json');
    echo json_encode($d);
}
?>
