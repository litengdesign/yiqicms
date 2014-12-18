{assign var="seotitle" value="产品搜索-$keywords"}
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
      
        {if $keywords==""}
                   <h1 class="page_toubu_title"><span>搜索全部产品：</span></h1>
                       {else}
                   <h1>搜索关键词：<span>{$keywords}</span></h1>
                {/if}
     
     
      </div>
     <div class="clear"></div>
         <div class="pro_cell">



             <ul id="allul">
            
                        {assign var = "keywordslist" value = $productdata->SearchCategoryList($keywords)}
                          {foreach from=$keywordslist item=keywordsinfo}
                           <li>
                            <p class="pro-img">
                                <a href="{formaturl siteurl=$siteurl type="product" name=$keywordsinfo->filename}" target="_blank"><img src="{$keywordsinfo->thumb}"/></a>
                            </p>
                            <p>
                               <a href="{formaturl type="product" siteurl=$siteurl name=$productinfo->filename}" target="_blank">{$keywordsinfo->name}
                                </a>
                            </p>

                        </li>                   
                    {/foreach}
                </ul>
  </div>
       </div>
   </div>
{include file="footer.tpl"}