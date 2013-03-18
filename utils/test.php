<!doctype html>
<html lang="en">
  <head>
    <title>哈工大威海后勤服务中心报修测试</title>
    <meta charset="utf-8" />
    <link href="../static/css/libs/bootstrap.min.css" rel="stylesheet" media="screen">
    <style type="text/css">
*       { margin:0; padding:0; }
body    { width: 890px; margin: 0 auto; }
form h3 { text-align: center; }

.red { color: red; font-weight: bold; }

.control-group { margin-bottom: 0px !important; }
    </style>
  </head>
  <body>
<?php
require('../libs/db.php');
require('../app/utils/helper.php');
?>
    <form class="form-horizontal">
      <h3>添加报修</h3>
      <div class="control-group">
        <label class="control-label" for="report_id">报修人工号</label>
        <div class="controls">
          <input type="text" id="report_id">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="reporter">报修人姓名</label>
        <div class="controls">
          <input type="text" id="reporter">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="department">报修部门</label>
        <div class="controls">
          <input type="text" id="department">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="broken_item_class">报修项目分类</label>
        <div class="controls">
          <input type="text" id="broken_item_class">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="broken_item">报修项目</label>
        <div class="controls">
          <input type="text" id="broken_item">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="reason">报修原因</label>
        <div class="controls">
          <input type="text" id="reason">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="place">故障地点</label>
        <div class="controls">
          <input type="text" id="place">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="state">故障状态</label>
        <div class="controls">
          <input type="text" id="state">
          <span class="red">-1为冻结,0为新单,1为维修中,2为维修完毕</span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label">分配给</label>
        <div class="controls">
          <select id="role_id">
          <?php
          $role_types = get_role_types();
          foreach($role_types as $role){
            echo '<option value="' . $role['role_id'] . '">' . $role['role_type'] . '</option>';
          }
          ?>
          </select>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="assign_feedback">下级反馈</label>
        <div class="controls">
          <input type="text" id="assign_feedback">
          <span class="red">-2为管理员退回,-1为下级拒绝,0为新单,1为通过</span>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <button class="btn btn-add">添加</button>
        </div>
      </div>
    </form>
  </body>
  <script src="../static/js/libs/jquery-1.9.1.min.js"></script>
  <script src="../static/js/libs/bootstrap.min.js"></script>
  <script>
$(function(){
  $('button.btn-add').on('click', function(e){
    e.preventDefault();
    var report_id = $('#report_id').val().trim();
    var reporter = $('#reporter').val().trim();
    var department = $('#department').val().trim();
    var broken_item_class = $('#broken_item_class').val().trim();
  })
});
  </script>
</html>
