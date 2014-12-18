{assign var="seotitle" value="产品中心"}
{assign var="seokeywords" value=$metakeywords}
{assign var="seodescription" value=$metadescription}
{include file="header.tpl"}
<!--main start-->
    <div class="main">
       <div  class="categorylist">
         <ul>
           {if (count($categorylist) > 0)}
              {assign var="categorylist" value=$categorydata->GetCategoryList(0,"product",2)}
                {foreach from=$categorylist item=categoryinfo}
	              {if $categoryinfo->pid > 0}
                   {else}  
		  	      <li id="{$categoryinfo->filename}">
		  	      	<a href="{formaturl type="category" siteurl=$siteurl name=$categoryinfo->filename}">{$categoryinfo->name}
		  	      	</a>		 
                  </li>
	           {/if}
       {/foreach}	 
	  <!--/这个是子分类-->
             {else}
             <li>暂无分类</li>
        {/if}
        <li id="lastcate"><a href="#">其他环境</a></li>
        </ul>
     </div>
   </div>
<!--main end-->
{include file="footer.tpl"}