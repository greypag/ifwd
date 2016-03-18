var contextPath = context; //"/fwdhk"

var fnaSavieGame = {
	api_update : contextPath + "/ajax/savings-insurance/update",
	page_recommendation: contextPath + "/" + language + "/FNA/product-recommendation",
	debug : false,
	postData : {
		"gender" : null,
		"dob": null,
		"marital_status": null,
		"dependents": null,
		"education": null,
		"employment_status": null,
		"nature_of_business": null,
		"occupation": null,
		"occupation_others": null,
		"q1": null,
		"q1_others": null,
		"q2": null,
		"q2_others": null,
		"q3": null,
		"q4": null,
		"q4_a": null,
		"q4_a_others": null,
		"q4_b": null,
		"q4_b_amount": null,
		"q4_b_others": null,
		"q4_c": null,
		"q4_d_1": null,
		"q4_d_2": null,
		"q4_e": null,
		"q4_f": null,
		"q4_g": null,
		"q4_g_others": null
	},
	stepData:{
		"step1":["gender"],
		"step2":["dob","marital_status","dependents","education","employment_status","nature_of_business","occupation","occupation_others"],
		"step3":["q1","q1_others","q2","q2_others"],
		"step4":["q3","q4"],
		"step5":["q4_a","q4_a_others","q4_b","q4_b_amount","q4_b_others"],
		"step6":["q4_c","q4_d_1","q4_d_2"],
		"step7":["q4_e","q4_f"],
		"step8":["q4_g"],
	},
	ttlStep:8,
	currentStep : 0,
	age:0,
	init : function(){
		var that = this;
		
		this.initGenericEvts();
		this.initSpecificEvts();

		//Animate
		


		/**/


		$(".fna-btn-step1-start").click(function(){
			var validate = that.validator(that.currentStep);
			if(!$(this).hasClass("disabled") || that.debug){
				that.unRegisterStep();
				$("html, body").stop().animate({scrollTop:0});
				$(".game-fna .step1").fadeOut(500,function(){
					that.currentStep++;
					that.registerStep();
					$(".step2").fadeIn();
					Matrix.start(that.postData.gender,that.age,null,-1);

					$(".dp-gender").text(that.postData.gender == 0 ? "Mr. " : "Ms. ");
					$(".dp-name").text($(".frm-fna-name").val());
				});

				window.onbeforeunload = function(e) {
				    if (!e)
						e = window.event;
					e.cancelBubble = true;
					e.returnValue = 'Some inputs or changes may not have been saved yet';

					if (e.stopPropagation) {
						e.stopPropagation();
						e.preventDefault();
					}

				}

			}else{
				//Validate

			}
		});

		$(".fna-btn-step2-next").click(function(){
			var validate = that.validator(that.currentStep);
			if(!$(this).hasClass("disabled") || that.debug){
				that.unRegisterStep();
				$(".game-fna .step2").fadeOut(500,function(){
					$("html, body").stop().animate({scrollTop:0});
					that.currentStep++;
					that.registerStep();
					$(".step-flow-wrapper").fadeIn();
					
				});
			}
		});

		$(".fna-btn-step-next").click(function(){
			//Validate Current Step
			if(that.currentStep < 8 || that.currentStep > 3){
				var validate = that.validator(that.currentStep);
				if(!$(this).hasClass("disabled")){
					$("html, body").stop().animate({scrollTop:0});
					if(validate){
						that.backNextBtnHdlr(1);
						that.checkData();
					}
				}
			}
		});

		$(".fna-btn-step-back").click(function(){

			//Validate Current Step
			if(that.currentStep > 3){

				that.backNextBtnHdlr(-1);
				that.checkData();
			}else if(that.currentStep == 3){
				
				that.unRegisterStep();
				$(".step-flow-wrapper").fadeOut(500,function(){
					$("html, body").stop().animate({scrollTop:0});
					that.currentStep--;
					that.registerStep();
					$(".game-fna .step2").fadeIn();
					
				});
			}
			$("html, body").stop().animate({scrollTop:0});
		});

		$(".fna-btn-step-finish").click(function(){

			var validate = that.validator(that.currentStep);
			if(!$(this).hasClass("disabled") && validate){
				window.onbeforeunload = null;
				that.submitForm();	
				$(".game-fna .step-flow-wrapper").fadeOut(500,function(){
					$(".game-fna .last-loading").fadeIn();
				});				
			}

			
		});

		/*Mobile Buttons*/

		$(".fna-btn-step-back-inside").click(function(){

			$("html, body").stop().animate({scrollTop:0});
			var p = $(this).parents(".mob-view");
			p.addClass("mob-hide");

			p.prev().removeClass("mob-hide");			
		});
		$(".fna-btn-step-next-inside").click(function(){

			$(".fna-error-msg").text("");
			var validate = that.validator(that.currentStep,true);

			if(!$(this).hasClass("disabled") && validate){
				var p = $(this).parents(".mob-view");
				p.addClass("mob-hide");

				p.next().removeClass("mob-hide");
				$("html, body").stop().animate({scrollTop:0});
			}
		});

		var sel = $(".frm-fna-employment-status");

		$(Status["data"]).each(function(key,val){
			var option = $("<option/>");
			option.val(val.id).text(val.name).data("noNextFld",(val.id == "ES4" || val.id == "ES5" || val.id == "ES6" || val.id == "ES7"))
			sel.append(option);
		});
		

		//Init Watch Step1 
		that.currentStep++;
		that.observeData();
	},

	backNextBtnHdlr:function(needle){

		var that = this;
		if(that.currentStep >= 3 && that.currentStep <= 8 ){

			that.unRegisterStep();
			that.currentStep+=needle;

			$(".desktop-btn-gp .fna-btn-step-back, .desktop-btn-gp .fna-btn-step-next").fadeOut();
			if(that.currentStep >= 3){
				$(".desktop-btn-gp .fna-btn-step-back").delay(600).fadeIn();
			}
			if(that.currentStep < 8){
				$(".desktop-btn-gp .fna-btn-step-next").delay(600).fadeIn();	
			}

			
			that.registerStep();

			$(".step-flow-slider").animate({"marginLeft":(that.currentStep - 3) * -970});

			$(".step-flow-slider").find(">div").removeClass("activeState");
			$(".step-flow-slider").find(".step"+that.currentStep).addClass("activeState");
			console.log($(".step-flow-slider").find(".step"+that.currentStep));

			if(that.currentStep == 8){
				$(".desktop-btn-gp .fna-btn-step-finish").fadeIn();
			}else{
				$(".desktop-btn-gp .fna-btn-step-finish").hide();
			}
		}
		
		
	},

	initGenericEvts:function(){
		var that = this;
		$(".fna-radio-gp, .fna-radio-gp-indv, .fna-radio-gp-cb").each(function(){

			$(this).find(".fna-radio-btn").not(".fna-cb-others").click(function(){
				//Visual
				var p = $(this).parents(".fna-radio-gp").length > 0 ?  $(this).parents(".fna-radio-gp") :
						$(this).parents(".fna-radio-gp-indv").length > 0 ? $(this).parents(".fna-radio-gp-indv") :
						$(this).parents(".fna-radio-gp-cb").length > 0 ? $(this).parents(".fna-radio-gp-cb") : null;
				p.find(".fna-radio-btn").removeClass("selected");
				$(this).addClass("selected");

				//Set Value
				var formField = p.data("frmFld");
				var val = $(this).data("val");
				that.postData[formField] = parseInt(val,10);

				//Mirror
				var mirrorField = p.data("mirrorFld");

				p.parents(".fna-row").find(".fna-error-msg").text("");


			});
		});

		$(".fna-checkbox-gp").each(function(){
			$(this).find(".fna-checkbox-btn").not(".fna-cb-others").click(function(){

				//Visual
				$(this).hasClass("selected") ? $(this).removeClass("selected") : $(this).addClass("selected");

				//Set Value
				var p = $(this).parent();
				var formField = p.data("frmFld");

				var vals = [];
				p.find(".selected").each(function(){
					vals.push($(this).data("val"));
				});

				that.postData[formField] = vals.length > 0 ? vals.join(",") : null;

				//Mirror
				var mirrorField = p.data("mirrorFld");

				p.parents(".fna-row").find(".fna-error-msg").text("");


			});
		});

		$(".game-fna").find("input[type=text]").keyup(function(e){
			var formField = $(this).data("frmFld");
			var dataType = $(this).data("type");

			//check datatype (string,int)
			if(dataType == "int"){
				
				var val = parseInt(this.value.replace(/\D/g, ''),10);

				if(isNaN(val)){
					val = "";
				}

				var allowZero = Boolean($(this).data("allowzero"));

				if(!allowZero && val == 0){
					val = "";
				}

				val = val.toString();

				this.value = val.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			that.postData[formField] = ($(this).val() == "") ? null : (dataType == "int")? parseInt(val,10):  $(this).val();

		});

		/*$(".game-fna").find("input[type=text]").blur(function(){
			$(this).
		});
*/
	},

	initSpecificEvts:function(){

		var that = this;
		//Dob
		/* Copied From fwd.js */
		var dob_end_date = new Date();
		dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
		
		// 86 year ago date
		var dob_start_date = new Date();
		dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
		dob_start_date.setDate(dob_start_date.getDate()+1);

		$('.frm-fna-dob').datepicker({
			startView: "decade",
			autoclose: true,
			format: "dd-mm-yyyy",
			startDate: dob_start_date,
			endDate: dob_end_date
			/*language: getBundleLanguage*/
		}).on('changeDate', function (ev) {
			var elm = $(ev.target);
			var formField = elm.data("frmFld");
			var val = elm.find("input").val();
			that.postData[formField] = val;

			//var dt = val.split("-");
			elm.find(".txt_dob").html(val);

			var today = new Date();
			that.age = today.getFullYear() - ev.date.getFullYear();
		    var m = today.getMonth() - ev.date.getMonth();
    		if (m < 0 || (m === 0 && today.getDate() < ev.date.getDate())) that.age--;
    		
    		Matrix.start(that.postData.gender,that.age,that.postData.marital_status,that.postData.dependents);
			
			$(".step2 .frm-fna-dob").parents(".fna-row").find(".fna-error-msg").text("");
			//Mirror
		});
		
		if($(".step2 .txt_dob").text() != "DD-MM-YYYY"){
			var dt = $(".step2 .txt_dob").text().split("-");
			$('.frm-fna-dob').datepicker("setDate", new Date(dt[2],dt[1]-1,dt[0]) );
		}
		
		

		/*$('#fna_dob').datepicker('setDate', dob_end_date);*/

		//Auto Select Checkbox when click on input text
		$(".fna-checkbox-btn input[type=text]").click(function(e){
			e.stopPropagation();
			if(!$(this).parents(".fna-checkbox-btn").hasClass("selected")){
				$(this).parents(".fna-checkbox-btn").trigger("click");
			}
			
		});

		$(".frm-fna-q4a .fna-radio-btn, frm-fna-q4a-mobile .fna-radio-btn").click(function(){
			$(this).parents(".q4a").find(".frm-fna-q4a-others, .frm-fna-q4a-others-mobile").val("");
			that.postData.q4_a_others = null;
		});

		$(".frm-fna-q4a-others, .frm-fna-q4a-others-mobile").keyup(function(){
			if($(this).val() != ""){
				$(this).parents(".q4a").find(".frm-fna-q4a .fna-radio-btn").removeClass("selected");
				var formField = $(this).parents(".q4a").find(".frm-fna-q4a").data("frmFld");
				that.postData[formField] = null;
			}	
		});


		$(".fna-cb-others").click(function(){

			var that = this;
			$(that).addClass("selected");
			$("#fnaPopupContact").modal({
			   
			   keyboard: false
			});

			$("#fnaPopupContact").on('hide.bs.modal',function(){
				$(that).removeClass("selected");
				$("#fnaPopupContact").off('hide.bs.modal');
			})

			
		});

		$(".frm-fna-marital-status .fna-radio-btn, .frm-fna-dependents .fna-radio-btn").click(function(){
			Matrix.start(that.postData.gender,that.age,that.postData.marital_status,that.postData.dependents);
		});



		$(".frm-fna-q4f .fna-radio-btn").click(function(){
			var chart = $(this).parents(".answer-wrapper").find(".chart-wrapper");

			if(!chart.find(".a" + $(this).data("val")).is(":visible")){
				if(chart.find("img:visible").length > 0){
					chart.find("img:visible").stop().fadeOut();
				}

				chart.find(".a" + $(this).data("val")).show("puff",250);
			}
			
		});

		$(".frm-fna-education").change(function(){
			that.postData.education = null;

			if($(this).val() != ""){
				that.postData.education = parseInt($(this).val(),10);
				$(this).parents(".fna-row").find(".fna-error-msg").text("");
			}
		});

		$(".frm-fna-employment-status").change(function(){
			that.postData.employment_status = null;
			that.postData.nature_of_business = null;
			that.postData.occupation = null;
			that.postData.occupation_others = null;
			
			if($(this).val() == ""){
				$(".frm-fna-nob, .frm-fna-occupation, .frm-fna-occupation-others").parents(".fna-row").addClass("hide");
			}else{
				var optionSelected = $("option:selected", this);
				that.postData.employment_status = $(this).val();
				$(this).parents(".fna-row").find(".fna-error-msg").text("");
				if(optionSelected.data("noNextFld")){
					$(".frm-fna-nob, .frm-fna-occupation, .frm-fna-occupation-others").parents(".fna-row").addClass("hide");
					
					that.postData.nature_of_business = null;
					that.postData.occupation = null;
					that.postData.occupation_others = null;
					
				}else{
					
					var sel = $(".frm-fna-nob");
					sel.empty();
					sel.append($("<option/>").val("").text(getBundle(getBundleLanguage, "option.fna.select")));
					$(Occupation["data"]).each(function(key,val){
						var option = $("<option/>");
						option.val(val.id).text(val.nob).data("key",key);
						sel.append(option);
					});
					if (!isMobile) $(".frm-fna-nob").select2();
					if (!isMobile) $(".frm-fna-occupation").select2();
					$(".frm-fna-nob").parents(".fna-row").removeClass("hide");
				}
			}
		});

		$(".frm-fna-nob").change(function(){
			var optionSelected = $("option:selected", this);
			that.postData.nature_of_business = null;
			that.postData.occupation = null;
			that.postData.occupation_others = null;
			
			
			$(".frm-fna-occupation, .frm-fna-occupation-others").parents(".fna-row").addClass("hide");

			if($(this).val() != ""){
				that.postData.nature_of_business = $(this).val();
				$(this).parents(".fna-row").find(".fna-error-msg").text("");
				var key = optionSelected.data("key");
				var sel = $(".frm-fna-occupation");
				sel.empty();
				sel.append($("<option/>").val("").text(getBundle(getBundleLanguage, "option.fna.select")));
				$(Occupation["data"][key]["position"]).each(function(key,val){
					var option = $("<option/>");
					option.val(val.id).text(val.name).data("key",key);
					sel.append(option);
				});
				$(".frm-fna-occupation").parents(".fna-row").removeClass("hide");
			}		
			if (!isMobile) $(".frm-fna-occupation").select2();
		});

		$(".frm-fna-occupation").change(function(){
			if($(this).val() == ""){
				$(".frm-fna-occupation-others").val("");
				that.postData.occupation_others = null;
				that.postData.occupation = null;
				$(".frm-fna-occupation-others").parents(".fna-row").addClass("hide");
			}else{
				if($(".frm-fna-nob").val() == "NoB23" && $(this).val() == "NoBD16" ){
					$(".frm-fna-occupation-others").parents(".fna-row").removeClass("hide");
				}else{
					$(".frm-fna-occupation-others").val("");
					that.postData.occupation_others = null;
					$(".frm-fna-occupation-others").parents(".fna-row").addClass("hide");
				}
				that.postData.occupation = $(this).val();
				$(this).parents(".fna-row").find(".fna-error-msg").text("");
			}
			
			
		});

		
		if (!isMobile) $(".frm-fna-nob").select2();
		if (!isMobile) $(".frm-fna-occupation").select2();
	},

	registerStep:function(){
		this.observeData();
		this.initStepAnimation();
	},

	unRegisterStep:function(){
		this.unObserveData();
		this.destroyStepAnimation();
	},

	observeData:function(){

		var that = this;
		watch(that.postData,that.stepData["step" + that.currentStep],function(ev){
			that.checkData();
		})
	},

	unObserveData:function(){
		var that = this;
		unwatch(that.postData,that.stepData["step" + that.currentStep]);
	},

	checkData:function(){
		var that = this;
		switch(that.currentStep){
			case 1:
				if(	that.postData.gender == null
				){
					$(".fna-btn-step1-start").addClass("disabled");
				}else{
					$(".fna-btn-step1-start").removeClass("disabled");
				}
				break;
			case 2:
					//check trouble occupation
					var occupationFailed = false;
					if(that.postData.employment_status == "ES1" ||
						that.postData.employment_status == "ES2" ||
						that.postData.employment_status == "ES3"
					){
						if(that.postData.nature_of_business == null){
							occupationFailed = true;
						}else{

							if(that.postData.occupation == null){
								occupationFailed = true;
							}else{
								if(that.postData.nature_of_business == "NoB23" &&
									that.postData.occupation == "NoBD16" 
								){
									if(that.postData.occupation_others == null){
										occupationFailed = true;
									}
								}
							}
						}
					}


				if(	that.postData.dob == null ||
					that.postData.marital_status == null ||
					that.postData.dependents == null ||
					that.postData.education == null ||
					that.postData.employment_status == null ||
					occupationFailed
				){
					$(".fna-btn-step2-next").addClass("disabled");
				}else{
					$(".fna-btn-step2-next").removeClass("disabled");					
				}
				break;
			case 3:
				if(	that.postData.q1 == null ||
					that.postData.q2 == null
				){
					$(".desktop-btn-gp .fna-btn-step-next").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-next").removeClass("disabled");
				}
				if(that.postData.q1 != null && !$(".q1").data("animated")){
					$(".step3 .step-indicator1").fadeIn();
					$(".step3 .img2-wrapper").animate({"left":640},500);
					$(".q1").data("animated",true);
				}
				if(that.postData.q2 != null && $(".q1").data("animated") && !$(".q2").data("animated")){
					$(".step3 .step-indicator2").fadeIn();
					$(".q2").data("animated",true);
				}
				break;
			case 4:
				if(	that.postData.q3 == null || 
					that.postData.q4 == null
				){
					$(".desktop-btn-gp .fna-btn-step-next").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-next").removeClass("disabled");
				}

				if(that.postData.q3 != null && !$(".q3").data("animated")){
					$(".step4 .step-indicator2").fadeIn();
					$(".q3").data("animated",true);
				}
				break;
			case 5:
				if(	(that.postData.q4_a == null && that.postData.q4_a_others == null) ||
					that.postData.q4_b == null ||
					that.postData.q4_b_amount == null
				){
					$(".desktop-btn-gp .fna-btn-step-next").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-next").removeClass("disabled");
				}

				if((that.postData.q4_a != null || that.postData.q4_a_others != null) && !$(".q4a").data("animated")){
					$(".step5 .step-indicator2").fadeIn();
					$(".q4a").data("animated",true);
				}

				if( that.postData.q4_b != null && 
					that.postData.q4_b_amount != null && 
					$(".q4a").data("animated") &&
					!$(".q4b").data("animated")
				){
					$(".step5 .step-indicator3").fadeIn();
					$(".q4b").data("animated",true);
				}
				break;
			case 6:
				if(that.postData.q4_c == null ||
					that.postData.q4_d_1 == null ||
					that.postData.q4_d_2 == null
				){
					$(".desktop-btn-gp .fna-btn-step-next").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-next").removeClass("disabled");
				}

				if(that.postData.q4_c != null && !$(".q4c").data("animated")){
					$(".step6 .step-indicator2").fadeIn();
					$(".q4c").data("animated",true);
				}

				if(that.postData.q4_d_1 != null &&
					that.postData.q4_d_2 != null &&
					$(".q4c").data("animated") &&
					!$(".q4d").data("animated")
				){
					$(".step6 .step-indicator3").fadeIn();
					$(".q4d").data("animated",true);
				}
				break;
			case 7:
				if(that.postData.q4_e == null ||
					that.postData.q4_f == null
				){
					$(".desktop-btn-gp .fna-btn-step-next").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-next").removeClass("disabled");
				}

				if(that.postData.q4_e != null &&
					that.postData.q4_f != null &&
					!$(".q4e").data("animated")
				){
					$(".step7 .step-indicator2").fadeIn();
					$(".q4e").data("animated",true);
				}

				break;
			case 8:
				if(that.postData.q4_g == null){
					$(".desktop-btn-gp .fna-btn-step-finish").addClass("disabled");
				}else{
					$(".desktop-btn-gp .fna-btn-step-finish").removeClass("disabled");
				}
				break;
		}
		that.checkDataMobile();
	},

	checkDataMobile:function(){
		var that = this;
		switch(that.currentStep){
			case 2:
				var occupationFailed = false;
				if(that.postData.employment_status == "ES1" ||
					that.postData.employment_status == "ES2" ||
					that.postData.employment_status == "ES3"
				){
					if(that.postData.nature_of_business == null){
						occupationFailed = true;
					}else{

						if(that.postData.occupation == null){
							occupationFailed = true;
						}else{
							if(that.postData.nature_of_business == "NoB23" &&
								that.postData.occupation == "NoBD16" 
							){
								if(that.postData.occupation_others == null){
									occupationFailed = true;
								}
							}
						}
					}
				}
				if(	that.postData.dob == null ||
					that.postData.marital_status == null ||
					that.postData.dependents == null ||
					that.postData.education == null ||
					that.postData.employment_status == null ||
					occupationFailed
				){
					$(".step2 .fna-btn-step-next-inside").addClass("disabled");
				}else{
					$(".step2 .fna-btn-step-next-inside").removeClass("disabled");					
				}
				break;
			case 3:
				if(	that.postData.q1 == null ){
					$(".q1 .fna-btn-step-next-inside").addClass("disabled");
				}else{
					$(".q1 .fna-btn-step-next-inside").removeClass("disabled");
				}

				if(	that.postData.q2 == null ){
					$(".q2 .fna-btn-step-next").addClass("disabled");
				}else{
					$(".q2 .fna-btn-step-next").removeClass("disabled");
				}

				break;
			case 4:
				if(	that.postData.q3 == null || 
					that.postData.q4 == null
				){
					$(".step4 .fna-btn-step-next").addClass("disabled");
				}else{
					$(".step4 .fna-btn-step-next").removeClass("disabled");
				}
				break;
			case 5:
				if(that.postData.q4_a == null && that.postData.q4_a_others == null){
					$(".q4a .fna-btn-step-next-inside").addClass("disabled");
				}else{
					$(".q4a .fna-btn-step-next-inside").removeClass("disabled");
				}

				if(that.postData.q4_b == null ||
					that.postData.q4_b_amount == null){
					$(".q4b .fna-btn-step-next").addClass("disabled");
				}else{
					$(".q4b .fna-btn-step-next").removeClass("disabled");
				}

				break;
			case 6:
				if(that.postData.q4_c == null){
					$(".q4c .fna-btn-step-next-inside").addClass("disabled");
				}else{
					$(".q4c .fna-btn-step-next-inside").removeClass("disabled");
				}

				if(that.postData.q4_d_1 == null ||
					that.postData.q4_d_2 == null){
					$(".q4d .fna-btn-step-next").addClass("disabled");
				}else{
					$(".q4d .fna-btn-step-next").removeClass("disabled");
				}
				break;
			case 7:
				if(that.postData.q4_e == null){
					$(".q4e .fna-btn-step-next-inside").addClass("disabled");
				}else{
					$(".q4e .fna-btn-step-next-inside").removeClass("disabled");
				}

				if(that.postData.q4_f == null){
					$(".q4f .fna-btn-step-next").addClass("disabled");
				}else{
					$(".q4f .fna-btn-step-next").removeClass("disabled");
				}
				break;
			case 8:
				if(that.postData.q4_g == null){
					$(".step8 .fna-btn-step-finish").addClass("disabled");
				}else{
					$(".step8 .fna-btn-step-finish").removeClass("disabled");
				}

				break;
		}

	},

	initStepAnimation:function(){
		switch(this.currentStep){
			case 3:
				Woman.startAnimation();
				break;
			case 4:
				Plane.startAnimation();
				break;
			case 5:
				Car.startAnimation();
				break;
			case 6:
				Girl.startAnimation();
				break;
			case 8:
				Family.startAnimation();
				break;
		}
	},

	destroyStepAnimation:function(){
		switch(this.currentStep){
			case 3:
				Woman.stopAnimation();
				break;
			case 4:
				Plane.stopAnimation();
				break;
			case 5:
				Car.stopAnimation();
				break;
			case 6:
				Girl.stopAnimation();
				break;
			case 8:
				Family.stopAnimation();
				break;
		}
	},

	selectStatus:function(){

	},

	validator:function(step,mobileSplit){
		var that = this;
		var result = true;
		$(".fna-error-msg").text("");
		switch(step){
			case 1:
				if(that.postData.gender == null){
					$(".step1 .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				break;
			case 2:
				if(that.postData.dob == null){
					$(".step2 .frm-fna-dob").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(that.postData.marital_status == null){
					$(".step2 .frm-fna-marital-status").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(that.postData.dependents == null){
					$(".step2 .frm-fna-dependents").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(that.postData.education == null){
					$(".step2 .frm-fna-education").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(that.postData.employment_status == null){
					$(".step2 .frm-fna-employment-status").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}else{
					//Full time, part time, self employ
					if(that.postData.employment_status == "ES1" ||
						that.postData.employment_status == "ES2" ||
						that.postData.employment_status == "ES3"
					){
						if(that.postData.nature_of_business == null){
							$(".step2 .frm-fna-nob").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
							result = false;
						}else{

							if(that.postData.occupation == null){
								$(".step2 .frm-fna-occupation").parents(".fna-row").find(".fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
								result = false;
							}else{
								if(that.postData.nature_of_business == "NoB23" &&
									that.postData.occupation == "NoBD16" 
								){
									if(that.postData.occupation_others == null){
										$(".step2 .frm-fna-occupation-others").parents(".fna-row").find(".fna-error-msg").text("(Please input)");
										result = false;
									}
								}
							}
						

						}
					}
				}
				

				break;
			case 3:
				if(that.postData.q1 == null){
					$(".q1 .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(mobileSplit) break;
				if(that.postData.q2 == null){
					$(".q2 .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				break;
			case 4:
				if(that.postData.q3 == null){
					$(".q3 .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(mobileSplit) break;
				if(that.postData.q4 == null){
					$(".q4 .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				break;
			case 5:
				if(that.postData.q4_a == null && that.postData.q4_a_others == null){
					$(".q4a .fna-error-msg").text("(Please select or enter specific amount)");
					result = false;
				}
				if(mobileSplit) break;
				if(that.postData.q4_b == null){
					$(".q4b .err_q4b1.fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(that.postData.q4_b_amount == null){
					$(".q4b .err_q4b2.fna-error-msg").text("(Please enter)");
					result = false;
				}
				break;
			case 6:
				if(that.postData.q4_c == null){
					$(".q4c .fna-error-msg").text("(Please enter)");
					result = false;
				}
				if(mobileSplit) break;
				if(that.postData.q4_d_1 == null){
					$(".q4d .err_q4d1.fna-error-msg").text("(Please enter)");	
					result = false;
				}
				if(that.postData.q4_d_2 == null){
					$(".q4d .err_q4d2.fna-error-msg").text("(Please enter)");	
					result = false;
				}
				break;
			case 7:
				if(that.postData.q4_e == null){
					$(".q4e .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				if(mobileSplit) break;
				if(that.postData.q4_f == null){
					$(".q4f .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
				break;
			case 8:
				if(that.postData.q4_g == null){
					$(".q4g .fna-error-msg").text(getBundle(getBundleLanguage, "error.select.empty"));
					result = false;
				}
		}

		return result;
	},

	submitForm:function(){
		var that = this;
		AjaxManager.fire(that.api_update,this.postData,function(res){
			console.log(res);
			if(res.status == 0){
				//Success
				setTimeout(function(){
					window.location = that.page_recommendation;
				},3000);
				
			}else if(res.status == 1){
				//Something Error
			}else if(res.status == 2){
				//Session Timeout
			}
		},null,"GET");
	}
};


$(document).ready(function(){

	if($(".game-fna").length > 0){
		fnaSavieGame.init();
	}


});

function moneyFormat(evt){
	//evt.preventDefault();
	console.log(evt.target.value);
}


"use strict";(function(t){"object"===typeof exports?module.exports=t():"function"===typeof define&&define.amd?define(t):(window.WatchJS=t(),window.watch=window.WatchJS.watch,window.unwatch=window.WatchJS.unwatch,window.callWatchers=window.WatchJS.callWatchers)})(function(){function t(){u=null;for(var a=0;a<v.length;a++)v[a]();v.length=0}var k={noMore:!1,useDirtyCheck:!1},p=[],l=[],w=[],C=!1;try{C=Object.defineProperty&&Object.defineProperty({},"x",{})}catch(Y){}var x=function(a){var b={};return a&&"[object Function]"==b.toString.call(a)},g=function(a){return"[object Array]"===Object.prototype.toString.call(a)},y=function(a){return"[object Object]"==={}.toString.apply(a)},H=function(a,b){var c=[],d=[];if("string"!=typeof a&&"string"!=typeof b){if(g(a))for(var e=0;e<a.length;e++)void 0===b[e]&&c.push(e);else for(e in a)a.hasOwnProperty(e)&&void 0===b[e]&&c.push(e);if(g(b))for(var f=0;f<b.length;f++)void 0===a[f]&&d.push(f);else for(f in b)b.hasOwnProperty(f)&&void 0===a[f]&&d.push(f)}return{added:c,removed:d}},q=function(a){if(null==a||"object"!=typeof a)return a;var b=a.constructor(),c;for(c in a)b[c]=a[c];return b},R=function(a,b,c,d){try{Object.observe(a,function(a){a.forEach(function(a){a.name===b&&d(a.object[a.name])})})}catch(e){try{Object.defineProperty(a,b,{get:c,set:function(a){d.call(this,a,!0)},enumerable:!0,configurable:!0})}catch(f){try{Object.prototype.__defineGetter__.call(a,b,c),Object.prototype.__defineSetter__.call(a,b,function(a){d.call(this,a,!0)})}catch(h){I(a,b,d)}}}},J=function(a,b,c){try{Object.defineProperty(a,b,{enumerable:!1,configurable:!0,writable:!1,value:c})}catch(d){a[b]=c}},I=function(a,b,c){l[l.length]={prop:b,object:a,orig:q(a[b]),callback:c}},n=function(a,b,c,d){if("string"!=typeof a&&(a instanceof Object||g(a))){if(g(a)){if(K(a,"__watchall__",b,c),void 0===c||0<c)for(var e=0;e<a.length;e++)n(a[e],b,c,d)}else{var f=[];for(e in a)"$val"==e||!C&&"watchers"===e||Object.prototype.hasOwnProperty.call(a,e)&&f.push(e);B(a,f,b,c,d)}d&&L(a,"$$watchlengthsubjectroot",b,c)}},B=function(a,b,c,d,e){if("string"!=typeof a&&(a instanceof Object||g(a)))for(var f=0;f<b.length;f++)D(a,b[f],c,d,e)},D=function(a,b,c,d,e){"string"!=typeof a&&(a instanceof Object||g(a))&&!x(a[b])&&(null!=a[b]&&(void 0===d||0<d)&&n(a[b],c,void 0!==d?d-1:d),K(a,b,c,d),e&&(void 0===d||0<d)&&L(a,b,c,d))},S=function(a,b){if(!(a instanceof String)&&(a instanceof Object||g(a)))if(g(a)){for(var c=["__watchall__"],d=0;d<a.length;d++)c.push(d);E(a,c,b)}else{var e=function(a){var c=[],d;for(d in a)a.hasOwnProperty(d)&&(a[d]instanceof Object?e(a[d]):c.push(d));E(a,c,b)};e(a)}},E=function(a,b,c){for(var d in b)b.hasOwnProperty(d)&&M(a,b[d],c)},v=[],u=null,N=function(){u||(u=setTimeout(t));return u},O=function(a){null==u&&N();v[v.length]=a},F=function(a,b,c,d){var e=null,f=-1,h=g(a);n(a,function(d,c,r,m){var g=N();f!==g&&(f=g,e={type:"update"},e.value=a,e.splices=null,O(function(){b.call(this,e);e=null}));if(h&&a===this&&null!==e){if("pop"===c||"shift"===c)r=[],m=[m];else if("push"===c||"unshift"===c)r=[r],m=[];else if("splice"!==c)return;e.splices||(e.splices=[]);e.splices[e.splices.length]={index:d,deleteCount:m?m.length:0,addedCount:r?r.length:0,added:r,deleted:m}}},1==c?void 0:0,d)},T=function(a,b,c,d,e){a&&b&&(D(a,b,function(a,b,A,k){a={type:"update"};a.value=A;a.oldvalue=k;(d&&y(A)||g(A))&&F(A,c,d,e);c.call(this,a)},0),(d&&y(a[b])||g(a[b]))&&F(a[b],c,d,e))},K=function(a,b,c,d){var e=!1,f=g(a);a.watchers||(J(a,"watchers",{}),f&&U(a,function(c,e,f,h){P(a,c,e,f,h);if(0!==d&&f&&(y(f)||g(f))){var k,l;c=a.watchers[b];if(h=a.watchers.__watchall__)c=c?c.concat(h):h;l=c?c.length:0;for(h=0;h<l;h++)if("splice"!==e)n(f,c[h],void 0===d?d:d-1);else for(k=0;k<f.length;k++)n(f[k],c[h],void 0===d?d:d-1)}}));a.watchers[b]||(a.watchers[b]=[],f||(e=!0));for(f=0;f<a.watchers[b].length;f++)if(a.watchers[b][f]===c)return;a.watchers[b].push(c);if(e){var h=a[b];c=function(){return h};e=function(c,e){var f=h;h=c;if(0!==d&&a[b]&&(y(a[b])||g(a[b]))&&!a[b].watchers){var m,l=a.watchers[b].length;for(m=0;m<l;m++)n(a[b],a.watchers[b][m],void 0===d?d:d-1)}a.watchers&&(a.watchers.__wjs_suspend__||a.watchers["__wjs_suspend__"+b])?V(a,b):k.noMore||f===c||(e?P(a,b,"set",c,f):z(a,b,"set",c,f),k.noMore=!1)};k.useDirtyCheck?I(a,b,e):R(a,b,c,e)}},z=function(a,b,c,d,e){if(void 0!==b){var f,h=a.watchers[b];if(f=a.watchers.__watchall__)h=h?h.concat(f):f;f=h?h.length:0;for(var g=0;g<f;g++)h[g].call(a,b,c,d,e)}else for(b in a)a.hasOwnProperty(b)&&z(a,b,c,d,e)},Q="pop push reverse shift sort slice unshift splice".split(" "),W=function(a,b,c,d){J(a,c,function(){var e=0,f,h,g;if("splice"===c){g=arguments[0];h=a.slice(g,g+arguments[1]);f=[];for(e=2;e<arguments.length;e++)f[e-2]=arguments[e];e=g}else f=0<arguments.length?arguments[0]:void 0;g=b.apply(a,arguments);"slice"!==c&&("pop"===c?(h=g,e=a.length):"push"===c?e=a.length-1:"shift"===c?h=g:"unshift"!==c&&void 0===f&&(f=g),d.call(a,e,c,f,h));return g})},U=function(a,b){if(x(b)&&a&&!(a instanceof String)&&g(a))for(var c=Q.length,d;c--;)d=Q[c],W(a,a[d],d,b)},M=function(a,b,c){if(void 0===c&&a.watchers[b])delete a.watchers[b];else for(var d=0;d<a.watchers[b].length;d++)a.watchers[b][d]==c&&a.watchers[b].splice(d,1);for(d=0;d<p.length;d++){var e=p[d];e.obj==a&&e.prop==b&&e.watcher==c&&p.splice(d,1)}for(c=0;c<l.length;c++)d=l[c],e=d.object.watchers,(d=d.object==a&&d.prop==b&&e&&(!e[b]||0==e[b].length))&&l.splice(c,1)},V=function(a,b){O(function(){delete a.watchers.__wjs_suspend__;delete a.watchers["__wjs_suspend__"+b]})},G=null,P=function(a,b,c,d,e){w[w.length]={obj:a,prop:b,mode:c,newval:d,oldval:e};null===G&&(G=setTimeout(X))},X=function(){var a=null;G=null;for(var b=0;b<w.length;b++)a=w[b],z(a.obj,a.prop,a.mode,a.newval,a.oldval);a&&(w=[])},L=function(a,b,c,d){var e;e="$$watchlengthsubjectroot"===b?q(a):q(a[b]);p.push({obj:a,prop:b,actual:e,watcher:c,level:d})};setInterval(function(){for(var a=0;a<p.length;a++){var b=p[a];if("$$watchlengthsubjectroot"===b.prop){var c=H(b.obj,b.actual);if(c.added.length||c.removed.length)c.added.length&&B(b.obj,c.added,b.watcher,b.level-1,!0),b.watcher.call(b.obj,"root","differentattr",c,b.actual);b.actual=q(b.obj)}else{c=H(b.obj[b.prop],b.actual);if(c.added.length||c.removed.length){if(c.added.length)for(var d=0;d<b.obj.watchers[b.prop].length;d++)B(b.obj[b.prop],c.added,b.obj.watchers[b.prop][d],b.level-1,!0);z(b.obj,b.prop,"differentattr",c,b.actual)}b.actual=q(b.obj[b.prop])}}for(a in l){var b=l[a],c=b.object[b.prop],d=b.orig,e=c,f=void 0,g=!0;if(d!==e)if(y(d))for(f in d){if((C||"watchers"!==f)&&d[f]!==e[f]){g=!1;break}}else g=!1;g||(b.orig=q(c),b.callback(c))}},50);k.watch=function(){x(arguments[1])?n.apply(this,arguments):g(arguments[1])?B.apply(this,arguments):D.apply(this,arguments)};k.unwatch=function(){x(arguments[1])?S.apply(this,arguments):g(arguments[1])?E.apply(this,arguments):M.apply(this,arguments)};k.callWatchers=z;k.suspend=function(a,b){a.watchers&&(a.watchers["__wjs_suspend__"+(void 0!==b?b:"")]=!0)};k.onChange=function(){(x(arguments[2])?T:F).apply(this,arguments)};return k});
