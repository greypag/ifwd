
var fnaHelper = (function (){
	var name = "kj";
	var helper = {};

	helper.showForgotPwdPopup = function (){
		$("#loginpopup").modal();$("#link-forgotPassword").click();
	};
	helper.showForgotUserPopup = function (){
		$("#loginpopup").modal();$("#forgotUserName").click();
	};

	$("pv_fna .btnStart").click(function (){

	});

	$(".pv_fna .btnForgotUser").click(helper.showForgotUserPopup);

	$(".pv_fna .btnForgotPwd").click(helper.showForgotPwdPopup);
	
	return helper;
})();

$(document).ready(function (){
	var behaviourSlider = document.getElementById('slider');
	noUiSlider.create(behaviourSlider, {
			start: [ 0, 0 ],
			step: 10,
			behaviour: 'drag',
			connect: true,
			range: {
			'min':  20,
			'max':  80
		}
	});

	var grayBar$ = $("<div/>").addClass("grayBox");
	
	grayBar$.appendTo($(".pv_plan .pv_plan_wrap #slider .noUi-origin.noUi-background"));

	behaviourSlider.noUiSlider.on('slide', function (a,b,c){
		console.log(a,b,c);

		var width = 0;
		switch(parseInt(a[1])){
			case 20:
				width = 33.3333;
				break;
			case 30:
				width = 40;
				break;
			case 40:
				width = 50;
				break;
			case 50:
				width = 66.8;
				break;
			case 60:
			case 70:
			case 80:
				width = 100;
				break;
		}

		console.log("width: ", width);
		grayBar$.css("width", width + "%");

	});
});