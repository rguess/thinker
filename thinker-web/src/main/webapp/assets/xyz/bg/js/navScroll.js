/*
此插件基于Jquery
插件名：jquery.ScrollNav(滑动导航条)
版本 1.0
Blog：www.haw86.com
*/
(function($){
	$.fn.ScrollNav = function(options){
        var opts = $.extend({}, $.fn.ScrollNav.defualts, options);
		var _this = $(this);
		
		$.fn.ScrollNav.defaultValue(opts,$(this));//还原默认
		
		$(this).hover(function(){
			 var leftValue = $.fn.ScrollNav.countLeft(opts,$(this)); //统计左侧的Value
			 var widthValue = $(this).width();
			 if($(this).find("li").length>0){
				 $.fn.ScrollNav.openSubNav(opts,$(this));
			 }
			 $.fn.ScrollNav.setScroll(opts,widthValue,leftValue);//添加动画
			},function(){
				 if($(this).find("li").length>0){
					 $.fn.ScrollNav.closeSubNav(opts,$(this));
				 }
				 $.fn.ScrollNav.defaultValue(opts,$(this));//还原默认
				});
		
		
	}
	//plugin defaults
	$.fn.ScrollNav.defualts ={
		scrollObj:".nav > .scrollObj",//滑动的父对象
		speed:"slow" //子菜单的宽度
	}
	
	//子插件：获取左侧Value
	$.fn.ScrollNav.countLeft = function(opts,liThis){
		var liIndex = liThis.index();
		var leftValue = 0;
		for(i=0;i<liIndex;i++){
			var listWidth = liThis.parent().children().eq(i).width();
			leftValue = leftValue+listWidth;
		}
		return leftValue;
		
	}
	//子插件：添加滚动动画
	$.fn.ScrollNav.setScroll = function(opts,widthValue,leftValue){
		$(opts.scrollObj).stop(true,false).delay(100).animate({width:widthValue,left:leftValue},opts.speed);
	}
	
	//子插件：展开二级导航
	$.fn.ScrollNav.openSubNav = function(opts,liThis){
		var heightValue = $(liThis).find("li").length*($(liThis).find("li").height());
		$(liThis).children("ul").animate({height:heightValue},opts.speed);
	}
	
	//子插件：展开二级导航
	$.fn.ScrollNav.closeSubNav = function(opts,liThis){
		$(liThis).children("ul").animate({height:0},opts.speed);
	}
	
	//子插件：获取默认落点
	$.fn.ScrollNav.defaultValue = function(opts,liThis){
		var liIndex = liThis.parent().children(".current").index();
		var widthValue =  liThis.parent().children(".current").width();
		var leftValue = 0;
		for(i=0;i<liIndex;i++){
			var listWidth = liThis.parent().children().eq(i).width();
			leftValue = leftValue+listWidth;
		}
		$(opts.scrollObj).stop(true,false).animate({width:widthValue,left:leftValue},opts.speed);
	}
})(jQuery);    

