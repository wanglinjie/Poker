<?php
include('core.php');
require(APP_ROOT . '/admin/j/helper.php');

date_default_timezone_set('Asia/Chongqing');

$origin_name = $_FILES["upload_pics"]["name"];
$file_name = 'upload' . mktime() . $origin_name;
$ext_type = $_FILES["upload_pics"]["type"];
$size = $_FILES["upload_pics"]["size"];

move_uploaded_file($_FILES["upload_pics"]["tmp_name"], "../upload/" . $file_name);
return jsonize(Array(
    'r'     =>  1,
    'name'  =>  $file_name,
    'origin_name'   =>  $origin_name,
));
?>
