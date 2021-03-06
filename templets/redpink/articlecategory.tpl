{assign var="seotitle" value=$category->seotitle}
{assign var="seokeywords" value=$category->seokeywords}
{assign var="seodescription" value=$category->seodescription}
{include file="header.tpl"}
<!--main start-->
	<div class="main">
		<div class="navigate">当前位置: <a href="{$siteurl}">首页</a> > {$category->name}</div>
		<div class="clear">&nbsp;</div>
		<div class="mainside">
		{include file="side.tpl"}
		</div>
		<div class="mainbody">			
			{if (count($subcategory) > 0)}
			{if ($curpage == 1)}
			<!--sub_category-->
			<div id="sub_category" class="combox">
				<h2>{$category->name}下的分类</h2>
				<div class="content">
					<ul>
						{foreach from=$subcategory item=cat}
						<li><a href="{formaturl type="category" siteurl=$siteurl name=$cat->filename}">{$cat->name}</a></li>				
						{/foreach}
					</ul>
				</div>
			</div>
			<!--/sub_category-->
			<div class="clear">&nbsp;</div>
			{/if}	
			{/if}
			<div class="combox" id="category">
				<h2>{$category->name}</h2>
				<div class="content">
				{if ($total > 0)}						
					{foreach from=$articlelist item=artinfo}   		
					<div class="result_list">
					<span class="fr">{$artinfo->adddate}</span>
						<a href="{formaturl siteurl=$siteurl type="article" name=$artinfo->filename}" target="_blank">{$artinfo->title}</a>
					</div>
					<div class="line"></div>			
					{/foreach}
					<div class="clear">&nbsp;</div>
					<div class="pager">
						<label>共{$total}个文章 当前{$curpage}/{$totalpage}页 </label>
						{assign var="nextpage" value="`$curpage+1`"}
						{assign var="prepage" value="`$curpage-1`"}
						<span class="fr">                
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
		</div>
	</div>
	<!--main end-->
{include file="footer.tpl"}