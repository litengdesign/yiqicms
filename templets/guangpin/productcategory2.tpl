{assign var="seotitle" value=$category->seotitle}
{assign var="seokeywords" value=$category->seokeywords}
{assign var="seodescription" value=$category->seodescription}
{include file="header.tpl"}
<!--main start-->
 <div class="prolist">
  <div class="page-header">
   <h1 class="page-title"> {$category->name} </h1>
   <ul>
   <li class="all_cat">所有分类</li>
    {foreach from=$subcategory item=cat}
	 <li class="cat-item"><a href="{formaturl type="category" siteurl=$siteurl name=$cat->filename}">{$cat->name}</a></li>				
	{/foreach}
   </ul>
  </div>
  <div class="pro_cell">
    {if ($total > 0)}
		{foreach from=$productlist item=productinfo}
			 <div class="thumb">
			  <a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">
			    <img src="{$productinfo->thumb}" title="{$productinfo->name}" alt="{$productinfo->name}"/></a>
			  <div class="entry">
			     <h2 class="entry-title"><a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">{$productinfo->name}</a></h2>
				
			  </div>
			 </div>								
					{/foreach}
			  <div class="clear"></div>
			  <div class="pager">
			  <label>共{$total}个产品 当前{$curpage}/{$totalpage}页 </label>
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