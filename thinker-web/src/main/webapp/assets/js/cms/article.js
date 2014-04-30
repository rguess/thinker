/**
 * cms文章处理相关js
 */

var Article = {
	
	init : function(){
		$("#add_article_type").html($("#word_comment").clone().show());
		Article.initUeditor();
		Article.onTypeTabClick();
	},
	
	initUeditor:function(){
		UE.getEditor('ueditor');
	},
	
	onTypeTabClick : function(){
		$("#word_type,#ueditor_type").click(function(){
			if($(this).parent().hasClass("active")){
				return;
			}
			var $obj = $(this);
			var id = $obj.attr("id");
			if(id == "word_type"){
				$("#add_article_type").html($("#word_comment").clone().show());
			}else if(id == "ueditor_type"){
				$("#add_article_type").html($("#ueditor_comment").clone().show());
			}
		});
	}
}