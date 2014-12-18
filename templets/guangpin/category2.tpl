{if $category->type == "article"}						
{include file="articlecategory2.tpl"}
{elseif $category->type == "product"}
{include file="productcategory2.tpl"}
{/if}