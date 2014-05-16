// Copyright 2010 htmldrive.net Inc.
/**
 * @projectHomepage http://www.htmldrive.net/go/to/simple-images-scroller
 * @projectDescription Simple images scroller with jquery plugin
 * @author htmldrive.net
 * More script and css style : htmldrive.net
 * @version 1.0
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */
(function(a){
    a.fn.scroller_roll=function(p){
        var p=p||{};

        var g=p&&p.time_interval?p.time_interval:"100";
        var h=p&&p.title_show?p.title_show:"enable";
        var i=p&&p.window_background_color?p.window_background_color:"white";
        var j=p&&p.window_padding?p.window_padding:"5";
        var k=p&&p.border_size?p.border_size:"1";
        var l=p&&p.border_color?p.border_color:"black";
        var m=p&&p.images_width?p.images_width:"45";
        var n=p&&p.images_height?p.images_height:"70";
        var o=p&&p.title_size?p.title_size:"12";
        var q=p&&p.title_color?p.title_color:"blue";
        var r=p&&p.show_count?p.show_count:"5";
        var i_m = p&&p.images_margin?p.images_margin:"3";
        j += "px";
        k += "px";
        m += "px";
        n += "px";
        o += "px";
        var s;
        var t=0;
        var u;
        var v;
        var w;
        var x;
        var y=a(this);
        var z=y.children("ul").children("li").length;
        var A=Math.ceil(z/r);
        if(y.find("ul").length==0||a("li").length==0){
            dom.append("Require content");
            return null
            }
            y.children("ul").children("li").children("a").children("img").css("width",m).css("height",n);
        if(h=='enable'){
            y.children("ul").children("li").children("a").each(function(){
                $(this).append('<br/>'+$(this).attr("title"))
                })
            }
            s_s_ul(y,j,k,l,i);
        m=parseInt(m);
        y.children("ul").children("li").css("width",m+"px");
        y.children("ul").children("li").css("margin-left",i_m+"px");
        y.children("ul").children("li").children("a").css("color",q);
        y.children("ul").children("li").children("a").css("font-size",o);
        y.hover(function(){
            stop()
            },function(){
            play()
            });
        begin();
        play();
        function begin(){
            x=y.children("ul").width();
            y.children("ul").children("li").hide();
            y.children("ul").children("li").slice(0,r).show();
            u=y.children("ul").outerWidth();
            v=y.children("ul").outerHeight();
            y.children("ul").width(x);
            y.width(u);
            y.height(v);
            y.children("ul").children("li").show();
            y.css("position","relative");
            y.children("ul").css("position","absolute");
            y.children("ul").clone().prependTo(y);
            j=parseInt(j);
            y.children("ul").css("left","0px");
            y.find("ul:last").css("left",x);
            w=x-i_m;
            }
            function play(){
            if(parseInt(y.find("ul").eq(t).css("left"))<=-(x)){
                var a=x;
                y.find("ul").eq(t).css("left",a);
                if(t==0){
                    t=1
                    }else{
                    t=0
                    }
                }
            y.find("ul").each(function(){
            $(this).css("left",(parseInt($(this).css("left"))-1)+"px")
            });
        s=setTimeout(play,g)
        }
        function stop(){
        clearTimeout(s)
        }
        function s_s_ul(a,b,c,d,e){
        b=parseInt(b);
        c=parseInt(c);
        var f="border: "+d+" solid "+" "+c+"px; padding:"+b+"px; background-color:"+e;
        a.attr("style",f)
        }
    }
})(jQuery);