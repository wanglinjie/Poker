{config_load file="main.conf"}
<!doctype html>
<html lang="en">
<head>
{include file="header.tpl"}
{if $smarty.config.DEBUG == 1}
<script src="{$public}/js/libs/less.min.js"></script>
{/if}
</head>
<body>
<div class="container">
  <div class="banner">
    <div class="banner-img">
      <img src="{$public}/img/banner.jpg">
    </div>
    <div class="navs">
      <div class="date left">2013年1月29日星期二</div>
      <div class="nav right">
        <ul>
          <li><a href="#">学校网站首页</a></li>
          <li><a href="{$domain}/index.php" class="home">后勤管理首页</a></li>
          <li><a href="{$domain}/app/update.php">在线报修</a></li>
          <li><a href="#" class="quit_system">退出系统</a></li>
        </ul>
      </div>
    </div>
    <div class="note">
      <div class="weather_report">
        威海,5月,多云, 低温-7度,无持续风向,微风
      
        后勤服务中心学生餐厅副厨师长人选公示
        后勤服务中心学生餐厅采购岗位聘用结果公示
        近期绿化工程项目公告
      </div>
    </div>
  </div>
