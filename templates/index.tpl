{config_load file="main.conf"}
{include file="navs.tpl"}
  <div class="content">
    <table width=1024 border=1 cellpadding=5 cellspacing=1 bgcolor="#CCCCCC" style="border-collapse: collapse" bordercolorlight="#335EA8" bordercolordark="#335EA8">
      <tbody>
        <tr>
          <td bgcolor="#CCCCCC">
            <div align="center">
              <table width=1024 border=0 align=center cellpadding=0 cellspacing=0>
                <tbody>
                  <tr>
                    <td>
                      <table width="100%" border=0 align="center" cellpadding=0 cellspacing=1 class="table-border">
                        <tbody>
                          <tr>
                            <td width="10%" height=30 class="table-title" align="center"><strong>报修编号</strong></td>
                            <td width="14%" height=30 class="table-title" align="center"><strong>部门或班级</strong></td>
                            <td width="13%" height=30 class="table-title" align="center"><strong>故障地点</strong></td>
                            <td width="13%" height=30 class="table-title" align="center"><strong>报修原因</strong></td>
                            <td width="10%" height=30 class="table-title" align="center"><strong>报修物品</strong></td>
                            <td width="10%" height=30 class="table-title" align="center"><strong>报修时间</strong></td>
                            <td width="6%" height=30 class="table-title" align="center"><strong>维修状态</strong></td>
                            <td width="8%" height=30 class="table-title" align="center"><strong>维修时间</strong></td>
                            <td width="16%" height=30 class="table-title" align="center"><strong>安排与反馈</strong></td>
                          </tr>
                          {foreach from=$shires item=shire}
                          <tr>
                            <td width="10%" height=30 class="table-body" align="center">#2013{$shire.shire_id}</td>
                            <td width="14%" height=30 class="table-body" align="center">{$shire.department}</td>
                            <td width="13%" height=30 class="table-body" align="center">{$shire.place}</td>
                            <td width="13%" height=30 class="table-body" align="center">{$shire.reason}</td>
                            <td width="10%" height=30 class="table-body" align="center">{$shire.broken_item}</td>
                            <td width="10%" height=30 class="table-body" align="center">{$shire.report_time}</td>
                            {if $shire.state != 2}
                              <td width="6%" height=30 class="table-body" align="center">{$shire.decode_state}</td>
                              <td width="8%" height=30 class="table-body" align="center">{$shire.decode_state}</td>
                            {else}
                              <td width="6%" height=30 class="table-body" align="center">{$shire.state_context}</td>
                              <td width="8%" height=30 class="table-body" align="center">{$shire.repair_time}</td>
                            {/if}
                            <td width="16%" height=30 class="table-body" align="center">{$shire.feedback}</td>
                          </tr>
                          {foreachelse}
                            <tr><td colspan=9 class="msg">恭喜，没有报修数据!</td></tr>
                          {/foreach}
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
{include file="paginator.tpl"}
{include file="footer.tpl"}
