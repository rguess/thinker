/**
 * 格式化日期
 * @param format
 * @returns
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	};

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

/**
 * 日期相减
 * @param sDate1
 * @param sDate2
 * @returns
 */
function DateDiff(sDate1,sDate2)
{ 
    var arrDate,objDate1,objDate2,intDays;
    arrDate=sDate1.split("-");
    objDate1=new Date(arrDate[1]+'-'+arrDate[2]+'-'+arrDate[0]);
    arrDate=sDate2.split("-");
    objDate2=new Date(arrDate[1] + '-'+arrDate[2]+'-'+arrDate[0]);
    intDays=parseInt(Math.abs(objDate1-objDate2)/1000/60/60/24);
    return intDays;
}

/**
 * js原型链实现replaceAll
 */
String.prototype.replaceAll  = function(s1,s2){
    return this.replace(new RegExp(s1,"gm"),s2);
};

/**
 * js实现endWith
 */
String.prototype.endWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substring(this.length-str.length)==str)
	  return true;
	else
	  return false;
	return true;
}

/**
 * js实现startWith
 */
String.prototype.startWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substr(0,str.length)==str)
	  return true;
	else
	  return false;
	return true;
}

/**
 * 数组扩展---根据下标删除某元素
 */
Array.prototype.del=function(n) {
	if(n<0) return this;
	else
		return this.slice(0,n).concat(this.slice(n+1,this.length));
};

/**
 * 数组扩展---根据一个值删除某元素
 */
Array.prototype.delByValue=function(value) {
	for(var i = 0;i<this.length;i++){
		if(this[i] == value){
			this.del(i);
		}
	}
};

/**
 * 数组扩展判断某值知否在数组中
 */
Array.prototype.isContainsValue=function(value) {
	for(var i in this){
        if(this[i]==value){
            return true;
        }
    }
    return false;
};

/**
 * js阻止冒泡事件
 */
function stopPropagation(e) {
    e = e || window.event;
    if(e.stopPropagation) { //W3C阻止冒泡方法
        e.stopPropagation();
    } else {
        e.cancelBubble = true; //IE阻止冒泡方法
    }
}

/**
 * 遮罩层函数
 */
function blockUI() {
	$(".page-content").block({
		message : '<img src="' + ctx + '/assets/img/loading.gif">',
		css : {
			border: 'none',
            padding: '2px',
            backgroundColor: 'none'
		},
		overlayCSS : {
			backgroundColor: '#000',
            opacity: 0.05,
            cursor: 'wait'
		}
	});
}

/**
 * 取消遮罩层
 */
function unBlockUI(){
	$(".page-content").unblock();
}

(function ($) {
  /**
   * 居中
   */
  $.fn.center = function (settings) {
    var style = $.extend({
      position: 'absolute', //absolute or fixed
      top     : '50%', //50%即居中，将应用负边距计算，溢出不予考虑了。
      left    : '50%',
      zIndex  : 2009,
      relative: true //相对于包含它的容器居中还是整个页面
    }, settings || {});

    return this.each(function () {
      var $this = $(this);

      if (style.top == '50%') style.marginTop = -$this.outerHeight() / 2;
      if (style.left == '50%') style.marginLeft = -$this.outerWidth() / 2;
      if (style.relative && !$this.parent().is('body') && $this.parent().css('position') == 'static') $this.parent().css('position', 'relative');
      delete style.relative;
      //ie6
      if (style.position == 'fixed' && $.browser.version == '6.0') {
        style.marginTop += $(window).scrollTop();
        style.position = 'absolute';
        $(window).scroll(function () {
          $this.stop().animate({
            marginTop: $(window).scrollTop() - $this.outerHeight() / 2
          });
        });
      }
      $this.css(style);
    });
  };
  
  /**
   * 可移动
   */
  $.fn.move = function () {
	  
	  var $win = $(this);
	  var $title = $win.find(".portlet-title");
	  
      var b = false;
      var x;
      var y;
      $title.css("cursor", "move");
      $title.mousedown(
        function (e) {
            //x,y坐标是点击事件点和外该组件的距离差
            b = true;
            x = e.pageX - parseInt($win.position().left);
            y = e.pageY - parseInt($win.position().top);
        });
      $(document).mousemove(
          function (e) {
              //只要不释放鼠标就可以拖动div
              if (b) {
                  var divleft = e.pageX - x;
                  var divtop = e.pageY - y;
                  //设置拖动左，上位置
                  $win.css({ "left": divleft, "top": divtop });
              }
          }
        ).mouseup(function () {
            b = false;
        });
  };
  
  /**
   * 指定div在指定位置弹出
   */
  $.fn.CurrentPosition = function (offsetX, offsetY, obj) {
      var X = $(this).offset().top;
      var Y = $(this).offset().left;
      $(obj).css("left", X + offsetX + "px");
      $(obj).css("top", Y + offsetY + "px");
      $(obj).show();
  };
  
})(jQuery);
