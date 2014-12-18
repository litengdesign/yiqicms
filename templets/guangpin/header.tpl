<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>{$seotitle} - {$sitename}</title>
{if $searchtitle != "-" && $searchtitle != ""}
<meta name="searchtitle" content="{$searchtitle}" />
{/if}
<meta name="author" content="{$siteauthor}"/>
<meta name="copyright" content="{$copyright}"/>
{if $seokeywords != "-" && $seokeywords != ""}
<meta name="keywords" content="{$seokeywords}" />
{/if}
{if $seodescription != "-" && $seodescription != ""}
<meta name="description" content="{$seodescription}" />
{/if}
{if $generator != "-" && $generator != ""}
<meta name="generator" content="{$generator}" />
{/if}
<link href="{$siteurl}/templets/{$templets->directory}/css/style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script style="text/javascript" src="http://101.shangyu17.net/templets/0728/images/productlist_roll.js"></script>
<script  type="text/javascript" src="{$siteurl}/templets/{$templets->directory}/js/my.js"></script>
<script style="text/javascript" src="{$siteurl}/templets/{$templets->directory}/js/jquery.flexslider.js"></script>
</head>
<body>
<div class="wrap">
	<!--header start-->
	<div class="header-top">
	 <p>
      E: {$companyemail} | T: {$companyphone}
     </p>
	</div>
	<div class="header">
	<div class="logo"><a href="{$siteurl}"><img  src="{$siteurl}/templets/{$templets->directory}/images/logo.png"/></a></div> 
	<div class="menu">
	<ul>
		{assign var="topnavlist" value=$navdata->TakeNavigateList("顶部导航",0,6)}
		 {foreach from=$topnavlist item=navinfo}
		   <li><a href="{$navinfo->url}" title="{$navinfo->name}">{$navinfo->name}</a></li>
		 {/foreach}
	  </ul>
  </div>
    </div>
	<!--menu end-->

	