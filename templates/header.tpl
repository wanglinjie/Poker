{config_load file="main.conf"}
<title>{$title|default:'Poker'}</title>
<meta charset="utf-8" />
<meta name="copyright" content="xiaomo(wxm4ever@gmail.com)" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="{$public}/img/icon.ico" mce_href="{$public}/img/icon.ico" type="image/x-icon">
<link rel="shortcut icon" href="{$public}/img/icon.ico" mce_href="{$public}/img/icon.ico" type="image/x-icon">
{if $smarty.config.DEBUG == 1}
<link rel="stylesheet/less" type="text/css" href="{$public}/less/main.less">
{else}
<link rel="stylesheet" href="{$public}/css/main.css">
{/if}
<link rel="stylesheet" href="{$public}/css/libs/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="{$public}/css/libs/redmond/jquery-ui-1.10.2.custom.min.css" media="screen">
<script type="text/javascript" src="{$public}/js/libs/jquery.min.js"></script>
<script type="text/javascript" src="{$public}/js/libs/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="{$public}/js/libs/bootstrap.min.js"></script>
<!-- IE6 -->
<!--[if lte IE 6]>
<script>
window.location = "/ie6/index.html";
</script>
<![endif]-->
