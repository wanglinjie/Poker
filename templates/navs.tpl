{config_load file="main.conf"}
<!doctype html>
<html lang="en">
<head>
{include file="header.tpl"}
<script src="{$public}/js/libs/less.min.js"></script>
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
    <div class="note">公告</div>
  </div>
