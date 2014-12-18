{assign var="seotitle" value="产品中心"}
{assign var="seokeywords" value=$category->seokeywords}
{assign var="seodescription" value=$category->seodescription}
{include file="header.tpl"}
<!--main start-->
	<div class="main">
	  <div class="pro_silder">
	   <img src="{$siteurl}/templets/{$templets->directory}/images/pro_silder.jpg">
	  </div>
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
	     <h1 class="page_toubu_title"><span> 产品中心</span> </h1>	
	    {/if}
	 
	 
      </div>
     <div class="clear"></div>
		 <div class="pro_cell">

			 <ul id="allul">

					{assign var="productlist" value=$productdata->TakeProductList(0,0,1000)}
                        {foreach from=$productlist item=productinfo}

					     <li>
					     	<p class="pro-img">
							  <a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">
								<img src="{$productinfo->thumb}" title="{$productinfo->name}" alt="{$productinfo->name}"/>
							   </a>
							 </p>
							 <p>
						   
						       	<a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">{$productinfo->name}
						       	</a>
						       
						    </p>

						</li>

					{/foreach}
			</ul> 
  </div>
	   </div>
   </div>
{include file="footer.tpl"}