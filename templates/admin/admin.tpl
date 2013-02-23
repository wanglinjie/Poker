{config_load file="main.conf"}
{include file="navs.tpl"}
  <div class="content">
    {include file="admin/admin_navs.tpl"}
    <div class="admin_content">
      <table width="100%" border=1 cellpadding=5 cellspacing=1 bgcolor="#CCCCCC" style="border-collapse: collapse" bordercolorlight="#335EA8" bordercolordark="#335EA8">
        <tbody>
          <tr>
            <td bgcolor="#CCCCCC">
              <div align="center">
                <table width="100%" border=0 align=center cellpadding=0 cellspacing=0>
                  <tbody>
                    <tr>
                      <td>
                        <table width="100%" border=0 align="center" cellpadding=0 cellspacing=1 class="table-border data-table">
                          <tbody>
                            <tr>
                              <td width="10%" height=30 class="table-title" align="center"><strong>报修编号</strong></td>
                              <td width="14%" height=30 class="table-title" align="center"><strong>部门或班级</strong></td>
                              <td width="13%" height=30 class="table-title" align="center"><strong>故障地点</strong></td>
                              <td width="13%" height=30 class="table-title" align="center"><strong>报修原因</strong></td>
                              <td width="10%" height=30 class="table-title" align="center"><strong>报修物品</strong></td>
                              <td width="10%" height=30 class="table-title" align="center"><strong>报修时间</strong></td>
                              <td width="16%" height=30 class="table-title" align="center"><strong>查看</strong></td>
                            </tr>
                            {foreach from=$shires item=shire}
                            <tr class="data-line">
                              <td width="10%" height=30 class="table-body" align="center">#2013{$shire.shire_id}</td>
                              <td width="14%" height=30 class="table-body" align="center">{$shire.department|escape}</td>
                              <td width="13%" height=30 class="table-body" align="center">{$shire.place|escape|truncate:30:"..."}</td>
                              <td width="13%" height=30 class="table-body" align="center">{$shire.reason|escape|truncate:30:"..."}</td>
                              <td width="10%" height=30 class="table-body" align="center">{$shire.broken_item|escape}</td>
                              <td width="10%" height=30 class="table-body" align="center">{$shire.report_time}</td>
                              <td width="6%" height=30 class="table-body" align="center">
                                {if $shire.filename}
                                  <a class="show_pic" href="#" data-url="{$shire.filename}" data-domain="{$domain}">点击查看图片</a></td>
                                {else}
                                  此报修没有相关图片
                                {/if}
                            </tr>
                            <tr class="hidden">
                              <td colspan=4 class="table-body">
                                <p style="text-align:left;">
                                  报修人: {$shire.reporter|escape}<br>
                                  报修人工号: {$shire.report_id|escape}<br>
                                  报修时间: {$shire.report_time}<br>
                                  详细原因: {$shire.detail|escape}<br>
                                </p>
                              </td>
                              {if $type==0}
                                <td colspan=3 class="table-body">
                                  <table width="100%" border=0>
                                    {if $role_id == 1}
                                      <tr>
                                        <td>
                                          分配给
                                          <select style="margin-left: 55px;width: 137px;">
                                            {foreach from=$roles item=role}
                                              <option value='{$role.role_id}'>{$role.role_type}</option>
                                            {foreachelse}
                                              <option value='-1'>没有任何类型</option>
                                            {/foreach}
                                          </select>
                                        </td>
                                        <td>
                                          <button class="btn btn-success btn-assign" data-id="{$shire.shire_id}">分配</button>

                                        </td>
                                      </tr>
                                    {else}
                                      <tr>
                                        <td>确认维修，并将状态修改为维修中.</td>
                                        <td><button class="btn btn-success btn-admin" data-id="{$shire.shire_id}" data-state=1>提交</button></td>
                                      </tr>
                                    {/if}
                                    <tr>
                                      <td>拒绝报修，理由为<input type="text"></td>
                                      <td><button class="btn btn-danger btn-admin" data-id="{$shire.shire_id}" data-state=-1>拒绝</button></td>
                                    </tr>
                                  </table>
                                </td>
                              {else}
                                <td colspan=3 class="table-body">
                                  <table width="100%" border=0>
                                    <tr>
                                      <td><textarea placeholder="输入反馈内容，提交后状态为已修缮完毕!"></textarea></td>
                                      <td><button class="btn btn-success" style="height:100%;margin-top:-10px;" data-id="{$shire.shire_id}" data-state=2>提交</button>
                                    </tr>
                                  </table>
                                </td>
                              {/if}
                            </tr>
                            {foreachelse}
                              <tr><td colspan=9 class="msg">没有报修数据!</td></tr>
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
      {include file="paginator.tpl"}
    </div>
    <div class="fix">&nbsp;</div>
  </div>
  <script src="{$public}/js/libs/jquery.bpopup-0.8.0.min.js"></script>
{literal}
<script>
$(function(){
    $('.data-table').find('tr[class=data-line]').on('click', function(e){
        $('tr[class=hidden]').hide();
        $(this).next('.hidden').show();
    });
    $('button.btn-admin').on('click', function(e){
        var btn = $(this);
        var shire_id = btn.attr('data-id');
        var state = btn.attr('data-state');
        var state_context = '';
        var feedback = '';
        var hidden_line = btn.closest('.hidden');
        var data_line = hidden_line.prev();

        if(state == -1){
            state_context = btn.closest('td').prev().find('input').val().trim();
        }else if(state == 2){
            feedback = btn.closest('td').prev().find('textarea').val().trim();
        }
        $.post('j/admin.php', {type:'admin', shire_id:shire_id, state:state, state_context:state_context, feedback:feedback},
            function(d){
                if(d.r){ 
                    alert("成功!");
                    data_line.remove();
                    hidden_line.remove();
                }else{
                    alert(d.msg);
                    return false;
                }
            }
        );
    });
    $('button.btn-assign').on('click', function(e){
        var btn = $(this);
        var hidden_line = btn.closest('.hidden');
        var data_line = hidden_line.prev();
        var shire_id = btn.attr('data-id');
        var role_id = btn.closest('td').prev().find('select').val().trim();
        $.post('j/admin.php', {type:'assign', shire_id:shire_id, role_id:role_id}, function(d){
          if(d.r){
            alert("成功!");
            data_line.remove();
            hidden_line.remove();
          }else{
            alert(d.msg);  
            return false;
          }
        });
    });
    $('a.show_pic').on('click', function(e){
        e.preventDefault();
        var domain = $(this).attr('data-domain').trim();
        var picpath = $(this).attr('data-url').trim();
        if(!picpath){
            alert("用户没有上传关于此报修的图片!");
            return false;
        }
        var img = '<img src="' + domain + '/upload/' + picpath + '" style="width:400px;height:300px;" />';
        $(img).bPopup();
        return false;
    });
});
</script>
{/literal}
{include file="footer.tpl"}
