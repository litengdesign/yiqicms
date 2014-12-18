{assign var="seotitle" value=$category->seotitle}
{assign var="seokeywords" value=$category->seokeywords}
{assign var="seodescription" value=$category->seodescription}
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
	  <div class="page_toubu">
	  	{if (count($subcategory) > 0)}
       <h1 class="page_toubu_title"><span> {$category->name}</span>下的所有分类 </h1>
       <div class="all_c">
       {foreach from=$subcategory item=cat}
	   <li class="all_c_item"><a href="{formaturl type="category" siteurl=$siteurl name=$cat->filename}">{$cat->name}</a></li>				
	   {/foreach}
       </div>
        {/if}
	   	{if (count($subcategory) == 0)}
	     <h1 class="page_toubu_title"><span> {$category->name}</span> </h1>	
	    {/if}
	 
	 
      </div>
     <div class="clear"></div>
		 <div class="pro_cell">
			 {if ($total > 0)}
			 <TABLE border=0 cellSpacing=1 cellPadding=0 width="100%" bgcolor="#ccc">
					<tr>
					 <td height="25" bgcolor="#FFFFFF">产品图片</td>
				     <td bgcolor="#FFFFFF">产品名称/型号</td>
				     <td bgcolor="#FFFFFF">产品简介</td>
					</tr> 
					{foreach from=$productlist item=productinfo}
					<tr>
					<td bgcolor="#FFFFFF">
					<a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank"><img src="{$productinfo->thumb}" title="{$productinfo->name}" alt="{$productinfo->name}"/></a>
					</td>
					<td bgcolor="#FFFFFF"><a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">{$productinfo->name}</a></td>
				    <td bgcolor="#FFFFFF"><textarea class="txt" name="productdescription" style="width:245px;height:110px;">{$productinfo->seodescription}</textarea></td>
					</tr>	 								
					{/foreach}
				 </table>
				 
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
   </div>
{include file="footer.tpl"}