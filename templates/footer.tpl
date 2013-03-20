  <div class="footer">
    CopyRight 2013-~ 哈尔滨工业大学（威海）后勤 版权所有 联系方式:xxxxx <a href="{$domain}/app/admin/login.php">后台登陆</a><br />
    哈尔滨工业大学创建于1920年，隶属于工业和信息化部，是国家首批“985工程”高校之一。
  </div>
</div>
<!--
<script data-main="{$public}/js/main" src="{$public}/js/libs/require-jquery.js"></script>
-->
{literal}
<script>
$(function(){
  $(".goto_home").on('click', function(e) {
    window.location = $('.home').attr('href');
    return false;
  });
  $(".quit_system").on('click', function(e){
    if(window.opener){
      window.close();
    }else{
      window.location.href = 'http://hq.hitwh.edu.cn/';
    }
  });
});
</script>
{/literal}
</body>
</html>
