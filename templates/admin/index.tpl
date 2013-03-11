{config_load file="main.conf"}
{include file="navs.tpl"}
  <div class="content">
    {include file="admin/admin_navs.tpl"}
    <div class="admin_content">
      <div>
        <pre>欢迎回来, {$role_type}</pre>
        <pre>
      当前运行脚本所在的文档根目录: {$smarty.server.DOCUMENT_ROOT}
      当前正在执行脚本文件名: {$smarty.server.PHP_SELF}
      服务器使用的CGI版本: {$smarty.server.GATEWAY_INTERFACE}
      服务器标识: {$smarty.server.SERVER_SOFTWARE}
      请求页面时的通信协议: {$smarty.server.SERVER_PROTOCOL}
      请求页面时的请求方法: {$smarty.server.REQUEST_METHOD}
      当前请求的User_Agent头部信息: {$smarty.server.HTTP_USER_AGENT}
      
        </pre>
      </div>
    </div>
    <div class="fix">&nbsp;</div>
  </div>
{include file="footer.tpl"}
