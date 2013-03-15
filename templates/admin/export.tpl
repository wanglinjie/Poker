{config_load file="main.conf"}
{include file="navs.tpl"}
  <div class="content">
    {if $server_msg}
      {literal}
      <script>
      $(function(){ alert("没有符合条件的报修供导出!"); });
      </script>
      {/literal}
    {/if}
    {include file="admin/admin_navs.tpl"}
    <div class="admin_content">
      <form method="POST">
        <fieldset>
          <legend>报修单导出</legend>
          <label>报修来源</label>
          <select>
            <option value="" selected>请选择</option>
            <option value="xybgs">学院办公室</option>
            <option value="ghbgs">党群工作部</option>
            <option value="jjsf">纪检审法办公室</option>
            <option value="xsgzc">学生工作处</option>
            <option value="jwc">教务处</option>
            <option value="yjsc">研究生处</option>
            <option value="rlzy">人力资源处</option>
            <option value="kjfzc">科技发展处</option>
            <option value="ghcwc">规划财务处</option>
            <option value="zcglc">资产管理处</option>
            <option value="zwbwc">总务保卫处</option>
            <option value="tsg">图书馆</option>
            <option value="jxjy">继续教育学院</option>
            <option value="hq1">后勤服务公寓服务中心</option>
            <option value="hq2">后勤服务餐饮服务中心</option>
            <option value="hq3">后勤服务中心校园物业中心</option>
            <option value="hq4">后勤服务商务服务中心</option>
            <option value="hq5">后勤服务综合管理办公室</option>
            <option value="hq6">后勤服务中心动力中心</option>
            <option value="cbxy">船舶与海洋工程学院</option>
            <option value="hykx">海洋科学与技术学院</option>
            <option value="clkx">材料科学与工程学院</option>
            <option value="jsj">计算机科学与技术学院</option>
            <option value="tmgc">土木工程系</option>
            <option value="tyjxb">体育教学部</option>
            <option value="qcgc">汽车工程学院</option>
            <option value="xxydq">信息与电气工程学院</option>
            <option value="jjgl">经济管理学院</option>
            <option value="lxy">理学院</option>
            <option value="yywx">语言文学学院</option>
            <option value="sxzz">思想政治伦理教学部</option>
            <option value="scwy">上诚物业</option>
            <option value="ghwy">广华物业</option>
          </select>
          <label>开始日期</label>
          <input type="text" id="from" name="from" />
          <label>结束日期</label>
          <input type="text" id="to" name="to" />
          <label>&nbsp;</label>
          <button class="btn">导出</button>
        </fieldset>
      </form>
    </div>
    <div class="fix">&nbsp;</div>
  </div>
<script src="{$public}/js/libs/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
{literal}
<script>
$(function(){
  $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);
  $('#from').datepicker({dateFormat: 'yy/mm/dd'});
  $('#to').datepicker({dateFormat: 'yy/mm/dd'});

  var is_valid = function(){
    var department = $('select').find('option:selected').text();
    var from = $('#from').val();
    var to = $('#to').val();

    if(department && department != '请选择' && from && to){
      $('form').append('<input type="hidden" name="department" value="' + department + '" />');
      return true;
    }else{
      return false;
    }
  }

  $('button').on('click', function(e){
    e.preventDefault();
    if(is_valid()){
      $('form').submit();
      return true;
    }else{
      alert('请确保信息完整!');
      return false;
    }
  });
});
</script>
{/literal}
{include file="footer.tpl"}
