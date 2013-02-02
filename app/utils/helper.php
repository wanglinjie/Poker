<?php

function get_url_domain(){
    $document_root_length = strlen($_SERVER['DOCUMENT_ROOT']);
    $script_filename = substr($_SERVER['SCRIPT_FILENAME'], $document_root_length);
    $index = stripos($script_filename, '/app/');
    return substr($script_filename, 0, $index);
}

function escape($data){
    return mysql_real_escape_string(trim($data));
}

function decode_shire_state($state=0){
    switch($state){
        case 0: return "新单";
        case 1: return "已维修";
        case 2: return "非本部门维修范围";
    }
}

function get_shire_count($state=-1){
    $sql = "SELECT COUNT(*) as c FROM shire ";
    if($state != -1){
        $sql = $sql . "WHERE state=$state ";
    }
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return $db->f('c');
}

function get_shires($state=-1, $page=1, $limit=20){
    $start = ($page-1)*$limit;
    $sql = "SELECT shire_id, reporter, report_time, contact_num, department, place, reason, detail, "
         . "broken_item, state, state_context, repair_time, feedback FROM shire ";
    if($state != -1){
        $sql = $sql . "WHERE state=$state ";
    }
    $sql = $sql . "ORDER BY shire_id DESC LIMIT $start, $limit;";

    $db = new DB;
    $db->connect();
    $db->query($sql);
    $shires = Array();
    while($db->next_record()){
        array_push($shires, Array(
            'shire_id'  =>  $db->f('shire_id'),
            'reporter'  =>  $db->f('reporter'),
            'report_time'   =>  $db->f('report_time'),
            'contact_num'   =>  $db->f('contact_num'),
            'department'    =>  $db->f('department'),
            'place' =>  $db->f('place'),
            'reason'    =>  $db->f('reason'),
            'detail'    =>  $db->f('detail'),
            'broken_item'   =>  $db->f('broken_item'),
            'state' =>  $db->f('state'),
            'decode_state'  =>  decode_shire_state($db->f('state')),
            'state_context' =>  $db->f('state_context'),
            'repair_time'   =>  $db->f('repair_time'),
            'feedback'  =>  $db->f('feedback'),
        ));
    }
    return $shires;
}

function update_shire($reporter, $report_time, $contact_num, $department, $place,
        $broken_item, $reason, $detail, $state, $state_context, $repair_time, $feedback){
    $sql = "INSERT INTO shire(reporter, report_time, contact_num, department, place, broken_item,"
         . "reason, detail, state, state_context, repair_time, feedback) VALUES('$reporter', "
         . "'$report_time', '$contact_num', '$department', '$place', '$broken_item', '$reason',"
         . "'$detail', $state, '$state_context', '$repair_time', '$feedback');";

    $db = new DB;
    $db->connect();
    $db->query($sql);
}

function consumer_check($consumer, $password){
    $sql = "SELECT consumer, password FROM barrack WHERE "
         . "consumer='$consumer' AND password='" . md5($password) . "';";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return $db->f('consumer');
}

function update_consumer_password($consumer, $origin_password, $password){
    $db = new DB;
    $db->connect();
    $db->query("SELECT consumer FROM barrack WHERE consumer='$consumer' AND "
              ."password='" . md5($origin_password) . "';");
    $db->next_record();
    if($db->f('consumer')){
        $db->query("UPDATE barrack SET password='" . md5($password) . "' WHERE "
                  ."consumer='$consumer';");
        return true;
    }else{
        return false;
    }
}

function add_new_consumer($consumer, $password){
    $db = new DB;
    $db->connect();
    $db->query("SELECT consumer FROM barrack WHERE consumer='$consumer';");
    $db->next_record();
    if($db->f('consumer')){
        return false;
    }else{
        $db->query("INSERT INTO barrack(consumer, password) VALUES('$consumer', "
                  ."'" . md5($password) . "');");
        return true;
    }
}
?>
