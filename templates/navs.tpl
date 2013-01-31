{config_load file="main.conf"}
<!doctype html>
<html lang="en">
<head>
{include file="header.tpl"}
<script src="{#STATIC_DIR#}/js/libs/less.min.js"></script>
</head>
<body>
<div class="container">
  <div class="banner">
    <div class="banner-img">
      <img src="{#STATIC_DIR#}/img/banner.jpg">
    </div>
    <div class="navs">
      <div class="date left">2013年1月29日星期二</div>
      <div class="nav right">
        <ul>
          <li><a href="#">学校网站首页</a></li>
          <li><a href="index.php">后勤管理首页</a></li>
          <li><a href="update.php">在线报修</a></li>
          <li><a href="#" class="quit_system">退出系统</a></li>
        </ul>
      </div>
    </div>
    <div class="note">公告</div>
  </div>
