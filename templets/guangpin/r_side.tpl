<div class="rside_tj">
	<h2 class="rside_tj_h2"><b></b><span class="rside_tj_h2_name">推荐产品</span><span class="rside_tj_h2_more"><a href="{$siteurl}/category/cpzx.html">more</a></span></h2>
			<div class="clear"></div>			
	  <ul>
	{assign var="newproductlist" value=$productdata->TakeProductList($product->cid,0,20)}
		{foreach from=$newproductlist item=productinfo}
		<li style="line-height:26px; height:26px;">
           <a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}">{$productinfo->name}</a></li>
		{/foreach}	
	  </ul>
</div>
		<div class="rside_zn" >
			<h2 class="rside_zn_h2"><b></b><span class="rside_zn_h2_name">资料下载</span><span class="rside_zn_h2_more"><a href="{$siteurl}/category/zl.html">more</a></span></h2>
			<div class="clear"></div>
			 <ul>
			 {assign var="newslist" value=$articledata->TakeArticleListByName("down",0,6)}
				{foreach from=$newslist item=newsinfo}
				 <li>
				 <a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">{$newsinfo->title}</a>
				 </li>
				{/foreach}
			 </ul>
		
		</div>
		<div class="clear"></div>
			