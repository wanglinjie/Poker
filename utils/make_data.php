<?php
require('../libs/db.php');

function make_seed(){
    list($usec, $sec) = explode(' ', microtime());
    return (float)$sec + ((float)$usec*100000);
}

$reporter = Array('小王', '小徐', '小李');
$department = Array('学院办公室', '教务处', '后勤处');
$broken_class = Array('防水', '房屋维修');
$broken_item = Array(
    '防水'  =>  Array(
        '房屋防水',
        '墙体防水',
        '室内防水'
    ),
    '房屋维修'  =>  Array(
        '室内维修',
        '室外维修'
    )
);
$place = Array('三公寓', '四公寓', '五公寓', '主楼');
$reason = Array(
    '窗帘坏了',
    '厕所坏了',
    '灯罩坏了'
);
$state = Array(0, 1);

$db = new DB;
$db->connect();

for($i=0; $i<5; $i++){
    mt_srand(make_seed());
    $reporter_item = $reporter[mt_rand(0, count($reporter)-1)];
    $department_item = $department[mt_rand(0, count($department)-1)];
    $broken_class_item = $broken_class[mt_rand(0, count($broken_class)-1)];
    $broken_item_subarray = $broken_item[$broken_class_item];
    $broken_item_item = $broken_item_subarray[mt_rand(0, count($broken_item_subarray)-1)];
    $place_item = $place[mt_rand(0, count($place)-1)];
    $reason_item = $reason[mt_rand(0, count($reason)-1)];
    $state_item = $state[mt_rand(0, count($state)-1)];

    $time = date('Y/m/d');
    $sql = "INSERT INTO shire(reporter, report_id, report_time, contact_num, department, place, reason, "
         . "detail, filename, broken_item_class, broken_item, state, state_context, role_id, "
         . "assign_time, assign_feedback, assign_feedback_time, request_days, admin_permit, "
         . "repair_time, feedback, auth_check, ip) VALUES('$reporter_item', '1', '$time', '010', "
         . "'$department_item', '$place_item', '$reason_item', '', '', '$broken_class_item', "
         . "'$broken_item_item', $state_item, '', 2, '$time', 1, '$time', 7, 1, '$time', '', 0, '');";
    echo $sql . "\n<br >";
    $db->query($sql);
}
echo "数据添加完毕!";
?>
