var eWalletCtr = {
	init: function (){
		//this.initTabLink();
		this.initDatePicker();
	},
	initTabLink: function (){
		$("#e-wallet-tab-link").on("click", function (){
			var activeClassName = "active";
			//remove active class 
			$(".left-side-tab-menu").removeClass(activeClassName);
			$(this).addClass(activeClassName);

			//remove #savie-online-purchase-history intend class
			$("##savie-online-purchase-history").removeClass("profile-active-page insurance-active-page promo-active-page");

			$(".right-side-content .content").addClass(activeClassName);
		});
	},
	initDatePicker: function (){
		$('#dt_log_from, #dt_log_to').mobiscroll().calendar({
			theme: 'mobiscroll',
			display: 'bottom',
			lang: language == "en" ? "en_fwd" : "zh_fwd"
	    });
	}
};

$("document").ready(function(){
	eWalletCtr.init();	
});




// insurance-active-page 
// promo-active-page
// profile-active-page
