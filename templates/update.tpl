{config_load file="main.conf"}
{include file="navs.tpl"}
  {if $server_msg}
    {literal}
    <script>
    $(function(){
      if(confirm("报修成功，是否继续申报？") == false){
        window.location = 'index.php';
      } 
    });
    </script>
    {/literal}
  {/if}
  <div class="content">
    <table width=1024 border=0 align="center" cellpadding=0 cellspacing=0 class="table-border">
      <tr><td>
        <table width=1024 height=30 border=0 align="center" cellpadding=5 cellspacing=1>
          <tr><td align="center"><b>报 修 登 记</b></td></tr>
        </table>
        <table width=1024 border=0 align="center" cellpadding=0 cellspacing=1>
          <tr><td height=30 align="center" class="table-msg">说明：请您认真填写每一项!带*必须填写!</td></tr>
        </table>
        <form method="POST">
          <table width=1024 border=0 align="center" cellpadding=0 cellspacing=1>
            <tr>
              <td width=135 height=30 align="right" class="m">用户姓名:</td>
              <td height=30 width=496><input type="text" id="reporter" name="reporter" size=10 maxlength=10><span class="table-msg">*</span></td>
            </tr>
            <tr>
              <td width=135 height=30 align="right" class="m">联系方式:</td>
              <td height=30 width=496><input type="text" id="contact_num" name="contact_num" size=10><span class="table-msg">*(请确保信息正确，方便后勤人员联系！)</span></td>
            </tr>
            <tr>
              <td width=135 height=30 align="right" class="m">报修部门:</td>
              <td height=30 width=860 colspan=3>
                <select id="department_class">
                  <option value="" selected>请选择</option>
                  <option value="dzbgs">党政办公室</option>
                  <option value="jwjcc">纪委监察处</option>
                </select>
                <select id="department" name="department">
                  <option value="" selected>请选择</option>
                </select> 
                <span class="table-msg">*</span><input type="text" id="department_ext" name="department_ext" size=21 maxlength=50><span class="table-msg">(请先选择部门，无可选项者请在后面补充!)</span>
              </td>
            </tr>
            <tr>
              <td width=135 height=30 align="right" class="m">报修物品名称:</td>
              <td height=30 width=496>
                <select id="broken_item_class">
                  <option value="" selected="selected">请选择</option>
                  <option value="sgl">水工类</option>
                  <option value="dgl">电工类</option>
                </select>
                <select id="broken_item" name="broken_item">
                  <option value="" selected>请选择</option>
                </select><span class="table-msg">*</span>
              </td>
              <td height=30 width=139>
                <p align="right">故障地点:</p>
              </td>
              <td height=30 width=269>
                <input type="text" id="place" name="place"><span class="table-msg">*</span>
              </td>
            </tr>
            <tr>
              <td height=30 width=135 align="right" class="m">报修原因:</td>
              <td height=30 width=496>
                <input type="text" id="reason" name="reason" size=27><span class="table-msg">*(故障简单叙述,不超过50字)</span>
              </td>
            </tr>
            <tr>
              <td width=135 align="right" class="m">故障详细描述:</td>
              <td width=496><textarea id="detail" name="detail"></textarea>
            </tr>
            <tr>
              <td height=30 colspan=2 align="center">
                <input type="submit" value="报修申请">
                <input type="reset" value="重新填写">
                <input type="button" value="返回">
              </td>
            </tr>
          </table>
        </form>
      </td></tr>
    </table>
  </div>
{literal}
  <script>
  $(function(){
    var const_department = {
      'dzbgs': {
        'bgs1': '办公室1',
        'bgs2': '办公室2', 
      },
      'jwjcc': {
        'bgs3': '办公室3',
        'bgs4': '办公室4',
      },
    };
    var const_broken_item = {
      'sgl': {
        'b1': '物品1',
        'b2': '物品2', 
      },
      'dgl': {
        'b3': '物品3',
        'b4': '物品4', 
      },
    };

    var binding_item = function(item){
      var const_item = eval('const_' + item);
      var item_class = $('#' + item + '_class');
      var item_obj = $('#' + item);
      item_class.on('change', function(e){
        var cnt_selected_class = item_class.val();
        if(cnt_selected_class){
          item_obj.find('option').remove();     
          item_obj.append("<option value=''>请选择</option>");
          for(var k in const_item[cnt_selected_class]){
            v = const_item[cnt_selected_class][k];
            item_obj.append("<option value='" + k + "'>" + v + "</option>");
          }
        }
      });
    };
    ["department", "broken_item"].forEach(function(v){binding_item(v)});

    var item_decode = function(o){
      return o.find('option:selected').text().trim();
    };
    var valid = function(){
      var reporter = $('#reporter').val().trim();
      var contact_num = $('#contact_num').val().trim();
      var department = $('#department');
      var broken_item = $('#broken_item');
      var place = $('#place').val().trim();
      var reason = $('#reason').val().trim();

      department = item_decode(department);
      if(department == '请选择'){ department = $('#department_ext').val().trim(); }
      broken_item = item_decode(broken_item);

      if(reporter && contact_num && department && broken_item && place && reason){
        var hidden_data = [
          "<input type='hidden' name='department_decode' value='" + department + "'>",
          "<input type='hidden' name='broken_item_decode' value='" + broken_item + "'>",
        ];
        hidden_data.forEach(function(v){
          $('form').append(v);
        });
      }else{
        alert("请确保必填项均已填写!");
        return false;
      }
    }; 
    $('form').on('submit', function(e){
      var is_valid = valid();
      return is_valid;
    });
  });
  </script>
{/literal}
{include file="footer.tpl"}
