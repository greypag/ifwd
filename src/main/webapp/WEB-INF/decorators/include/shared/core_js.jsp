<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>

<%
if(request.getRequestURI().indexOf("/household-insurance")>0) {
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/icon-font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/titatoggle-dist-min.css">

<!--Mobiscroll css -->
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.animation.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.icons.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.android.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.android-holo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.ios-classic.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.ios.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.jqm.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.sense-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.wp.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.android.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.android-holo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.ios-classic.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.ios.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.jqm.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.sense-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.wp.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.image.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.android-holo-light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.wp-light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.mobiscroll-dark.css" rel="stylesheet" type="text/css" />
<%
}
%>

<script>

	// handle when console is null/undefined especially in IE
	if (typeof console == "undefined") {
		this.console = {
	    	log: function() {},
	    	info: function() {},
	    	error: function() {},
	    	warn: function() {}
	  	};
	}

	// global variables
	var UILANGUAGE = '<%=session.getAttribute("language")%>';
	
	function centerModals($element) {
	    var $modals;
	    if ($element.length) {
	      $modals = $element;
	    } else {
	      $modals = $('.modal-vcenter:visible');
	    }
	    $modals.each( function(i) {
	      var $clone = $(this).clone().css('display', 'block').appendTo('body');
	      var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	      top = top > 0 ? top : 0;
	      $clone.remove();
	      $(this).find('.modal-content').css("margin-top", top);
	    });
	  }


    function offerMenuActive(){
    	var site_uri = window.location.pathname;
    	var uri_array = site_uri.split("/");
    	if(uri_array[uri_array.length-1]=='offers'){
    		$( ".enjoy" ).addClass( "active" );
    	}
    }
	$(document).ready(function() {
		if (isMobile){
			$("#closeMobileMenu").on("touchmove touchstart",function(e) {
				if($(".mobile-menu-V2").hasClass("in")){
					$(".mob-menu-btn").click();
					//console.log(e);
				}
			});						
			$(window).on("orientationchange load",function(){
                if(window.orientation == 0 || window.orientation == 180) // Portrait
                {
                    // alert("Portrait");
                  $(".mobile-menu-V2.navbar-collapse").css("max-height",$(window).height()*0.7);
                }
                else // Landscape
                {
                    $(".mobile-menu-V2.navbar-collapse").css("max-height",$(window).height()*0.6);
                    //alert("Landscape"+$(".mobile-menu-V2.navbar-collapse").css("max-height"));
                }
			});
		}
        
        $('.copyright .options li').click(function() {
            var link = $(this).attr('data-raw-value');
            window.open( link , '_blank');
        });
		offerMenuActive();
		//console.log(window.location.pathname.substring(-5));
		//$("#loginform2").appendTo("body");
		//console.log(navigator.userAgent.match('CriOS'));
		
	});

	$('.navmenu').on('show.bs.offcanvas', function() {
		$('#test').show();
	});
	$('.navmenu').on('hidden.bs.offcanvas', function() {
		$('#test').hide(function() {
			$("#toplefthotline").trigger("click");
		});
	});
	$('#test').click(function() {
		$('.navmenu').offcanvas('hide');
	});
	<%
    if (session.getAttribute("authenticate") == null
            || !"true".equals(session.getAttribute("authenticate")
                    .toString())) {
    %>
		/*$('#myDropdownMob').cli
    ck(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$(".mob-login-form-wrapper").toggleClass('open');
			$(".bmg_mobile_login_mask").toggle();
		});*/
	<%
    }
    %>
    $( "li.link-btn.link-grp" ).click(function() {
    	  $(this).find("img").toggle();
    	});
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        // Avoid following the href location when clicking
        event.preventDefault();
        // Avoid having the menu to close when clicking
        event.stopPropagation();
        // Re-add .open to parent sub-menu item
        if($(this).parent().hasClass('open')){
            $(this).parent().removeClass('open');
        }else{
	        $(this).parent().addClass('open');
	        $(this).parent().siblings("li").removeClass('open');
	        $(this).parent().find("ul").parent().find("li.dropdown").addClass('open');
        }
    });
</script>

