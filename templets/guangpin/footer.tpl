	<div class="clear"></div>
	<!--footer start-->
    <div class="footer">
		<div class="clear"></div>
	     {$sitecopy}
    </div>
    <div class="gonav">

    <span class="top" onclick="goTop();return false;"></span>
    <span class="pro_l" onclick="window.location.href='{$siteurl}/allproduct.php'"></span>
    <span class="go_qq" onclick="window.location.href='http://webchat.b.qq.com/webchat.htm?sid=218808P8z8p8y8K8z8y8z'"></span>
    <span class="show-sou" onclick="showsearch()"></span>
    <div id="sou-cen">
		<form action="{$siteurl}/search.php" method="GET" id="prosearch">
                
                         <input type="text" class="text" name="keywords" autocomplete="on" placeholder="搜索"/>
                         <input type="image" class="buttom" src="{$siteurl}/templets/{$templets->directory}/images/searchimg.png" width="24" height="24" />
                       </form> 
	</div>

</div>
	<!--footer end-->
	</div>
</body>

</html>
