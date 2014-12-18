{assign var="seotitle" value=$article->seotitle}
{assign var="seokeywords" value=$article->seokeywords}
{assign var="seodescription" value=$article->seodescription}
{include file="header.tpl"}
<!--main start-->
	<div class="main">
	  <div class="pro_silder">
	   <img src="{$siteurl}/templets/{$templets->directory}/images/aboutus.jpg">
	  </div>
	  <!--div class="bag_nav"><h2>当前位置: <a href="{$siteurl}">首页</a> > {$category->name}</h2></div-->
	  <div class="main_side">
	   {include file="side.tpl"}
	  </div>
	  <div class="main_rside">
	   <div class="rside_xg">
	    <h2 class="rside_xg_h2"><b></b>相关文章</h2>			
	     <ul>
	      {assign var="realtedarticlelist" value=$articledata->TakeArticleList($article->cid,0,6,"viewcount desc")}
						{foreach from=$realtedarticlelist item=articleinfo}
						<li><a href="{formaturl type="article" siteurl=$siteurl name=$articleinfo->filename}">{$articleinfo->title}</a></li>
						{/foreach}		
	    </ul>
       </div>
	   {include file="r_side.tpl"}
	   </div>
	   <div class="main_body">
	    <div class="page-header">
	     <h1>{$article->title}</h1>
		</div>
		<div class="clear"></div>
		<div class="p_content">{$article->content}</div>
	   </div>
   </div>
{include file="footer.tpl"}