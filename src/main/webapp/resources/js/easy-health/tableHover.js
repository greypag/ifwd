var stickerOffsetTop = 0;
$(document).ready(function() {
    $(".tbl-compare .t1, .tbl-compare .t2, .tbl-compare .t3, .tbl-compare .t4, .tbl-compare .eh-btn-tbl-detail")
        .mouseenter(function() {
            var className = $(this).attr("data-grp");
            $("." + className).addClass("highlight");
        })
        .mouseleave(function() {
            var className = $(this).attr("data-grp");
            $(".tbl-compare ." + className).removeClass("highlight");
        });

    $('.tooltip').not(this).hide();
    /*
    	$(".tbl-compare .icon").on('show.bs.tooltip', function() {
	    // Only one tooltip should ever be open at a time
		    
		});
		*/


});
