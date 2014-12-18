  <div class="side_move">
 <div class="side_combox">
	<h2 class="pro_list"><b></b>产品目录</h2>
	<div class="side_con">
	  <ul>
      {if (count($categorylist) > 0)}
      {assign var="categorylist" value=$categorydata->GetCategoryList(0,"product",2)}
      {foreach from=$categorylist item=categoryinfo}
	    {if $categoryinfo->pid > 0}
		 <!--/通过观察，顶级栏目的pid都是0，由此可以通过判断得出大于0的是二级菜单-->
		   <li>
             <a href="{formaturl type="category" siteurl=$siteurl name=$categoryinfo->filename}">{$categoryinfo->name}</a>
           </li>  
		     <!--/这个是子分类-->    
        {else}  
		  	 </ul>
			 </li>
             <li class="hmain"><a href="{formaturl type="category" siteurl=$siteurl name=$categoryinfo->filename}">{$categoryinfo->name}</a>
	           <ul>  

          {/if}
		
      {/foreach}	 
	  <!--/这个是子分类-->
      {else}
      <li>暂无分类</li>
      {/if}
    </ul>
				</div>
			</div>		
			<div class="clear"></div>
			  <div class="side_comm">
				<h2><b></b>联系我们</h2>
				<div class="clear"></div>
					<ul>
					  {if $companyqq != "" && $companyqq != "-"}
			            <li>电话:{$companyphone}</li>
						{/if}
						{if $companymobile != "" && $companymobile != "-"}
						<li>手机:{$companymobile}</li>
						{/if}
						{if $companyfax != "" && $companyfax != "-"}
						<li>传真:{$companyfax}</li>
						{/if}
						{if $companyemail != "" && $companyemail != "-"}
						<li>邮箱:{$companyemail}</li>
						{/if}
								{if $companyurl != "" && $companyurl != "-"}
						<li>主页:{$companyurl}</li>
						{/if}
						{if $companyaddr != "" && $companyaddr != "-"}
						<li>地址:{$companyaddr}</li>
						{/if}
					</ul>
			</div>
</div>
			<div class="clear"></div>
		