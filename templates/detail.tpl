{config_load file="main.conf"} 
{include file="navs.tpl"}
  <div class="content">
    <table width=1024 border=0 align="center" cellpadding=0 cellspacing=1 class="table-border">
      <tr>
        <td>
          <table width="100%" border=0 cellpadding=5 cellspacing=1>
            <tr>
              <td height="30" colspan=6 align="center" class="table-title">
                <b><span class="red">{$shire.reporter|escape}</span> 保修的详细资料</b>
              </td>
            </tr>
            <tr align="center">
              <td width=118 height=30 class="table-body">保修编号:</td>
              <td width=112 height=30 class="table-body"><span class="blue">#2013{$shire.shire_id}</span></td>
              <td width=120 height=30 class="table-body">部门/办公室:</td>
              <td width=136 height=30 class="table-body"><span class="blue">{$shire.department|escape}</span></td>
              <td width=134 height=30 class="table-body">故障物品/部件:</td>
              <td width=131 height=30 class="table-body"><span class="blue">{$shire.broken_item|escape}</span></td>
            </tr>
            <tr align="center">
              <td width=118 height=30 class="table-body">联系电话:</td>
              <td width=112 height=30 class="table-body"><span class="blue">{$shire.contact_num|escape}</span></td>
              <td width=120 height=30 class="table-body">维修状态:</td>
              <td width=136 height=30 class="table-body"><span class="blue">{$shire.decode_state|escape}</span></td>
              <td width=134 height=30 class="table-body">报修日期:</td>
              <td width=131 height=30 class="table-body"><span class="blue">{$shire.report_time|escape}</span></td>
            </tr>
            <tr align="center">
              <td width=118 height=30 class="table-body">报修原因:</td>
              <td height=30 colspan=5 class="table-body"><span class="blue">{$shire.reason|escape}</span></td>
            </tr>
            <tr align="center">
              <td width=118 height=30 class="table-body">详细原因:</td>
              <td height=30 colspan=5 class="table-body"><span class="blue">{$shire.detail|escape}</span></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table width=1024 border=0 align="center" cellpadding=0 cellspacing=0>
      <tr><td height=20>&nbsp;</td></tr>
    </table>
    <table width=1024 border=0 align="center" cellpadding=0 cellspacing=1 class="table-border">
      <tr>
        <td>
          <table width="100%" border=0 cellpadding=4 cellspacing=0>
            <tr>
              <td height=30 align="center" class="table-title"><b>维修人员反馈</b></td>
            </tr>
          </table>
          <table width="100%" border=0 cellpadding=5 cellspacing=1>
            <tr align="center">
              <td width=118 height=30 class="table-body">维修部门:</td>
              <td width=112 height=30 class="table-body"><span class="blue">{$shire.role_type|escape}</span></td>
              <td width=120 height=30 class="table-body">维修状态:</td>
              <td width=136 height=30 class="table-body"><span class="blue">{$shire.decode_state|escape}</span></td>
              <td width=134 height=30 class="table-body">维修日期:</td>
              <td width=131 height=30 class="table-body">
                {if $shire.state == 2}
                  <span class="blue">{$shire.repair_time|escape}</span>
                {else}
                  &nbsp;
                {/if}
              </td>
            </tr>
            <tr align="center">
              <td width=118 height=30 class="table-body">维修反馈:</td>
              <td height=30 colspan=5 class="table-body"><span class="blue">{$shire.feedback|escape}</span></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
{include file="footer.tpl"}
