{assign var="seotitle" value=$product->seotitle}
{assign var="seokeywords" value=$product->seokeywords}
{assign var="seodescription" value=$product->seodescription}
{include file="header.tpl"}
<!--main start-->
	<div class="main">
	  <div class="pro_silder">
	   <img src="{$siteurl}/templets/{$templets->directory}/images/pro_silder.jpg">
	  </div>
	  <!--div class="bag_nav"><h2>当前位置: <a href="{$siteurl}">首页</a> > {$category->name}</h2></div-->
	  <div class="main_side">
	   {include file="side.tpl"}
	  </div>
	  <div class="main_rside">
	  {include file="r_side.tpl"}
	  </div>
	   <div class="main_body">
	    <div class="page-header">
	     <h1>{$product->name}</h1>
		</div>
		<div class="p_content">{$product->content}</div>
	   </div>
   </div>
{include file="footer.tpl"}