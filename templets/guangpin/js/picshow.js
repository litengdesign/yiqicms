	function getid(o){ return (typeof o == "object")?o:document.getElementById(o);}
	function getNames(obj,name,tij)
	{
		var plist = getid(obj).getElementsByTagName(tij);
		var rlist = new Array();
		for(i=0;i<plist.length; ++i){if(plist[i].getAttribute("name") == name){rlist[rlist.length] = plist[i];}}
		return rlist;
	}

	function fiterplay(obj,num,t,name,c1,c2)
	{
		var fitlist = getNames(obj,name,t);
		for(i=0;i<fitlist.length;++i)
		{
			if(i == num)
			{
				fitlist[i].className = c1;
			}
			else
			{
				fitlist[i].className = c2;
			}
		}
	}
	function play(obj,num)
	{
		var s = getid('simg');
		var i = getid('info');
		var b = getid('bimg');
		try	
		{
			with(b)
			{
				filters[0].Apply();	
				fiterplay(b,num,"div","f","dis","undis");	
				fiterplay(s,num,"div","f","","f1");
				fiterplay(i,num,"div","f","dis","undis");
				filters[0].play();
			}
		}
		catch(e)
		{
				fiterplay(b,num,"div","f","dis","undis");
				fiterplay(s,num,"div","f","","f1");	
				fiterplay(i,num,"div","f","dis","undis");
		}
	}

	var autoStart = 0;
	var n = 0;		var s = getid("simg");
		var x = getNames(s,"f","div");
	function clearAuto() {clearInterval(autoStart);};
	function setAuto(){autoStart=setInterval("auto(n)", 3000)}
	function auto()	{


		n++  ;
		if(n>(x.length-1))
		{ n = 0;
		clearAuto();
		 }
		play(x[n],n);
		
	}
	function ppp(){
	setAuto();
	
	}
ppp();
//滚动插件
(function($){
$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,15):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,15):5000, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,15):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                }
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
                },function(){
                        timerID=setInterval("scrollUp()",timer);
                }).mouseout();
        }        
})
})(jQuery);

$(document).ready(function(){
        $("#scrollDiv").Scroll({line:4,speed:500,timer:1000});
});