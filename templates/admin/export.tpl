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
      <p style="display: block;">导出
      <select id="role_id" name="role_id">
        {foreach from=$roles item=role}
          <option value='{$role.role_id}'>{$role.role_type}</option>
        {foreachelse}
          <option value='-1'>没有任何类型</option>
        {/foreach}
      </select>
      今天的所有报修数据.<button type="submit" class="btn" style="margin-top: -10px;">确定</button></p>
      </form>
    </div>
    <div class="fix">&nbsp;</div>
  </div>
{literal}
<script>
$(function(){
});
</script>
{/literal}
{include file="footer.tpl"}
