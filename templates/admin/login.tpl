{config_load file="main.conf"}
{include file="navs.tpl"}
  {if $server_msg}
    {literal}
    <script>
    $(function(){
      alert("用户名或密码错误.请确认输入!");
      return false;
    });
    </script>
    {/literal}
  {/if}
  <div class="content">
    <div class="login-form">
      <form method="POST" class="form-horizontal">
        <div class="control-group">
          <label class="control-label" for="consumer">用户名</label>
          <div class="controls">
            <input type="text" id="consumer" name="consumer" placeholder="请输入用户名!">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="password">密码</label>
          <div class="controls">
            <input type="password" id="password" name="password" placeholder="请输入密码!">
          </div>
        </div>
        <div class="control-group">
          <div class="controls">
            <label class="checkbox">
              <input type="checkbox" id="remember" name="remember"> 记住密码
            </label>
            <button type="submit" class="btn btn-login">登陆</button>
            <button class="btn goto_home">返回</button>
          </div>
        </div>
      </form>
    </div>
  </div>
{include file="footer.tpl"}
