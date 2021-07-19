var page = {
    init: function(){
           	$(document).ready(function() {
					$("a.fancybox").fancybox({
						'overlayColor' : '#111111',
						'speedOut' : 80,
						'overlayOpacity' : 0.8,
						'margin' : 100
					});
				});

        $("#nav").find(".menu_body").find("li").on({
            mouseenter: function(){
                $(this).find("ul").stop().slideDown(200);
            },
            mouseleave: function(){
                $(this).find("ul").slideUp(200);
            }
        });

        $("#fil_all").on("click",function(){
                page.filter($(this),"all");
                return false;
        });

        $("#tab_filter").find(".filter").on("click",function(){
                page.filter($(this),$(this).attr("id"));
                return false;
        });

				//add 140130
				$("#tab_filter").find("a").on("click",function(){
					var index = $("#tab_filter").find("a").index(this);
					$(".att_goods").fadeOut(300);
					$(".att"+index).delay(300).fadeIn(300);
					return false;
				});

    },
    filter: function(thisobj,target){
        var obj;
        var $exists = $("#goods_main").find(".goodsbox").filter(":visible");
        if (target == "all"){
            obj = $("#goods_main").find(".goodsbox");
        }else{
            obj = $("#goods_main").find("." + target);
        }
        $("#tab_filter").find("a").removeClass("current");
        thisobj.addClass("current");
        $exists.fadeOut(300,function(){
            //obj.delay(1000).fadeIn("slow");
            obj.fadeIn(600);
        });
    }
};

$(page.init);