var eWalletCtr = {
	init: function (){
		//this.initTabLink();
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
	}
};

eWalletCtr.init();



// insurance-active-page 
// promo-active-page
// profile-active-page
