$(document).ready(function(){
	$(".hmain").hover(function(){
		$(this).children("ul").show();
		changeIcon($(this).children("a"));
		
	},function(){
		$(this).children("ul").hide();
		changeIcon($(this).children("a"));
	});

	/**
     首页图片新闻滚动
	*/
	var $t_li=$(".ul_tag li");
	$t_li.mouseover(
      function(){
          $(this).addClass("p_active").siblings().removeClass("p_active");
          var index=$t_li.index(this);
          $(".news_ul li").eq(index).show().siblings().hide();
      });
	/*左侧搜索栏点击事件*/
   $(".show-sou").click(function(){
        $("#sou-cen").toggle();
        $("#prosearch .text").focus();
   });
   document.body.onscroll=function(){
    $('#sou-cen').hide();

    }



});
/**
 * 修改主菜单的指示图标
 */
function changeIcon(mainNode) {
	if (mainNode) {
		if (mainNode.css("background-image").indexOf("collapsed.gif") >= 0) {
			mainNode.css("background-position","url('-181px -51px");
		} else {
			mainNode.css("background-position","-181px -63px");
		}
	}
}

$(document).ready(function(){
	$('.menu li a').each(function(){
		if($($(this))[0].href==String(window.location))
			$(this).addClass('active');
	});
});
 $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
 /**
 * 回到页面顶部
 * @param acceleration 加速度
 * @param time 时间间隔 (毫秒)
 **/
function goTop(acceleration, time) {
	acceleration = acceleration || 0.1;
	time = time || 16;
	var x1 = 0;
	var y1 = 0;
	var x2 = 0;
	var y2 = 0;
	var x3 = 0;
	var y3 = 0;
 
	if (document.documentElement) {
		x1 = document.documentElement.scrollLeft || 0;
		y1 = document.documentElement.scrollTop || 0;
	}
	if (document.body) {
		x2 = document.body.scrollLeft || 0;
		y2 = document.body.scrollTop || 0;
	}
	var x3 = window.scrollX || 0;
	var y3 = window.scrollY || 0;
 
	// 滚动条到页面顶部的水平距离
	var x = Math.max(x1, Math.max(x2, x3));
	// 滚动条到页面顶部的垂直距离
	var y = Math.max(y1, Math.max(y2, y3));
 
	// 滚动距离 = 目前距离 / 速度, 因为距离原来越小, 速度是大于 1 的数, 所以滚动距离会越来越小
	var speed = 1 + acceleration;
	window.scrollTo(Math.floor(x / speed), Math.floor(y / speed));
 
	// 如果距离不为零, 继续调用迭代本函数
	if(x > 0 || y > 0) {
		var invokeFunction = "goTop(" + acceleration + ", " + time + ")";
		window.setTimeout(invokeFunction, time);
	}
};
 /* 回到页面顶部end*/