/* Dropdown Menu - by Ryo Watanabe */
$(document).ready(function(){
  ddmenu($('#ubutton > a'),$('#ubutton ul'));
	ddmenu($('#ibutton > a'),$('#ibutton ul'));
  $(document).click(function(){
    $("*").removeClass("hover");
  });
  $("#ubutton,#ibutton").click(function(event){
    event.stopPropagation();
  });

  /* Toggle Search Box Text */
	$("#searchbox").focus(function(){
    if($(this).val() == "Search TUJ website" || $(this).val() == "サイト内を検索する"){
		  $(this).val("");
		}
	});
	$("#searchbox").blur(function(){
    if($(this).val() == ""){
		  $("#searchbox").val("Search TUJ website");
			$(".ja #searchbox").val("サイト内を検索する");
		}
	});
	$("#searchbutton").click(function(){
		if($("#searchbox").val() == "Search TUJ website"){
		  $("#searchbox").val("Basic Facts");
		}
		if($("#searchbox").val() == "サイト内を検索する"){
		  $("#searchbox").val("すぐわかるテンプル大学");
		}
	});
});

/* for dropdown menu */
function ddmenu(button,menu){
  $(button).click(function(){
    if($(menu).hasClass("hover")){
			$(menu).removeClass("hover");
			return false;
		}else{
			$("*").removeClass("hover");
      $(menu).addClass("hover");
			return false;
    }
  });
}