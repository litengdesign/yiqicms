{assign var="seotitle" value=$category->seotitle}
{assign var="seokeywords" value=$category->seokeywords}
{assign var="seodescription" value=$category->seodescription}
{include file="header.tpl"}
<!--main start-->
	<div class="main">
	  <div class="pro_silder">
	   <img src="{$siteurl}/templets/{$templets->directory}/images/news.jpg">
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
		 <h1 class="page-title">{$category->name} </h1>
		{if (count($subcategory) > 0)}
		{if ($curpage == 1)}
          <ul>
           <li class="all_cat">所有分类</li>
		   	{foreach from=$subcategory item=cat}
		   <li class="cat-item"><a href="{formaturl type="category" siteurl=$siteurl name=$cat->filename}">{$cat->name}</a></li>				
			{/foreach}
         </ul>
		{/if}	
		{/if}	
	  </div>
	  <div class="clear"></div>
		<div class="p_content">
		  {if ($total > 0)}
					{foreach from=$articlelist item=artinfo}   		
					<div class="result_list">
					<span class="fr">{$artinfo->adddate|date_format:"[%Y-%m-%d]"}</span>
						<a href="{formaturl siteurl=$siteurl type="article" name=$artinfo->filename}" target="_blank">{$artinfo->title}</a>
					</div>
					<div class="line"></div>			
					{/foreach}
					</div>
					<div class="pager">
						<label>共{$total}个文章 当前{$curpage}/{$totalpage}页 </label>
						{assign var="nextpage" value="`$curpage+1`"}
						{assign var="prepage" value="`$curpage-1`"}
						<span>                
						{if ($curpage > 1)}
						<a href="{formaturl type="category" siteurl=$siteurl name=$category->filename}">首页</a>
						<a href="{formaturl type="category" siteurl=$siteurl name=$category->filename page=$prepage}">上一页</a>
						{/if}
						{if ($curpage > 0) && ($curpage < $totalpage)}
						<a href="{formaturl type="category" siteurl=$siteurl name=$category->filename page=$nextpage}">下一页</a>
						<a href="{formaturl type="category" siteurl=$siteurl name=$category->filename page=$totalpage}">尾页</a>
						{/if}               
						</span>
					</div>
				{else}
				该分类下暂时没有内容
			    {/if}	
		
	   </div>
   </div>
{include file="footer.tpl"}


	