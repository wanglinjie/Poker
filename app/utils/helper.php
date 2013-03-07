<?php

function get_url_domain(){
    $request_url = $_SERVER['REQUEST_URI'];
    $index = strpos($request_url, '/app/');
    return substr($request_url, 0, $index);
}

function escape($data){
    return mysql_real_escape_string(trim($data));
}

function decode_shire_state($state=0){
    switch($state){
        case -1: return "拒绝维修";
        case  0: return "新单";
        case  1: return "维修中";
        case  2: return "维修完毕";
    }
}

function check_reporter($report_id, $reporter){
    $db = new DB;
    $db->connect();
    $db->query("SELECT wizard_id FROM wizard WHERE wizard_id='$report_id' AND wizard_name='$reporter'");
    $db->next_record();
    return $db->f('wizard_id')?True:False;
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
    $sql = "SELECT shire_id, reporter, report_id, report_time, contact_num, department, place, reason, detail, "
         . "broken_item, filename, state, state_context, repair_time, feedback FROM shire ";
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
            'report_id' =>  $db->f('report_id'),
            'report_time'   =>  $db->f('report_time'),
            'contact_num'   =>  $db->f('contact_num'),
            'department'    =>  $db->f('department'),
            'place' =>  $db->f('place'),
            'reason'    =>  $db->f('reason'),
            'detail'    =>  $db->f('detail'),
            'broken_item'   =>  $db->f('broken_item'),
            'filename'      =>  $db->f('filename'),
            'state' =>  $db->f('state'),
            'decode_state'  =>  decode_shire_state($db->f('state')),
            'state_context' =>  $db->f('state_context'),
            'repair_time'   =>  $db->f('repair_time'),
            'feedback'  =>  $db->f('feedback'),
        ));
    }
    return $shires;
}

function get_shire_count_by_role($state=-1, $role_id=1){
    $sql = "SELECT COUNT(*) as c FROM shire WHERE role_id=$role_id ";
    if($state != -1){
        $sql = $sql . "AND state=$state ";
    }
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return $db->f('c');
}

function get_shires_by_role($state=-1, $role_id=1, $page=1, $limit=20){
    $start = ($page-1)*$limit;
    $sql = "SELECT shire_id, reporter, report_id, report_time, contact_num, department, place, reason, detail, "
         . "broken_item, filename, state, state_context, role_id, assign_time, repair_time, feedback FROM shire WHERE role_id=$role_id ";
    if($state != -1){
        $sql = $sql . "AND state=$state ";
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
            'report_id' =>  $db->f('report_id'),
            'report_time'   =>  $db->f('report_time'),
            'contact_num'   =>  $db->f('contact_num'),
            'department'    =>  $db->f('department'),
            'place' =>  $db->f('place'),
            'reason'    =>  $db->f('reason'),
            'detail'    =>  $db->f('detail'),
            'broken_item'   =>  $db->f('broken_item'),
            'filename'      =>  $db->f('filename'),
            'state' =>  $db->f('state'),
            'decode_state'  =>  decode_shire_state($db->f('state')),
            'state_context' =>  $db->f('state_context'),
            'role_id'       =>  $db->f('role_id'),
            'assign_time'   =>  $db->f('assign_time'),
            'repair_time'   =>  $db->f('repair_time'),
            'feedback'  =>  $db->f('feedback'),
        ));
    }
    return $shires;
}

function get_shire_count_not_refused(){
    $sql = "SELECT COUNT(*) as c FROM shire WHERE state<>-1 AND "
         . "(role_id<>0 or auth_check=1);";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return $db->f('c');
}

function get_shires_not_refused($page=1, $limit=20){
    $start = ($page-1)*$limit;
    $sql = "SELECT shire_id, reporter, report_id, report_time, contact_num, department, place, reason, detail, " 
         . "broken_item, filename, state, state_context, repair_time, feedback FROM shire ";
    $sql = $sql . "WHERE state<>-1 AND (role_id<>0 or auth_check=1) ORDER BY shire_id DESC LIMIT $start, $limit;";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $shires = Array();
    while($db->next_record()){
        array_push($shires, Array(
            'shire_id'  =>  $db->f('shire_id'),
            'reporter'  =>  $db->f('reporter'),
            'report_id' =>  $db->f('report_id'),
            'report_time'   =>  $db->f('report_time'),
            'contact_num'   =>  $db->f('contact_num'),
            'department'    =>  $db->f('department'),
            'place' =>  $db->f('place'),
            'reason'    =>  $db->f('reason'),
            'detail'    =>  $db->f('detail'),
            'broken_item'   =>  $db->f('broken_item'),
            'filename'      =>  $db->f('filename'),
            'state' =>  $db->f('state'),
            'decode_state'  =>  decode_shire_state($db->f('state')),
            'state_context' =>  $db->f('state_context'),
            'repair_time'   =>  $db->f('repair_time'),
            'feedback'  =>  $db->f('feedback'),
        ));
    }
    return $shires;
}

function update_shire($reporter, $report_id, $report_time, $contact_num, $department, $place,
        $broken_item, $reason, $detail, $filename, $state, $state_context, $repair_time, $feedback, $auth_check, $ip){
    $sql = "INSERT INTO shire(reporter, report_id, report_time, contact_num, department, place, broken_item,"
         . "reason, detail, filename, state, state_context, repair_time, feedback, auth_check, ip) VALUES('$reporter', "
         . "'$report_id', '$report_time', '$contact_num', '$department', '$place', '$broken_item', '$reason',"
         . "'$detail', '$filename', $state, '$state_context', '$report_time', '$feedback', $auth_check, '$ip');";

    $db = new DB;
    $db->connect();
    $db->query($sql);
}

function change_shire_state($shire_id, $state, $state_context, $feedback){
    $db = new DB;
    $db->connect();
    $db->query("SELECT shire_id FROM shire WHERE shire_id=$shire_id");
    $db->next_record();
    if($db->f('shire_id')){
        $repair_time = date('Y/m/d');
        $db->query("UPDATE shire SET state=$state,state_context='$state_context',"
                  ."repair_time='$repair_time',feedback='$feedback' "
                  ."WHERE shire_id=$shire_id;");
    }else{
        return false;
    }
}

function get_shire_by_id($shire_id){
    $sql = "SELECT shire_id, reporter, report_id, report_time, contact_num, department, place, reason, detail, " 
         . "broken_item, filename, state, state_context, role_type, repair_time, feedback FROM shire,role ";
    $sql = $sql . "WHERE shire.role_id=role.role_id AND shire_id=$shire_id;";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return Array(
       'shire_id'  =>  $db->f('shire_id'),
       'reporter'  =>  $db->f('reporter'),
       'report_id' =>  $db->f('report_id'),
       'report_time'   =>  $db->f('report_time'),
       'contact_num'   =>  $db->f('contact_num'),
       'department'    =>  $db->f('department'),
       'place' =>  $db->f('place'),
       'reason'    =>  $db->f('reason'),
       'detail'    =>  $db->f('detail'),
       'broken_item'   =>  $db->f('broken_item'),
       'filename'      =>  $db->f('filename'),
       'state' =>  $db->f('state'),
       'decode_state'  =>  decode_shire_state($db->f('state')),
       'state_context' =>  $db->f('state_context'),
       'repair_time'   =>  $db->f('repair_time'),
       'feedback'  =>  $db->f('feedback'),
    );
}

function assign_shire_to_role($shire_id, $role_id){
    $assign_time = date('Y/m/d');
    $db = new DB;
    $db->connect();
    $db->query("UPDATE shire SET role_id=$role_id, assign_time='$assign_time' WHERE shire_id=$shire_id;");
    return true;
}

function consumer_check($consumer, $password){
    $sql = "SELECT consumer, password, role_id FROM barrack WHERE "
         . "consumer='$consumer' AND password='" . md5($password) . "';";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $db->next_record();
    return $db->f('role_id');
}

function translate_role_id($role_id){
    $db = new DB;
    $db->connect();
    $db->query("SELECT role_type FROM role WHERE role_id=$role_id");
    $db->next_record();
    return $db->f('role_type');
}

function get_all_role_types(){
    $db = new DB;
    $db->connect();
    $db->query("SELECT role_id, role_type FROM role WHERE role_type<>'管理员';");
    $all_role_types = Array();
    while($db->next_record()){
        array_push($all_role_types, Array(
            'role_id'   =>  $db->f('role_id'),
            'role_type' =>  $db->f('role_type')
        ));
    }
    return $all_role_types;
}

function add_role_type($role_type){
    $db = new DB;
    $db->connect();
    $db->query("SELECT role_id FROM role WHERE role_type='$role_type';");
    $db->next_record();
    if($db->f('role_id')){
        return 0;
    }
    $db->query("INSERT INTO role(role_type) VALUES('$role_type');");
    return 1;
}

function del_role_type($role_id){
    $db = new DB;
    $db->connect();
    $db->query("SELECT consumer FROM barrack WHERE role_id=$role_id;");
    $db->next_record();
    if($db->f('consumer')){
        return 0;
    }
    $db->query("DELETE FROM role WHERE role_id=$role_id;");
    return 1;
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

function add_new_consumer($consumer, $password, $role_id){
    $db = new DB;
    $db->connect();
    $db->query("SELECT consumer FROM barrack WHERE consumer='$consumer';");
    $db->next_record();
    if($db->f('consumer')){
        return false;
    }else{
        $db->query("INSERT INTO barrack(consumer, password, role_id) VALUES('$consumer', "
                  ."'" . md5($password) . "', $role_id);");
        return true;
    }
}

function find_shires($shire_id, $limit=20){
    $sql = "SELECT shire_id, reporter, report_id, report_time, contact_num, department, place, reason, detail, " . "broken_item, filename, state, state_context, repair_time, feedback FROM shire ";
    $sql = $sql . "WHERE state<>-1 AND role_id<>0 AND shire_id=$shire_id ORDER BY shire_id DESC LIMIT 0, $limit;";
    $db = new DB;
    $db->connect();
    $db->query($sql);
    $shires = Array();
    while($db->next_record()){
        array_push($shires, Array(
            'shire_id'  =>  $db->f('shire_id'),
            'reporter'  =>  $db->f('reporter'),
            'report_id' =>  $db->f('report_id'),
            'report_time'   =>  $db->f('report_time'),
            'contact_num'   =>  $db->f('contact_num'),
            'department'    =>  $db->f('department'),
            'place' =>  $db->f('place'),
            'reason'    =>  $db->f('reason'),
            'detail'    =>  $db->f('detail'),
            'broken_item'   =>  $db->f('broken_item'),
            'filename'      =>  $db->f('filename'),
            'state' =>  $db->f('state'),
            'decode_state'  =>  decode_shire_state($db->f('state')),
            'state_context' =>  $db->f('state_context'),
            'repair_time'   =>  $db->f('repair_time'),
            'feedback'  =>  $db->f('feedback'),
        ));
    }
    return $shires;
}
?>
