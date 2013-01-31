{config_load file="main.conf"}
<div class="paginator">
  <div class="paging_detail">
    [<span class="paging_page">{$page}</span>/<span class="paging_total">{$total}</span>]每页<span class="paging_limit">20</span>条 共<span class="paging_total_counts">{$total_counts}</span>条记录
  </div>
  {if $total>1}
    <div class="paging_op">
      {if $page>1}
        <a class="first" href="#">首页</a>
        <a class="prev" href="#">上一页</a>
      {/if}
      <a class="next" href="#">下一页</a>
      <a class="last" href="#">尾页</a>
    </div>
  {/if}
</div>

{literal}
<script>
$(function(){
    var paginator = $('.paginator');
    var paging_op = $('.paging_op');
    var paging_page = paginator.find('.paging_page').text().trim();
    var paging_total = paginator.find('.paging_total').text().trim();

    paging_op.on('click', '.first', function(e){
      e.preventDefault();
      window.location = window.location.pathname;
    });
    paging_op.on('click', '.last', function(e){
      e.preventDefault();
      window.location = window.location.pathname + '?p=' + paging_total;
    });
    paging_op.on('click', '.prev', function(e){
      e.preventDefault();
      var page = paging_page-1;
      window.location = window.location.pathname + '?p=' + page;
    });
    paging_op.on('click', '.next', function(e){
      e.preventDefault();
      var page = paging_page+1;
      window.location = window.location.pathname + '?p=' + page;
    });
});
</script>
{/literal}
