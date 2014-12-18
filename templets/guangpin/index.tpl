{assign var="seotitle" value=$titlekeywords}
{assign var="seokeywords" value=$metakeywords}
{assign var="seodescription" value=$metadescription}
{include file="header.tpl"}
	<div class="clear"></div>
	<div id="content">
    <div class="slider"> 
       <div class="slider_le">
	   <!--banner star-->
        <div class="flexslider">
           <ul class="slides">
            <li>
  	    	   <img src="{$siteurl}/templets/{$templets->directory}/images/ad1.jpg" />
  	    	</li>
  	    	<li>
  	    	   <img src="{$siteurl}/templets/{$templets->directory}/images/ad2.jpg" />
  	    	</li>
  	    	<li>
  	    	   <img src="{$siteurl}/templets/{$templets->directory}/images/ad3.jpg" />
  	    	</li>
          </ul>
        </div> 
	   <!--banner end-->
	 </div>
	  <div class="slider_ri">
	   <p><img src="{$siteurl}/templets/{$templets->directory}/images/we-are-scope.gif"/></p>
	   <p>上海林频仪器股份有限公司座落于中国上海市科技产业基地闵行经济技术开发区，是一家专业从事环境试验设备研发、林频仪器现已发展成为环境试验设备领域的龙头企业之一。</p>
       <p>依托知名高校综合性人才和科技资源，国内一流的检测技术、低温检测装备和仪器，在低温材料的物理特性和低温绝热技术研究方面，拥有国内最先进的核心技术、计算软件和研究手段，此举开创了林频仪器在高端环境试验设备技术的领先地位..</p>
       <p><a href="{$siteurl}/article/about.html">了解更多…</a></p>
	 </div>
    </div>
    <div class="clear"></div>
    <div class="mainbody">
	    <!--推荐产品开始-->
		<h2 class="related-title"><span>我们的产品</span></h2>
		<div class="rbn">
			{assign var="prc" value=$productdata->TakeProductList(0,0,8,"adddate desc")}
			<div class="prcpic">
				<div  class="productlistx">
					<div class="rollproductlists">
						<div class="blkproductlistx">
						    <div class="LeftButton" id="LeftArr1">
							  <span class="bottom_prevNIcon"></span>
							</div>
						<div class="Cont" id="ISL_Cont_11">
					        {foreach from=$prc item="prcinfo"}
					        <div class="box">
								<div class="fang">
									<div class="picFit" >
						                <p>
						                	<a href="{formaturl type="product" siteurl=$siteurl name=$prcinfo->filename}">
						                		<img src="{$prcinfo->thumb}"/>
						                	</a>
						                </p>
						                <p class="imgTitleInfoTop">
						                	<a href="{formaturl type="product" siteurl=$siteurl name=$prcinfo->filename}">{$prcinfo->name|truncate:32}</a>
						                </p>

											</div>
										</div>
						            </div>
					            {/foreach}
							</div>
							<div class="RightButton" id="RightArr1">
							    <span class="bottom_nextNIcon"></span>
							</div>
											
{literal}
<script language="javascript" type="text/javascript">
<!--//--><![CDATA[//><!--
var scrollPic_03 = new ScrollPic();
scrollPic_03.scrollContId   = "ISL_Cont_11"; //内容容器ID
scrollPic_03.arrLeftId      = "LeftArr1";//左箭头ID
scrollPic_03.arrRightId     = "RightArr1"; //右箭头ID

scrollPic_03.frameWidth     = 960;//显示框宽度
scrollPic_03.pageWidth      = 187; //翻页宽度

scrollPic_03.speed          = 10; //移动速度(单位毫秒，越小越快)
scrollPic_03.space          = 10; //每次移动像素(单位px，越大越快)
scrollPic_03.autoPlay       = false; //自动播放
scrollPic_03.autoPlayTime   = 3; //自动播放间隔时间(秒)
scrollPic_03.initialize(); //初始化//--><!]]>
</script>
{/literal}
					    </div>
					</div>
				</div>
				</div>
			</div>
		
<!--精品展示end-->
	   </div>
<div class="clear"></div>
	<div class="con_art">
        <div class="art_01">
		    <h2>
			   	<span class="h_name"><b></b>新闻动态</span>
			   	<span class="more">
			   		<a href="{formaturl type="category" siteurl=$siteurl name=news}">more</a>
			   	</span>
			</h2>
			<div class="clear"></div>
			<ul class="news_ul">
				{assign var="newslist" value=$articledata->TakeArticleTopListByName("news",0,5)}
			{foreach from=$newslist item=newsinfo}
			 <li>
			  <div class="pic_news">
				<div class="pic_01">
                    <a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">
						<img src="{$newsinfo->newsthumb}" title="{$newsinfo->name}" alt="{$newsinfo->name}"/>
					</a>
				</div>
				<div class="pic_02">
                    <a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">{$newsinfo->title}
                    </a>
                    <p>
                    {$newsinfo->seodescription|truncate:120}
                </p>
                <div class="n_more">
                    <a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">
                    	详情
                    </a>
                </div>
				</div>
				
			</div>
		  </li>
		  {/foreach}
		</ul>
		<ul class="ul_tag">
			<li class="p_active">1</li>
		    <li>2</li>
		    <li>3</li>
		    <li>4</li>
		    <li>5</li>
		</ul>
	    </div>
	    <div class="art_02">
		    <h2>
			    <span class="h_name"><b></b>技术文章</span>
			    <span class="more">
			    	<a href="{formaturl type="category" siteurl=$siteurl name=article}">more</a>
			    </span>
		    </h2>
		    <div class="clear"></div>
			<ul>
				{assign var="newslist" value=$articledata->TakeArticleListByName("article",0,7)}
				{foreach from=$newslist item=newsinfo}
				<li>
					<a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">
						{$newsinfo->title}
					</a>
				</li>
				{/foreach}
			</ul>		
	        </div>
			  <div class="art_03">
			   <h2><span class="h_name"><b></b>标准参考</span><span class="more"><a href="{formaturl type="category" siteurl=$siteurl name=down}">more</a></span></span></h2>
			    <div class="clear"></div>
			    <ul>
			    {assign var="newslist" value=$articledata->TakeArticleListByName("down",0,7)}
					{foreach from=$newslist item=newsinfo}
					
					 <li> <a href="{formaturl type="article" siteurl=$siteurl name=$newsinfo->filename}" title="{$newsinfo->title}" target="_blank">{$newsinfo->title}</a></li>
					
					{/foreach}
					</ul>
			  </div>
			</div>	
	    </div>
          <div class="clear"></div>
			 <div class="links"><span>友情链接：</span>
	  {assign var="linklist" value=$linkdata->GetLinkList()}
					{foreach from=$linklist item=linkinfo}
						<a href="{$linkinfo->url}" title="{$linkinfo->title}" target="_blank">{$linkinfo->title}</a>
					{/foreach}
	 </div>			
	{include file="footer.tpl"}