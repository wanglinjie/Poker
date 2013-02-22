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
          <li><a href="{$domain}/index.php" class="home">后勤服务中心首页</a></li>
          <li><a href="{$domain}/app/update.php">在线报修</a></li>
          <li><a href="#">报修查询</a></li>
          <li><a href="#" class="quit_system">退出系统</a></li>
        </ul>
      </div>
    </div>
    <div class="note">
      <div class="weather_report">
        <TABLE cellSpacing=0 cellPadding=0 width=1024 align=center border=0> 
          <TBODY> 
            <TR>
              <TD> 
                <DIV id=demo style="OVERFLOW: hidden; WIDTH: 1024px;"> 
                  <TABLE cellSpacing=0 cellPadding=0 align=left bgcolor=#CCC border=0 cellspace="0"> 
                    <TBODY> 
                      <TR> 
                        <TD id=demo1 vAlign=top><table width="1024" bgcolor=#CCC border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td width="171" bgcolor=#CCC><div align="center" class="msg" style="background-color:#CCC;">后勤服务中心竭诚为您服务，欢迎使用在线报修系统！</div></td> 
                      </tr> 
                  </table></TD> 
                  <TD id=demo2 vAlign=top> </TD></TR></TBODY></TABLE></DIV> 
    </TD></TR></TBODY></TABLE></TD></TR></TABLE> 
    </div></div>
  </div>
{literal}
<SCRIPT> 
$(function(){
  var speed3=10//速度数值越大速度越慢 
  var t=false; 
  var id="aa"; 
  document.getElementById("demo2").innerHTML=document.getElementById("demo1").innerHTML 
  function Marquee(){ 
  if(document.getElementById("demo2").offsetWidth-document.getElementById("demo").scrollLeft<=0) 
  document.getElementById("demo").scrollLeft-=document.getElementById("demo1").offsetWidth 
  else{ 
  document.getElementById("demo").scrollLeft++ 
  } 
  t=false; 
  } 
  function RMarquee(){  
  if(document.getElementById("demo").scrollLeft<=0) 
    document.getElementById("demo").scrollLeft+=document.getElementById("demo2").offsetWidth 
    else{ 
    document.getElementById("demo").scrollLeft-- 
    } 
    t=true; 

  } 
  function clickdiv(){ 
  clearInterval(MyMar) 
  Marquee(); 
  } 
  function Rclickdiv(){ 
  clearInterval(MyMar) 
  RMarquee(); 
  } 
  var MyMar=setInterval(Marquee,speed3) 
  document.getElementById("demo").onmouseover=function() {clearInterval(MyMar)} 
  document.getElementById("demo").onmouseout=function() {if(t){MyMar=setInterval(RMarquee,speed3)}else{MyMar=setInterval(Marquee,speed3)}} 
});
</SCRIPT> 
{/literal}
