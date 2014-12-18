{assign var="seotitle" value="产品中心"}
{assign var="seokeywords" value=$metakeywords}
{assign var="seodescription" value=$metadescription}
{include file="header.tpl"}
	<!--main start-->
	<div class="mainbody">
			<div class="productlist">
				<h2>所有产品</h2>				
				<ul id="allul">

					{assign var="productlist" value=$productdata->TakeProductList(0,0,1000)}
                        {foreach from=$productlist item=productinfo}

					     <li>
					     	<p>
						       <span>	
						       	<a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">{$productinfo->name}
						       	</a>
						       </span>
						    </p>
					     	<p class="pro-img">
							  <a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">
								<img src="{$productinfo->thumb}" title="{$productinfo->name}" alt="{$productinfo->name}"/>
							 
							  <span>
							  	
							  </span>
							   </a>
							  </p>

						</li>

					{/foreach}
			</ul>
			<h2 id="show" onclick="show()"><span>显示更多</span></h2>
				
			
			</div>
	</div>
	<!--main end-->
{include file="footer.tpl"}