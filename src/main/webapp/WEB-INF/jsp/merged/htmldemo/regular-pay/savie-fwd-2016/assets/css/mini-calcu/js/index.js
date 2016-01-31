var fwd;
(function (window, undefined) {
    "use strict";
    (function($) {
	  $.fn.nodoubletapzoom = function() {
		  $(this).bind('touchstart', function preventZoom(e) {
			var t2 = e.timeStamp;
			var t1 = $(this).data('lastTouch') || t2;
			var dt = t2 - t1;
			var fingers = e.originalEvent.touches.length;
			$(this).data('lastTouch', t2);
			if (!dt || dt > 500 || fingers > 1){
				return; // not double-tap
			}
			e.preventDefault(); // double tap - prevent the zoom
			// also synthesize click events we just swallowed up
			$(e.target).trigger('click');
		  });
	  };
	})(jQuery);
    var state = function(flow){
        this.flow = flow;
        this.current = 0; // current page
    };
    state.prototype.next = function() {
        var next = this.flow[++this.current];
        fwd._this = next.status;
    };
    state.prototype.prev = function() {
        var prev = this.flow[--this.current];
        fwd._this = prev.status;
    };
    
    var slideSlider = function (event, ui) {
    		if(fwd._this =="third"){
    			fwd.userAge = ui.value;
    			fwd.sliderVal(fwd.userAge);
    		}
            else if(fwd._this =="fourth"){
                fwd.dreamVal = ui.value;
                fwd.sliderVal(addFormatComma(fwd.dreamVal));
                fwd.updateValueLevelButtons();
            }else{
            }
        },
        changeSlider = function (event, ui) {
    		if(fwd._this =="third"){
    			fwd.runningAnimation=true;
    			fwd.userAge = ui.value;
    			fwd.sliderVal(fwd.userAge);
    			fwd.applyAgeToCharImg(fwd.user_sex, true, function(){fwd.runningAnimation=false;});
    		}
            else if(fwd._this =="fourth"){
            	fwd.runningAnimation=true;
                fwd.dreamVal = ui.value;
                fwd.sliderVal(addFormatComma(fwd.dreamVal));
                // change image
                fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(false, function(){fwd.runningAnimation=false;});
                fwd.updateValueLevelButtons();
            }else{
            }
        },
        //language = "en", //en, zh
        wordings = {
			en:{
				welcomePageTitle:"Welcome to<br>my dream calculator",
				welcomePageDesc:"We are here to help you find out the right amount of savings you would need in order to achieve any dreams you may have, big or small. Everything you need to know is only a few clicks away.", 
				landscapeWarning1:"Best viewed in",
				landscapeWarning2:"Landscape",
				startbutton:"Start",
				selectDreamPageTitle:"What is your dream?",
				male:"Male",
				female:"Female", 
				title_gender:"Are you a man or a woman?", 
				title_age:"How old are you?",    
				title_saving_info:"What is your current savings & targeted saving period?", 
				sliderUnit_age:"Age",
				sliderUnit_years:"Years", 
				sliderUnit_hkd:"HKD", 
				sliderTitle_currentSaving:"Amount you have already", 
				sliderTitle_savingPeriod:"Saving Period", 
				resultContent_hkd:"HK$ ", 
				resultContent_first1:"Without compound interest, you have to save ",
				resultContent_first2:" each month.",
				resultContent_second1:"With compound interest, you only need to save ",
				resultContent_second2:" each month.",
				resultContent_third:"Annual return rate: ",
				resultEmailDesc:"Email me the dream calculation result.",
				resultEmailThx1:"The calculated result is mailed to ", 
				resultEmailThx2:". Thanks for visiting.", 
				resultEmailWarning:"Please enter a valid email address.", 
				resultEmailButton:"Submit", 
				resultEmailAddressPlaceholder:"Enter your email address", 
				startOverButton:"Start Over", 
				car:{
					title:"What is your dream car?",
					lv1:"Family",
					lv2:"Stylish",
					lv3:"Luxurious"
				}, 
				trip:{
					title:"What kind of dream trip are you looking forward to?",
					lv1:"Asia Getaway",
					lv2:"Wildlife Adventure",
					lv3:"1-month in Europe or further"
				}, 
				wedding:{
					title:"How would your dream wedding look like?",
					lv1:"Simple",
					lv2:"Elegant",
					lv3:"Extravagant"
				}, 
				saving:{
					title:"Perhaps you would like to save up for something different?",
					lv1:"",
					lv2:"",
					lv3:""
				}
				
			}, 
			zh:{
				welcomePageTitle:"歡迎來到<br>我的夢想計算機",
				welcomePageDesc:"想得知如何適量儲蓄，就有效實現你心中的夢想？<br>你只要在這𥚃點撃幾下，就即時知道答案。", 
				landscapeWarning1:"橫向手機",
				landscapeWarning2:"瀏覽更佳",
				startbutton:"開始",
				selectDreamPageTitle:"你有什麼夢想?", 
				male:"男",
				female:"女", 
				title_gender:"你是男還是女？", 
				title_age:"你的年齡？",  
				title_saving_info:"現有儲蓄是多少? 預算未來儲蓄的時間又是多少?", 
				sliderUnit_age:"年齡",
				sliderUnit_years:"年",
				sliderUnit_hkd:"港元", 
				sliderTitle_currentSaving:"現有儲蓄", 
				sliderTitle_savingPeriod:"儲蓄的時間",
				resultContent_hkd:"港幣 ",  
				resultContent_first1:"在沒有複利息之下，你必須儲存每月",
				resultContent_first2:" 元。",
				resultContent_second1:"然而如果利用複利息，你只需要儲存每月",
				resultContent_second2:" 元。",
				resultContent_third:"每年回報率： ",
				resultEmailDesc:"請提供您的電郵地址, 我們會將計算結果傳送給你。",
				resultEmailThx1:"所計算的結果被已傳送至", 
				resultEmailThx2:"。謝謝光臨。", 
				resultEmailWarning:"請輸入有效的電郵地址", 
				resultEmailButton:"傳送計算結果", 
				resultEmailAddressPlaceholder:"輸入電郵地址", 
				startOverButton:"重新開始", 
				car:{
					title:"你夢想擁有的汽車是...",
					lv1:"家庭式",
					lv2:"時尚型",
					lv3:"豪華派"
				}, 
				trip:{
					title:"你期待怎樣的夢想之旅?",
					lv1:"亞洲<br>逍遙遊",
					lv2:"野生探險之旅",
					lv3:"旅遊歐洲1個月, 或更進一步"
				}, 
				wedding:{
					title:"你的夢想中的婚禮是怎麼樣？",
					lv1:"簡單",
					lv2:"優雅",
					lv3:"奢華"
				}, 
				saving:{
					title:"也許你想為一些特別的事而儲蓄?",
					lv1:"",
					lv2:"",
					lv3:""
				}
			}
		}, 
        fwd = {
        	promptedLandscapeWarning: false, 
        	promptLandscapeWarning: function(){
				if( !fwd.promptedLandscapeWarning && /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
					if(window.innerHeight > window.innerWidth){
						fwd.promptedLandscapeWarning = true;
						$("#landscapeWarningDiv").show();
					}
				}
			}, 
			hideLandscapeWarning: function(){
				$("#landscapeWarningDiv").hide();
			}, 
        	preloadImg:function(){
        		$.loadImages([
        			'mini-calcu/img/img_dream_car_btn.png',
        			'mini-calcu/img/img_dream_marriage_btn.png',
        			'mini-calcu/img/img_dream_other_btn.png',
        			'mini-calcu/img/img_dream_travel_btn.png',
        			'mini-calcu/img/img_title_screen.png',
        			'mini-calcu/img/img_button_long.png',
        			'mini-calcu/img/img_button_mid.png',
        			'mini-calcu/img/img_button_short.png',
        			'mini-calcu/img/sliced_FWD_interface_v03_out_cs5_land.png',
        			'mini-calcu/img/img_arrow_l.png',
        			'mini-calcu/img/img_arrow_r.png',
        			'mini-calcu/img/img_man_young.png', 
        			'mini-calcu/img/img_man_middle.png',
        			'mini-calcu/img/img_man_old.png',
        			'mini-calcu/img/img_woman_young.png',
        			'mini-calcu/img/img_woman_middle.png',
        			'mini-calcu/img/img_woman_old.png',
        			'mini-calcu/img/sprite/img_man_young_sprite.png',
        			'mini-calcu/img/sprite/img_woman_young_sprite.png',
        			'mini-calcu/img/img_couple_young.png',
        			'mini-calcu/img/sprite/img_couple_young_sprite.png',
        			'mini-calcu/img/img_map_low.png',
        			'mini-calcu/img/img_map_mid.png',
        			'mini-calcu/img/img_map_high.png',
        			'mini-calcu/img/sliced_FWD_interface_v03_out_cs5_slider_bar_base.png'
        		], function(){
//         			alert('');
        		});
        	},
        	winkMax: 5000,
        	winkMin: 1000,
        	currentSavingFirstTime:true, 
        	runningAnimation:false,
            showEffect:"",
            "grow":{
            	//starting point
                girl:{
                   top:"415px",
                   left:"596px",
                   width: "20px",
                   height: "55.51px"
                },
                boy:{
                    top:"415px",
                    left:"351px",
                    width: "20px",
                   height: "55.51px"
                },
            },
            "drop":{
            	//starting point
                girl:{
                    top:"0px",
                    left:"560px",
                    width:"107px",
                	height:"297px"
                },
                boy:{
                    top:"0px",
                    left:"315px",
                    width:"107px",
                	height:"297px"
                },
            },
            //gender: {},
            userAge: 10,
            currentAgeGroup: "young",
            user_sex: {},
            resetData:function(){
            	fwd.userAge = 25;
            	fwd.user_sex={};
            	fwd.dreamVal = 0;
            	fwd.savingVal = 0;
            	fwd.savingPeriodVal = 10;
            	fwd.rorVal = 3;
            	fwd.emailAddress = "";
            	fwd.currentSavingFirstTime = true;
            },
            _this: '',
            dreamSelect: "car",
            dreamVal: 0,
            savingVal: 0,
            savingPeriodVal: 1,
            rorVal: 0,
            emailAddress: "",
            rootHead: $('.wrapper'),
            calSize:{
            	width:"960px",
            	height:"590px"
            },
            firstPageLetgoBtn:$('.wrapper .letgo_btn'),
            secondPageDreaming:$('.wrapper .dreaming'),
            resize_figure:{
            	width:"107px",
                height:"297px"
            },
            girlConfig: {
            	name:"woman",
                desc:$(".wrapper .girl_figure_desc"),
                tpl: $(".girl_figure"),
                originalWidth:"92px",
                originalHeight:"255px",
                regularTop:"206px",
                regularLeft:"560px",
                selectedGenderPositionLeft:"414.5px",
                selectedGenderPositionTop:"144px",
                selectedGenderTransitionWidth:"120px",
                selectedGenderTransitionHeight:"333px",
                selectedGenderTransitionPositionLeft:"408px",
                selectedGenderTransitionPositionTop:"108px",
                tripPositionLeft:"673px",
                tripPositionTop:"186px",
                dreamPositionTop:"35%",
                dreamPositionLeft:"75%",
                movementLeft: "",
                movementTop: "",
                this_hide: $(".boy_figure"),
                winkFunction:null,
                startAnimation:function(){
                	fwd.girlConfig.stopAnimation();
					if ($(".girl_figure .animationDiv").data("animateSprite")){
            			$.removeData($(".girl_figure .animationDiv")[0],"animateSprite");
					}
					$(".girl_figure .animationDiv").animateSprite({
						fps: 2,
						columns:2,
						animations: {
							wink: [0, 1, 0]
						},
						autoplay:true,
						loop: false
					});
					var rand = Math.floor(Math.random() * (fwd.winkMax-fwd.winkMin)) + fwd.winkMin;
					fwd.girlConfig.winkFunction = setTimeout(function() {
							fwd.girlConfig.startAnimation();
					}, rand);
                },
                stopAnimation:function(){
                	if(!fwd.girlConfig.winkFunction!=null){
						clearTimeout(fwd.girlConfig.winkFunction);
					}
                	if ($(".girl_figure .animationDiv").data("animateSprite")){
                		$(".girl_figure .animationDiv").animateSprite('stop');
						$(".girl_figure .animationDiv").animateSprite('frame', 0);
            			$.removeData($(".girl_figure .animationDiv")[0],"animateSprite");
					}
                }
            },
            manConfig: {
            	name:"man",
                desc:$(".wrapper .boy_figure_desc"),
                tpl: $(".boy_figure"),
                originalWidth:"92px",
                originalHeight:"255px",
                regularTop:"206px",
                regularLeft:"315px",
                selectedGenderPositionLeft:"414.5px",
                selectedGenderPositionTop:"144px",
                selectedGenderTransitionWidth:"120px",
                selectedGenderTransitionHeight:"333px",
                selectedGenderTransitionPositionLeft:"408px",
                selectedGenderTransitionPositionTop:"108px",
                tripPositionLeft:"673px",
                tripPositionTop:"186px",
                dreamPositionTop:"35%",
                dreamPositionLeft:"75%",
                movementLeft: "",
                movementTop: "",
                this_hide: $(".girl_figure"),
                winkFunction:null,
                startAnimation:function(){
                	fwd.manConfig.stopAnimation();
					if ($(".boy_figure .animationDiv").data("animateSprite")){
						$.removeData($(".boy_figure .animationDiv")[0],"animateSprite");
					}
					$(".boy_figure .animationDiv").animateSprite({
						fps: 2,
						columns:2,
						animations: {
							wink: [0, 1, 0]
						},
						autoplay:true,
						loop: false
					});
					var rand = Math.floor(Math.random() * (fwd.winkMax-fwd.winkMin)) + fwd.winkMin;
					fwd.manConfig.winkFunction = setTimeout(function() {
							fwd.manConfig.startAnimation();
					}, rand);
                },
                stopAnimation:function(){
                	if(fwd.manConfig.winkFunction!=null){
						clearTimeout(fwd.manConfig.winkFunction);
					}
                	if ($(".boy_figure .animationDiv").data("animateSprite")){
                		$(".boy_figure .animationDiv").animateSprite('stop');
						$(".boy_figure .animationDiv").animateSprite('frame', 0);
            			$.removeData($(".boy_figure .animationDiv")[0],"animateSprite");
					}
                }
            },
            applyAgeToCharImg:function(obj, transition, callback){
            	var objHtml = obj.tpl;
            	var prevClass = "";
            	var targetClass = "";
            	if($(objHtml).hasClass("young")){
            		prevClass = "young";
            	}
            	else if($(objHtml).hasClass("middle")){
            		prevClass = "middle";
            	}
            	else if($(objHtml).hasClass("old")){
            		prevClass = "old";
            	}
            	if(fwd.userAge < 40){
					targetClass = "young";
					fwd.currentAgeGroup='young';
				}else if(fwd.userAge >= 40 && fwd.userAge <= 60){
					targetClass = "middle";
					fwd.currentAgeGroup='middle';
				}else if(fwd.userAge > 60){
					targetClass = "old";
					fwd.currentAgeGroup='old';
				}
				if(prevClass!=targetClass){
					if(transition){
						obj.stopAnimation();
						objHtml.removeClass("wink");
						objHtml.animate({
							"width": obj.selectedGenderTransitionWidth, 
							"height": obj.selectedGenderTransitionHeight, 
							top:obj.selectedGenderTransitionPositionTop, 
							left:obj.selectedGenderTransitionPositionLeft
						}, {duration:100, complete:function() {
							$(objHtml).switchClass(prevClass,targetClass);
							objHtml.animate({
								width: fwd.resize_figure.width,
								height: fwd.resize_figure.height,
								top:obj.selectedGenderPositionTop, 
								left:obj.selectedGenderPositionLeft
							}, {duration:100, complete:function() {
									objHtml.addClass("wink");
									obj.startAnimation();
									callback();
							}});
						}});
					}
					else{
						$(objHtml).switchClass(prevClass,targetClass);
						callback();
					}
				}
				else{
					callback();
				}
            }, 
            smoke:{
            	waitTime:7000/17, 
            	play:function(callback){
            		$("#smoke").animateSprite('frame', 0);
            		$("#smoke").show();
            		if ($("#smoke").data("animateSprite")){
            			$.removeData($("#smoke")[0],"animateSprite");
					}
            		$("#smoke").animateSprite({
						fps: 17,
						columns:11,
						animations: {
							grow: [0,1,2,3,4,5,6,7,8,9,10]
						},
						loop: false, 
						complete:function(){
							callback();
						}
					});
            	}
            },
            leftArrow:$(".arrow_left"),
            disableLeftArrow:function(){
            	fwd.leftArrow.addClass("disabled");
            },
            enableLeftArrow:function(){
            	fwd.leftArrow.removeClass("disabled");
            },
            rightArrow:$(".arrow_right"),
            disableRightArrow:function(){
            	fwd.rightArrow.addClass("disabled");
            },
            enableRightArrow:function(){
            	fwd.rightArrow.removeClass("disabled");
            },
            selectionPage: $(".wrapper .selectionPage"),
            hideCommon:function(){
                var hideArray  = [fwd.headerBanner, fwd.manConfig.tpl, fwd.girlConfig.tpl, 
                fwd.manConfig.tpl, fwd.leftArrow, fwd.rightArrow, fwd.sliderDivTpl, 
                fwd.sliderDivSavingTpl, $("#calculationResult div.resultContent"), 
                $("#calculationResult"), $("#emailDiv")];
                for (var i in hideArray) {
                    fwd.hideObj(hideArray[i]);
                }
                fwd.storyFlow.fourth.dream.img.html('');
            },
            
            storyFlow: { // main story flow and the initial state 
                first: function () {
                	fwd.runningAnimation = true;
                    fwd.showObj(fwd.firstPageLetgoBtn);
                    fwd.showObj(fwd.welcomePageText);
                    fwd.hideObj(fwd.secondPageDreaming);
                    fwd.hideObj(fwd.dreamTxt);
                    $.when(fwd.hideCommon()).then(fwd.showObj($(".wrapper")));
                    var cssObj = {
                        "background-image": "url('mini-calcu/img/img_banner.png')",
                        "height": "100%"
                    };
                    fwd.tplCss(fwd.main_background, cssObj);
                    $("#calculatorDiv").removeClass("second");
                    $("#calculatorDiv").removeClass("third");
                    fwd.runningAnimation = false;
                },
                second: function () {
                	fwd.runningAnimation = true;
                    fwd.hideObj(fwd.firstPageLetgoBtn);
                    fwd.hideObj(fwd.welcomePageText);
                    var cssObj = {
                        "background-image": "none",
                        "height": "100%"
                    };
                    fwd.tplCss(fwd.main_background, cssObj);
                    var useTime = 0;
					if(fwd.rootHead.height()<parseFloat(fwd.calSize.height)){
						useTime = 1000;
					}
                    $.when(fwd.hideCommon())
                    .then(
						$.when(fwd.rootHead.animate({
							width: fwd.calSize.width, 
							height: fwd.calSize.height
						}, useTime))
						.then(
							function(){
								fwd.promptLandscapeWarning();
								$("#calculatorDiv").removeClass("third");
								$("#calculatorDiv").addClass("second");
								fwd.user_sex={};
								fwd.showObj(fwd.dreamTxt);
								fwd.showObj(fwd.secondPageDreaming);
								var cssObj = {
									"background-image": "url('mini-calcu/img/img_title_screen.png')",
									"height": "100%"
								};
								fwd.tplCss(fwd.main_background, cssObj);
								fwd.runningAnimation = false;
							}
						)
                    )
                },
                third: function () {
                	fwd.runningAnimation = true;
                	var cssObj = {
						"background-image": "url('mini-calcu/img/img_land_bg.png')",
						"height": "100%"
					};
					fwd.tplCss(fwd.main_background, cssObj);
					fwd.manConfig.tpl.removeClass("defaultCursor");
					fwd.girlConfig.tpl.removeClass("defaultCursor");
					fwd.manConfig.stopAnimation();
					fwd.girlConfig.stopAnimation();
					$("#calculatorDiv").removeClass("second");
					$("#calculatorDiv").addClass("third");
                    $.when(
                    	fwd.showObj(fwd.main_background),
                        fwd.showObj(fwd.leftArrow),
                        fwd.showObj(fwd.rightArrow),
                        fwd.showObj(fwd.headerBanner),

                        fwd.hideObj(fwd.girlConfig.desc),
                        fwd.hideObj(fwd.manConfig.desc),
                        fwd.hideObj(fwd.firstPageLetgoBtn),
                        fwd.hideObj(fwd.secondPageDreaming),
                        fwd.storyFlow.fourth.dream.img.html(''),
                        //hide header text
                        fwd.resetHeaderBannerClass(),
                        fwd.hideObj(fwd.dreamTxt),
                        fwd.setText(fwd.headerBannerDialog, wordings[language].title_age)
                    ).then(
                        function(){
                            fwd.showObj($(".wrapper").hide());
                            var initialObjGirl={
								tpl:fwd.girlConfig.tpl
							};
							var initialObjBoy={
								tpl:fwd.manConfig.tpl
							};
							
							//reset slider
							fwd.sliderObj.min = 18;
							fwd.sliderObj.max = 70;
							fwd.sliderObj.unit = wordings[language].sliderUnit_age;
							fwd.sliderObj.unitLabel = "";
							fwd.sliderObj.step = 1;
							fwd.hideObj(fwd.headerBannerDialog);
							if(!jQuery.isEmptyObject(fwd.user_sex)){
								//back to select age
								fwd.enableRightArrow();
								fwd.showObj(fwd.user_sex.tpl);
								fwd.user_sex.startAnimation();
								//return gender select history and position
								var genderObj={
									tpl:fwd.user_sex.tpl,
									movementLeft: fwd.user_sex.selectedGenderPositionLeft,
									movementTop: fwd.user_sex.selectedGenderPositionTop
								};
								fwd.user_sex.stopAnimation();
								fwd.user_sex.tpl.removeClass("wink big");
								fwd.fadeInAnimate(fwd.user_sex.tpl);
								fwd.user_sex.tpl.animate({
									left: fwd.user_sex.movementLeft,
									top: fwd.user_sex.movementTop,
									width: fwd.resize_figure.width,
									height: fwd.resize_figure.height
								}, {
									duration: 251, queue: false, complete: function () {
										fwd.user_sex.tpl.addClass("wink big");
										fwd.user_sex.startAnimation();
										fwd.sliderObj.value = fwd.userAge;
										$.when(
											fwd.createSlider(),
											fwd.sliderDivTpl.addClass("age"),
											fwd.hideSliderValueLevelDiv(),
											fwd.showObj(fwd.sliderDivTpl)
										).then(
											function(){
												fwd.sliderVal(fwd.userAge);
											}
										);
										fwd.showHeaderBannerDialog(function(){fwd.runningAnimation=false;});
									}}
								);
							}else{
								fwd.setText(fwd.headerBannerDialog, wordings[language].title_gender);
								fwd.manConfig.tpl.removeClass("wink big");
								fwd.girlConfig.tpl.removeClass("wink big");
								fwd.disableRightArrow();
								fwd.applyAgeToCharImg(fwd.manConfig, false, function(){});
								fwd.applyAgeToCharImg(fwd.girlConfig, false, function(){});
								$.when(
									fwd.showObj(fwd.manConfig.tpl),
									fwd.showObj(fwd.girlConfig.tpl),
									fwd.tplCss(fwd.manConfig.tpl,fwd[fwd.showEffect]["boy"]),
									fwd.tplCss(fwd.girlConfig.tpl,fwd[fwd.showEffect]["girl"])
								).then(function(){
									fwd.sliderObj.value = fwd.userAge;
									if(fwd.showEffect=="grow"){
										$.when(
											initialObjBoy.tpl.animate({
												"width": fwd.manConfig.originalWidth, 
												"height": fwd.manConfig.originalHeight, 
												top:fwd.manConfig.regularTop, 
												left:fwd.manConfig.regularLeft
											}, {duration:1000, easing:"easeOutElastic", complete:function() {
												initialObjBoy.tpl.addClass("wink");
											}}),
											initialObjGirl.tpl.animate({
												"width": fwd.girlConfig.originalWidth, 
												"height": fwd.girlConfig.originalHeight, 
												top:fwd.girlConfig.regularTop, 
												left:fwd.girlConfig.regularLeft
											}, {duration:1000, easing:"easeOutElastic", complete:function() {
												initialObjGirl.tpl.addClass("wink");
											}}),
											fwd.showObj(fwd.girlConfig.desc),
											fwd.showObj(fwd.manConfig.desc),
											fwd.createSlider(), 
											fwd.sliderDivTpl.addClass("age"),
											fwd.hideObj(fwd.sliderDivTpl)
										).then(
											function(){
												fwd.showHeaderBannerDialog();
												fwd.manConfig.startAnimation();
												fwd.girlConfig.startAnimation();
												fwd.sliderVal(fwd.userAge);
												fwd.runningAnimation = false;
											}
										)
									}
									else{
										$.when(
											initialObjBoy.tpl.animate({
												width: fwd.manConfig.originalWidth, 
												height: fwd.manConfig.originalHeight, 
												top:fwd.manConfig.regularTop, 
											}, { duration: 100, queue: false, complete:function() {
												initialObjBoy.tpl.effect('bounce',{times: 1}, 150, function(){
													fwd.showObj(fwd.manConfig.desc);
													initialObjBoy.tpl.addClass("wink");
												});
											}}),
											initialObjGirl.tpl.animate({
												width: fwd.girlConfig.originalWidth, 
												height: fwd.girlConfig.originalHeight, 
												top:fwd.girlConfig.regularTop, 
											}, { duration: 100, queue: false, complete:function() {
												initialObjGirl.tpl.effect('bounce',{times: 1}, 200, function(){
													fwd.showObj(fwd.girlConfig.desc);
													initialObjGirl.tpl.addClass("wink");
												});
											}}),
											fwd.createSlider(), 
											fwd.sliderDivTpl.addClass("age"),
											fwd.hideObj(fwd.sliderDivTpl)
										).then(
											function(){
												fwd.showHeaderBannerDialog();
												fwd.manConfig.startAnimation();
												fwd.girlConfig.startAnimation();
												fwd.sliderVal(fwd.userAge);
												fwd.runningAnimation = false;
											}
										)
									}
								});
							}
                        }
                    )
                },
                fourth: {
                    dream: {
                        common:function(isForward, specificFunction){
                        	if(isForward){
								//fwd.user_sex.movementLeft = fwd.user_sex.dreamPositionLeft;
								//fwd.user_sex.movementTop = fwd.user_sex.dreamPositionTop;
								//fwd.moveAnimation(fwd.user_sex);
								fwd.manConfig.stopAnimation();
								fwd.girlConfig.stopAnimation();
								setTimeout(function(){fwd.hideObj(fwd.user_sex.tpl);}, fwd.smoke.waitTime);
								fwd.smoke.play(function(){
									$("#smoke").hide();
									fwd.hideObj(fwd.firstPageLetgoBtn);
									fwd.hideObj(fwd.dreamTxt);
									fwd.hideObj(fwd.headerBannerDialog);
									var dreamObj = fwd.storyFlow.fourth.dream;
									fwd.setText(fwd.headerBannerDialog, dreamObj[fwd.dreamSelect].bannerTxt);
									specificFunction(function(){
										var dreamObj = fwd.storyFlow.fourth.dream;
										fwd.showHeaderBannerDialog();
										fwd.tplCss(fwd.main_background, dreamObj[fwd.dreamSelect].cssObj);
										fwd.runningAnimation=false;
									});
								});
							}
							else{
								fwd.hideObj(fwd.sliderDivSavingTpl);
								$("#sliderDiv").removeClass("hidden");
								fwd.showObj(fwd.sliderDivTpl);
								fwd.setText(fwd.headerBannerDialog, fwd.storyFlow.fourth.dream[fwd.dreamSelect].bannerTxt);
								fwd.hideObj(fwd.headerBannerDialog);
								fwd.showHeaderBannerDialog(function(){fwd.runningAnimation = false;});
							}
                        },
                        img: $(".wrapper .levelSelectionDiv"),
                        car: {
                            bannerTxt :wordings[language].car.title,
                            cssObj:{
                                "background-image": "url('mini-calcu/img/img_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"40%"
                                },
                                low:"img/img_car_low.png",
                                high:"img/img_car_high.png",
                                mid:"img/img_car_mid.png"
                            },
                            defaultDreamValue:200000, 
                            shakeFunction:null,
                            startAnimation:function(){
                            	fwd.storyFlow.fourth.dream.car.stopAnimation();
                            	fwd.storyFlow.fourth.dream.car.shakeFunction = setInterval(function(){
                            		fwd.storyFlow.fourth.dream.img.find('div.car:visible').effect('bounce',{times: 3, distance:7}, 100, function(){});
                            		fwd.storyFlow.fourth.dream.car.startSmokeAnimation();
                            	}, 3000);
							},
							stopAnimation:function(){
								var imgObj = fwd.storyFlow.fourth.dream.img.find('img');
								if(fwd.storyFlow.fourth.dream.car.shakeFunction!=null){
									clearInterval(fwd.storyFlow.fourth.dream.car.shakeFunction);
								}
								fwd.storyFlow.fourth.dream.car.stopSmokeAnimation();
// 								imgObj.finish();
							},
							startPersonAnimation:function(){
                            	fwd.storyFlow.fourth.dream.car.stopPersonAnimation();
								$(".levelSelectionDiv div.car div.person").animateSprite({
									fps: 4,
									columns:2,
									animations: {
										shake: [0,1]
									},
									autoplay:true,
									loop: true
								});
							},
							stopPersonAnimation:function(){
								if ($(".levelSelectionDiv div.car div.person").data("animateSprite")){
									$(".levelSelectionDiv div.car div.person").animateSprite('stop');
									$(".levelSelectionDiv div.car div.person").animateSprite('frame', 0);
									$.removeData($(".levelSelectionDiv div.car div.person")[0],"animateSprite");
								}
							},
							startSmokeAnimation:function(){
                            	fwd.storyFlow.fourth.dream.car.stopSmokeAnimation();
                            	if ($(".levelSelectionDiv .carSmoke").data("animateSprite")){
									$.removeData($(".levelSelectionDiv .carSmoke")[0],"animateSprite");
								}
								$(".levelSelectionDiv .carSmoke").show();
								$(".levelSelectionDiv .carSmoke").animateSprite({
									fps: 33,
									columns:11,
									animations: {
										wink: [0,1,2,3,4,5,6,7,8,9,10]
									},
									autoplay:true,
									loop: false,
									complete:function(){
										fwd.storyFlow.fourth.dream.car.stopSmokeAnimation();
									}
								});
							},
							stopSmokeAnimation:function(){
								$(".levelSelectionDiv .carSmoke").hide();
								if ($(".levelSelectionDiv .carSmoke").data("animateSprite")){
									$(".levelSelectionDiv .carSmoke").animateSprite('stop');
									$(".levelSelectionDiv .carSmoke").animateSprite('frame', 0);
									$.removeData($(".levelSelectionDiv .carSmoke")[0],"animateSprite");
								}
							},
                            showImg:function(firstTime, callback){
                            	var carSmoke = $(".levelSelectionDiv .carSmoke");
                            	var prevObj = null;
								var targetObj = null;
								carSmoke.hide();
								if(fwd.storyFlow.fourth.dream.img.find('div.car.low').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('div.car.low');
									carSmoke.removeClass('low');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('div.car.mid').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('div.car.mid');
									carSmoke.removeClass('mid');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('div.car.high').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('div.car.high');
									carSmoke.removeClass('high');
								}
								if(fwd.dreamVal<=fwd.sliderValueLow){
									targetObj = fwd.storyFlow.fourth.dream.img.find('div.car.low');
									carSmoke.addClass('low');
								}else if(fwd.dreamVal>=fwd.sliderValueHigh){
									targetObj = fwd.storyFlow.fourth.dream.img.find('div.car.high');
									carSmoke.addClass('high');
								}else{
									targetObj = fwd.storyFlow.fourth.dream.img.find('div.car.mid');
									carSmoke.addClass('mid');
								}
								if(firstTime){
									targetObj.fadeIn( "slow", function(){
										fwd.storyFlow.fourth.dream.car.startAnimation();
										fwd.storyFlow.fourth.dream.car.startPersonAnimation();
										callback();
									});
								}
								else if(prevObj!=null){
									fwd.storyFlow.fourth.dream.car.stopAnimation();
									targetObj.addClass("transition");
									prevObj.find("div.person").addClass("transition");
									prevObj.addClass("transition", 100, "", function(){
										prevObj.hide();
										prevObj.find("div.person").removeClass("transition");
										prevObj.removeClass("transition");
										$.when(targetObj.show())
										.then(
											targetObj.removeClass("transition", 100, "", function(){
												fwd.storyFlow.fourth.dream.car.startAnimation();
												callback();
											})
										);
									});
								}
                            },
                            layout:function (isForward){
                                fwd.storyFlow.fourth.dream.common(isForward, 
                                	function(callback){
                                		var dreamObj = fwd.storyFlow.fourth.dream;
										$(dreamObj.img).html('<div class="carSmoke"></div><div class="low car"><div class="person '+fwd.user_sex.name+' '+fwd.currentAgeGroup+'"></div></div><div class="mid car"><div class="person '+fwd.user_sex.name+' '+fwd.currentAgeGroup+'"></div></div><div class="high car"><div class="person '+fwd.user_sex.name+' '+fwd.currentAgeGroup+'"></div></div>');
                                		fwd.sliderObj.min = 0;
										fwd.sliderObj.max = 1000000;
										fwd.sliderObj.value = 200000;
										fwd.sliderObj.step = 100;
										fwd.sliderObj.unit = wordings[language].sliderUnit_hkd;
										fwd.sliderObj.unitLabel = "$";
										fwd.sliderValueLow = 200000;
										fwd.sliderValueMid = 400000;
										fwd.sliderValueHigh = 800000;
										fwd.updateValueLevelButtons();
										fwd.removeValueLevelButtonsClass();
										fwd.sliderValueLevelDiv.addClass("car");
										fwd.sliderValueLevelButtonLv1Text.html(wordings[language].car.lv1);
										fwd.sliderValueLevelButtonLv2Text.html(wordings[language].car.lv2);
										fwd.sliderValueLevelButtonLv3Text.html(wordings[language].car.lv3);
										fwd.showSliderValueLevelDiv();
										$.when(fwd.createSlider()).then(fwd.sliderTpl.slider("value",fwd.dreamVal));
										fwd.sliderDivTpl.addClass(fwd.dreamSelect);
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        },
                        trip: {
                            bannerTxt : wordings[language].trip.title,
                            cssObj:{
                                "background-image": "url('mini-calcu/img/img_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"25%"
                                },
                                low:"mini-calcu/img/img_map_low.png",
                                high:"mini-calcu/img/img_map_high.png",
                                mid:"mini-calcu/img/img_map_mid.png"
                            },
                            defaultDreamValue:100000, 
                            shakeFunction:null,
                            startAnimation:function(){
                            	fwd.storyFlow.fourth.dream.trip.stopAnimation();
                            	fwd.storyFlow.fourth.dream.trip.shakeFunction = setInterval(function(){
                            		$(".wrapper .levelSelectionDiv div.pinContainer div.pin").effect('bounce',{times: 1, distance:20}, 1000, function(){});
                            	}, 3000);
							},
							stopAnimation:function(){
								if(fwd.storyFlow.fourth.dream.trip.shakeFunction!=null){
									clearInterval(fwd.storyFlow.fourth.dream.trip.shakeFunction);
								}
							},
                            showImg:function(firstTime, callback){
                            	var prevClass = '';
                            	var targetClass = '';
                            	var prevObj = null;
								var targetObj = null;
								var pinContainer = $(".wrapper .levelSelectionDiv div.pinContainer");
								if(fwd.storyFlow.fourth.dream.img.find('img.low').is(':visible')){
									prevClass = 'low';
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.low');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('img.mid').is(':visible')){
									prevClass = 'mid';
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.mid');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('img.high').is(':visible')){
									prevClass = 'high';
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.high');
								}
								if(fwd.dreamVal<=fwd.sliderValueLow){
									targetClass = 'low';
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.low');
								}else if(fwd.dreamVal>=fwd.sliderValueHigh){
									targetClass = 'high';
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.high');
								}else{
									targetClass = 'mid';
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.mid');
								}
								if(firstTime){
									targetObj.addClass('init');
									targetObj.show();
									targetObj.switchClass('init','',500,"easeOutElastic", function(){
										pinContainer.addClass(targetClass);
										pinContainer.fadeIn( "fast", function() {
											fwd.storyFlow.fourth.dream.trip.startAnimation();
											fwd.user_sex.tpl.removeClass("wink big");
											fwd.user_sex.tpl.animate({
												left: fwd.user_sex.tripPositionLeft,
												top: fwd.user_sex.tripPositionTop,
												width: fwd.user_sex.originalWidth,
												height: fwd.user_sex.originalHeight
											}, {
												duration: 0, queue: false, complete: function () {
													fwd.user_sex.tpl.addClass("wink");
													fwd.user_sex.startAnimation();
												}}
											);
											fwd.user_sex.tpl.addClass("defaultCursor");
											fwd.showObj(fwd.user_sex.tpl);
											callback();
										});
									});
								}
								else if(prevClass!=targetClass && prevObj!=null){
									fwd.storyFlow.fourth.dream.trip.stopAnimation();
									pinContainer.fadeOut( "fast", function() {
										pinContainer.switchClass(prevClass,targetClass);
										targetObj.addClass("transition");
										prevObj.addClass("transition", 100, "", function(){
											prevObj.hide();
											prevObj.removeClass("transition");
											$.when(targetObj.show())
											.then(
												targetObj.removeClass("transition", 100, "", function(){
													pinContainer.fadeIn( "fast", function() {
														fwd.storyFlow.fourth.dream.trip.startAnimation();
														callback();
													});
												})
											);
										});
									});
								}
								else{
									callback();
								}
                            },
                            layout:function (isForward){
                                fwd.storyFlow.fourth.dream.common(isForward, 
                                	function(callback){
                                		fwd.storyFlow.fourth.dream.switchImage('trip', '<div class="pinContainer"><div class="pin"></div></div>');
                                		fwd.sliderObj.min = 0;
										fwd.sliderObj.max = 500000;
										fwd.sliderObj.value = 100000;
										fwd.sliderObj.step = 100;
										fwd.sliderObj.unit = wordings[language].sliderUnit_hkd;
										fwd.sliderObj.unitLabel = "$";
										fwd.sliderValueLow = 100000;
										fwd.sliderValueMid = 200000;
										fwd.sliderValueHigh = 400000;
										fwd.updateValueLevelButtons();
										fwd.removeValueLevelButtonsClass();
										fwd.sliderValueLevelDiv.addClass("trip");
										fwd.sliderValueLevelButtonLv1Text.html(wordings[language].trip.lv1);
										fwd.sliderValueLevelButtonLv2Text.html(wordings[language].trip.lv2);
										fwd.sliderValueLevelButtonLv3Text.html(wordings[language].trip.lv3);
										fwd.showSliderValueLevelDiv();
										$.when(fwd.createSlider()).then(fwd.sliderTpl.slider("value",fwd.dreamVal));
										fwd.sliderDivTpl.addClass(fwd.dreamSelect);
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        },
                        wedding:{
                            bannerTxt : wordings[language].wedding.title,
                            cssObj:{
                                "background-image": "url('mini-calcu/img/img_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"25%"
                                },
                                low:"img/img_couple_young.png",
                                high:"img/img_couple_young.png",
                                mid:"img/img_couple_young.png"
                            },
                            defaultDreamValue:200000, 
                            prevWeddingLevel:0,
                            winkFunction:null,
                            startAnimation:function(){
                            	fwd.storyFlow.fourth.dream.wedding.stopAnimation();
                            	var divObj = fwd.storyFlow.fourth.dream.img.find('div.couple .animationDiv');
								divObj.animateSprite({
									fps: 2,
									columns:2,
									animations: {
										wink: [0, 1, 0]
									},
									autoplay:true,
									loop: false
								});
								var rand = Math.floor(Math.random() * (fwd.winkMax-fwd.winkMin)) + fwd.winkMin;
								fwd.storyFlow.fourth.dream.wedding.winkFunction = setTimeout(function() {
										fwd.storyFlow.fourth.dream.wedding.startAnimation();
								}, rand);
							},
							stopAnimation:function(){
								var divObj = fwd.storyFlow.fourth.dream.img.find('div.couple .animationDiv');
								if(fwd.storyFlow.fourth.dream.wedding.winkFunction!=null){
									clearTimeout(fwd.storyFlow.fourth.dream.wedding.winkFunction);
								}
								if (divObj.data("animateSprite")){
									divObj.animateSprite('stop');
									divObj.animateSprite('frame', 0);
									$.removeData(divObj[0],"animateSprite");
								}
							},
                            showImg:function(firstTime, callback){
                            	var prevLevel = fwd.storyFlow.fourth.dream.wedding.prevWeddingLevel;
                            	var targetLevel = 0;
                            	if(fwd.dreamVal<=fwd.sliderValueLow){
                            		fwd.storyFlow.fourth.dream.wedding.prevWeddingLevel = 1;
									targetLevel = 1;
								}else if(fwd.dreamVal>=fwd.sliderValueHigh){
									fwd.storyFlow.fourth.dream.wedding.prevWeddingLevel = 3;
									targetLevel = 3;
								}else{
									fwd.storyFlow.fourth.dream.wedding.prevWeddingLevel = 2;
									targetLevel = 2;
								}
								
								
// 								$("#weddingElegant1").show();
								
								
								if(firstTime){
									$.when(
										$(".wrapper .levelSelectionDiv div.ball").switchClass("","open",100,function(){
											return true;
										})
									)
									.then(function(){
										if(targetLevel>=2){
											$("#weddingElegant").removeClass("init",100, "easeOutBack", function(){
												if(targetLevel>=3){
													$("#weddingDeluxe").removeClass("init",100, "easeOutBack", function(){
														callback();
													});
												}
												else{
													callback();
												}
											});
										}
										else{
											callback();
										}
									});
								}
								else{
									if(prevLevel>targetLevel){
										switch(prevLevel) {
											case 1:
												callback();
												break;
											case 2:
												$("#weddingElegant").addClass("init",100, function(){
													callback();
												});
												break;
											case 3:
												$("#weddingDeluxe").addClass("init",100, function(){
													if(targetLevel==2){
														callback();
													}
													else{
														$("#weddingElegant").addClass("init",100, function(){
															callback();
														});
													}
												});
												break;
										}
									}
									else if(targetLevel>prevLevel){
										switch(prevLevel) {
											case 1:
												$("#weddingElegant").removeClass("init",100, "easeOutBack", function(){
													if(targetLevel==2){
														callback();
													}
													else{
														$("#weddingDeluxe").removeClass("init",100, "easeOutBack", function(){
															callback();
														});
													}
												});
												break;
											case 2:
												$("#weddingDeluxe").removeClass("init",100, "easeOutBack", function(){
													callback();
												});
												break;
											case 3:
												callback();
												break;
										}
									}
									else{
										callback();
									}
								}
                            },
                            layout:function (isForward) {
                                fwd.storyFlow.fourth.dream.common(isForward, 
                                	function(callback){
                                		var dreamObj = fwd.storyFlow.fourth.dream;
										$(dreamObj.img).html('<img id="weddingDeluxe" class="init" src="mini-calcu/img/img_wed_lux.png"/><img id="weddingElegant" class="init" src="mini-calcu/img/img_wed_elegant.png"/><div class="'+fwd.currentAgeGroup+' couple init"><div class="animationDiv"></div></div><div class="ball"></div>');
// 										$(dreamObj.img).html('<img id="weddingDeluxe" class="init" src="img/img_wed_lux.png"/><img id="weddingElegant" class="init" src="img/img_wed_elegant.png"/><img id="weddingElegant1" class="init" src="img/img_wed_elegant_1.png"/><div class="'+fwd.currentAgeGroup+' couple init"><div class="animationDiv"></div></div><div class="ball"></div>');
                                		fwd.sliderObj.min = 0;
										fwd.sliderObj.max = 1000000;
										fwd.sliderObj.value = 200000;
										fwd.sliderObj.step = 100;
										fwd.sliderObj.unit = wordings[language].sliderUnit_hkd;
										fwd.sliderObj.unitLabel = "$";
										fwd.sliderValueLow = 200000;
										fwd.sliderValueMid = 400000;
										fwd.sliderValueHigh = 800000;
										fwd.updateValueLevelButtons();
										fwd.removeValueLevelButtonsClass();
										fwd.sliderValueLevelDiv.addClass("wedding");
										fwd.sliderValueLevelButtonLv1Text.html(wordings[language].wedding.lv1);
										fwd.sliderValueLevelButtonLv2Text.html(wordings[language].wedding.lv2);
										fwd.sliderValueLevelButtonLv3Text.html(wordings[language].wedding.lv3);
										fwd.showSliderValueLevelDiv();
										$.when(fwd.createSlider()).then(fwd.sliderTpl.slider("value",fwd.dreamVal));
										fwd.sliderDivTpl.addClass(fwd.dreamSelect);
										fwd.resetHeaderBannerClass();
										fwd.headerBanner.addClass("wedding");
										var coupleObj = fwd.storyFlow.fourth.dream.img.find('div.couple');
										coupleObj.show();
										coupleObj.switchClass('init','',500,"easeOutElastic", function(){
											coupleObj.addClass("wink");
											fwd.storyFlow.fourth.dream.wedding.startAnimation();
											fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
										});
                                	}
                                );
                            }
                        },
                        saving: {
                            bannerTxt : wordings[language].saving.title,
                            cssObj:{
                                "background-image": "url('mini-calcu/img/img_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"-2%"
                                },
                                low:"img/sliced_FWD_interface_v03_out_cs5_others_low.png",
                                high:"img/sliced_FWD_interface_v03_out_cs5_pig_high.png",
                                mid:"img/sliced_FWD_interface_v03_out_cs5_pig_mid.png"
                            },
                            defaultDreamValue:200000, 
                            prevPigLevel:0,
                            showImg:function(firstTime, callback){
                            	var pig = fwd.storyFlow.fourth.dream.img.find('div.saving');
                            	var coin = fwd.storyFlow.fourth.dream.img.find('div.coin');
                            	var prevClass = '';
                            	var targetClass = '';
                            	var prevLevel = fwd.storyFlow.fourth.dream.saving.prevPigLevel;
                            	var targetLevel = 0;
								$(pig).stop(true, true);
                            	$(coin).stop(true, true).animate({opacity:'100'},{duration:0});
								if(fwd.dreamVal<=fwd.sliderValueLow){
									targetClass = 'low';
									fwd.storyFlow.fourth.dream.saving.prevPigLevel = 1;
									targetLevel = 1;
								}else if(fwd.dreamVal>=fwd.sliderValueHigh){
									targetClass = 'high';
									fwd.storyFlow.fourth.dream.saving.prevPigLevel = 3;
									targetLevel = 3;
								}else{
									targetClass = 'mid';
									fwd.storyFlow.fourth.dream.saving.prevPigLevel = 2;
									targetLevel = 2;
								}
								if(prevLevel==1){
									prevClass = 'low';
								}
								else if(prevLevel==2){
									prevClass = 'mid';
								}
								else if(prevLevel==3){
									prevClass = 'high';
								}
								if(firstTime){
									pig.addClass(targetClass);
									coin.addClass(targetClass);
									pig.fadeIn( "slow", function(){
										callback();
									});
								}
								else if(prevLevel!=targetLevel){
									var classes = ['low','mid','high'];
									if(prevLevel<targetLevel){
										coin.removeClass("drop");
										coin.show();
										coin.addClass("drop", 300, "", function(){
											coin.hide(function(){
												pig.switchClass(prevClass,targetClass,200, "easeOutElastic",function(){
													for(var i=0;i<classes.length;i++){
														if(i!=targetLevel-1){
															pig.removeClass(classes[i]);
															coin.removeClass(classes[i]);
														}
													}
													coin.addClass(targetClass);
													callback();
												});
											});
										});
									}
									else{
										pig.switchClass(prevClass,targetClass,200, "easeOutElastic",function(){
											for(var i=0;i<classes.length;i++){
												if(i!=targetLevel-1){
													pig.removeClass(classes[i]);
													coin.removeClass(classes[i]);
												}
											}
											coin.addClass(targetClass);
											callback();
										});
									}
								}
								else{
									callback();
								}
                            },
                            layout:function (isForward){
                                fwd.storyFlow.fourth.dream.common(isForward, 
                                	function(callback){
                                		$(fwd.storyFlow.fourth.dream.img).html('<div class="coin"></div><div class="saving"></div>');
                                		fwd.sliderObj.min = 0;
										fwd.sliderObj.max = 1000000;
										fwd.sliderObj.value = 200000;
										fwd.sliderObj.step = 100;
										fwd.sliderObj.unit = wordings[language].sliderUnit_hkd;
										fwd.sliderObj.unitLabel = "$";
										fwd.sliderValueLow = 200000;
										fwd.sliderValueMid = 400000;
										fwd.sliderValueHigh = 800000;
										$.when(fwd.createSlider()).then(fwd.sliderTpl.slider("value",fwd.dreamVal));
										fwd.sliderDivTpl.addClass(fwd.dreamSelect);
										var dreamObj = fwd.storyFlow.fourth.dream;
										var defaultImg={
											src:dreamObj[fwd.dreamSelect].img.mid
										}
										dreamObj.img.find('img').attr(defaultImg);
										fwd.tplCss(dreamObj.img,dreamObj[fwd.dreamSelect].img.cssObj);
										dreamObj.img.fadeIn( "slow", function() {});
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        }, 
                        switchImage: function(classname, postHtml){
							var dreamObj = fwd.storyFlow.fourth.dream;
							$(dreamObj.img).html('<img class="low '+classname+'" src="'+dreamObj[fwd.dreamSelect].img.low+'" alt=""/><img class="mid '+classname+'" src="'+dreamObj[fwd.dreamSelect].img.mid+'" alt=""/><img class="high '+classname+'" src="'+dreamObj[fwd.dreamSelect].img.high+'" alt=""/>'+postHtml);
						}
                    }
                },
                fifth: function () {
                	fwd.showObj(fwd.rightArrow);
                	$("#calculationResult div.resultContent").hide();
                	$("#calculationResult").hide();
                	$("#emailDiv").hide();
                	$("#sliderDiv").addClass("hidden");
                	fwd.hideObj(fwd.sliderDivTpl);
                	fwd.sliderSavingTpl.slider("option", "max", fwd.dreamVal);
                	if(fwd.currentSavingFirstTime){
                		var tempVal = fwd.dreamVal*0.4;
                		if(tempVal<=100){
                			tempVal = 0;
                		}
                		else{
                			tempVal = Math.floor(tempVal/100)*100;
                		}
                		fwd.sliderSavingTpl.slider("value", tempVal);
                		fwd.currentSavingFirstTime = false;
                	}
                	else{
                		fwd.sliderSavingTpl.slider("value", fwd.sliderSavingTpl.slider("value"));
                	}
                	fwd.sliderDivSavingTpl.find(".divLeft span.max").text(addFormatComma(fwd.dreamVal));
                	fwd.sliderSavingPeriodTpl.slider("value", fwd.savingPeriodVal);
                	fwd.showObj(fwd.sliderDivSavingTpl);
                    fwd.setText(fwd.headerBannerDialog, wordings[language].title_saving_info);
                    fwd.hideObj(fwd.headerBannerDialog);
                    fwd.showHeaderBannerDialog(function(){fwd.runningAnimation = false;});
                },
                sixth: function () {
                	fwd.hideObj(fwd.rightArrow);
                	fwd.hideObj(fwd.headerBannerDialog);
                	fwd.hideObj(fwd.sliderDivSavingTpl);
                	fwd.calculateSavingValue();
                	$("#ror").html(fwd.rorVal+"%");
                	$("#calculationResult img").addClass('init');
                	$("#rorReduceBtn").show();
                	$("#rorAddBtn").show();
					$("#calculationResult").show();
					$("#emailDiv .startoverDiv").hide();
					$("#emailDiv .desc .text").html(wordings[language].resultEmailDesc);
					$("#emailDiv .inputDiv").show();
					$("#emailDiv").show();
					$("#calculationResult img").switchClass('init','',1000,"easeOutElastic", function(){
						$("#calculationResult div.resultContent").show();
						fwd.runningAnimation = false;
					});
                }
            },
            init: function () {
                fwd.resetAllThing();
            },
            resetAllThing:function(){
                var f = fwd.flow;
                fwd._this =f.flow[f.current].status;
                fwd.resetData();
                $("#calculatorDiv").addClass(language);
                fwd.resetWordings();
                fwd.storyFlow[fwd._this]();
                fwd.createSavingSlider();
                fwd.createSavingPeriodSlider();
                $("#emailAddress").val("");
                fwd.add_placeholder('emailAddress', wordings[language].resultEmailAddressPlaceholder);
            },
            resetWordings:function(){
            	$("#welcomePageText .title").html(wordings[language].welcomePageTitle);
            	$("#welcomePageText .desc").html(wordings[language].welcomePageDesc);
            	$("#landscapeWarningDiv div.desc div.first").html(wordings[language].landscapeWarning1);
            	$("#landscapeWarningDiv div.desc div.second").html(wordings[language].landscapeWarning2);
            	$("#landscapeWarningDiv div.startButton").html(wordings[language].startbutton);
            	$("#calculatorDiv .wrapper .dreaming .title").html(wordings[language].selectDreamPageTitle);
            	$("#calculatorDiv .boy_figure .boy_figure_desc").html(wordings[language].male);
            	$("#calculatorDiv .girl_figure .girl_figure_desc").html(wordings[language].female);
            	fwd.setText(fwd.headerBannerDialog, wordings[language].title_gender);
            	$("#sliderDivSaving .divLeft .sliderTitle").html(wordings[language].sliderTitle_currentSaving);
            	$("#sliderDivSaving .divRight .sliderTitle").html(wordings[language].sliderTitle_savingPeriod);
            	$("#calculationResult .resultContent .first .firstPart").html(wordings[language].resultContent_first1);
            	$("#calculationResult .resultContent .first .secondPart").html(wordings[language].resultContent_first2);
            	$("#calculationResult .resultContent .second .firstPart").html(wordings[language].resultContent_second1);
            	$("#calculationResult .resultContent .second .secondPart").html(wordings[language].resultContent_second2);
            	$("#calculationResult .resultContent .third .firstPart").html(wordings[language].resultContent_third);
            	$("#emailBtn div.text").html(wordings[language].resultEmailButton);
            	$("#startoverBtn div").html(wordings[language].startOverButton);
            },
            flow: new state([{status:"first"},{status:"second"}, {status:"third"},{status:"fourth"},{status:"fifth"},{status:"sixth"}]),

            onClickRight: function (data) {
            	if(fwd.runningAnimation==false){
            		fwd.runningAnimation=true;
					switch(fwd._this) {
						case "first":
							fwd.flow.next();
							fwd.storyFlow[fwd._this]();
// 							fwd.openNewWindow();
							break;
						case "second":
							fwd.resetData();
							fwd.dreamSelect = data;
							fwd.dreamVal = fwd.storyFlow.fourth.dream[fwd.dreamSelect].defaultDreamValue, 
							fwd.showEffect = "grow";
							/*
							if(data=="trip"){
								fwd.showEffect = "grow";
							}else{
								fwd.showEffect = "drop";
							}*/
							$.when(
								fwd.main_background.fadeOut( 500, "linear", function(){} )
							).then(
								function(){
									fwd.flow.next();
									fwd.storyFlow[fwd._this]();
								}
							)
							break;
						case "third":
							if(!jQuery.isEmptyObject(fwd.user_sex)) {
								fwd.flow.next();
								fwd.storyFlow.fourth.dream[fwd.dreamSelect].layout(true);
							}
							break;
						case "fourth":
							fwd.flow.next();
							fwd.storyFlow[fwd._this]();
							break;
						case "fifth":
							fwd.flow.next();
							fwd.storyFlow[fwd._this]();
							break;
						default:
							fwd.runningAnimation=false;
							break;
					}
				}
            },
            onClickLeft: function () {
                if(fwd.runningAnimation==false){
                	fwd.runningAnimation=true;
					switch(fwd._this) {
						case "second":
							fwd.flow.prev();
							fwd.storyFlow[fwd._this]();
							break;
						case "third":
							if(!jQuery.isEmptyObject(fwd.user_sex)) {
								fwd.user_sex = null;
							}else{
								fwd.flow.prev();
							}
							fwd.storyFlow[fwd._this]();
							break;
						case "fourth":
							if(!jQuery.isEmptyObject(fwd.user_sex)) {
								fwd.flow.prev();
							}
							fwd.user_sex.tpl.removeClass("defaultCursor");
							fwd.storyFlow.fourth.dream.car.stopAnimation();
							fwd.storyFlow.fourth.dream.car.stopPersonAnimation();
							fwd.storyFlow.fourth.dream.trip.stopAnimation();
							fwd.storyFlow.fourth.dream.wedding.stopAnimation();
							fwd.storyFlow[fwd._this]();
							break;
						case "fifth":
							fwd.flow.prev();
							fwd.storyFlow.fourth.dream[fwd.dreamSelect].layout(false);
							break;
						case "sixth":
							fwd.flow.prev();
							fwd.storyFlow[fwd._this]();
							break;
					}
                }
            },
            sexSelection: function (sex) {
            	if(fwd.runningAnimation==false && jQuery.isEmptyObject(fwd.user_sex)){
            		fwd.runningAnimation=true;
					var gender = fwd[sex];
					fwd.user_sex = gender;
					fwd.hideObj(fwd.user_sex.desc);
					fwd.user_sex.stopAnimation();
					fwd.user_sex.tpl.removeClass("wink");
					fwd.fadeOutAnimate(fwd.user_sex.this_hide);
					fwd.user_sex.movementLeft = fwd.user_sex.selectedGenderPositionLeft;
					fwd.user_sex.movementTop = fwd.user_sex.selectedGenderPositionTop;
					fwd.user_sex.tpl.animate({
						left: fwd.user_sex.movementLeft,
						top: fwd.user_sex.movementTop,
						width: fwd.resize_figure.width,
						height: fwd.resize_figure.height
					}, {
						duration: 251, queue: false, complete: function () {
							fwd.user_sex.tpl.addClass("wink big");
							fwd.user_sex.startAnimation();
							fwd.sliderDivTpl.addClass("age");
							fwd.hideSliderValueLevelDiv(),
							fwd.fadeInAnimate(fwd.sliderDivTpl);
							fwd.enableRightArrow();
							fwd.hideObj(fwd.headerBannerDialog);
							fwd.setText(fwd.headerBannerDialog, wordings[language].title_age);
							fwd.showHeaderBannerDialog(function(){fwd.runningAnimation=false;});
						}}
					);
                }
            },
            valueLevelSelection: function (element, level) {
            	if(fwd.runningAnimation==false){
            		fwd.runningAnimation=true;
            		var value = fwd.sliderValueLow;
            		if(level==2){
            			value = fwd.sliderValueMid;
            		}
            		else if(level==3){
            			value = fwd.sliderValueHigh;
            		}
            		fwd.sliderValueLevelButtons.removeClass("active");
            		$(element).addClass("active");
            		fwd.sliderTpl.slider('value',value);
                }
            },
            updateValueLevelButtons:function(){
            	fwd.sliderValueLevelButtons.removeClass("active");
                if(fwd.dreamVal<=fwd.sliderValueLow){
					fwd.sliderValueLevelButtonLv1.addClass("active");
				}else if(fwd.dreamVal>=fwd.sliderValueHigh){
					fwd.sliderValueLevelButtonLv3.addClass("active");
				}else{
					fwd.sliderValueLevelButtonLv2.addClass("active");
				}
            },
            removeValueLevelButtonsClass: function(){
            	fwd.sliderValueLevelDiv.removeClass("car");
            	fwd.sliderValueLevelDiv.removeClass("trip");
            	fwd.sliderValueLevelDiv.removeClass("wedding");
            }, 
            tplCss: function (tpl, cssObj) {
                tpl.css(cssObj);
            },
            fadeInAnimate: function (tpl) {
                tpl.fadeIn("slow");
            },
            fadeOutAnimate: function (tpl) {
                tpl.fadeOut("slow");
            },
            hideObj: function (tpl) {
                tpl.hide();
            },
            showObj: function (tpl) {
                tpl.show();
            },
            moveAnimation: function (obj, callback) {
                obj.tpl.animate({
                        left: obj.movementLeft,
                        top: obj.movementTop
                    }, {
                        duration: 251, queue: false, complete: function () {
                        	if (typeof callback != 'undefined')
                        		callback();
                        }
                    }
                )
            },
            welcomePageText: $("#welcomePageText"),
            dreamTxt: $(".wrapper .dream_text"),
            headerBanner: $('.wrapper .pageTitle'),
            headerBannerDialog: $('.wrapper .pageTitle .txtDialog'),
            showHeaderBannerDialog: function(callback){		
            	fwd.headerBanner.addClass("init");
            	fwd.showObj(fwd.headerBannerDialog);
            	fwd.headerBanner.switchClass("init",'',1000,"easeOutElastic");
            	if (typeof callback != 'undefined')
                        		callback();
            },
            resetHeaderBannerClass: function(){
            	fwd.headerBanner.removeClass("wedding");
            },
            main_background: $(".wrapper .main_background"),
            setText: function (tpl, msg) {
                tpl.text(msg);
            },
            sliderVal: function (val) {
            	var p = $(fwd.sliderValueSelector);
                p.html(val);
            },
            sliderDivTpl: $("#sliderDiv"),
            sliderUnit: $("#sliderDiv .sliderUnit"),
            sliderTpl: $("#slider"),
            sliderObj: {
                orientation: "horizontal",
                range: "min",
                value: 18,
                min: 10,
                max: 80,
                step: 1,
                slide: slideSlider,
                change: changeSlider,
                unit: "",
                unitLabel:"$"
            },
            sliderValueLow:0,
            sliderValueMid:0,
            sliderValueHigh:0,
            sliderClasses:["age","car","trip","wedding","saving"],
            sliderValueSelector:"#slider #tooltip span.valueLabel",
            sliderValueLevelDiv:$(".wrapper #sliderDiv div.valueLevelDiv"),
            sliderValueLevelButtons:$("#sliderDiv div.valueLevelButton"),
            sliderValueLevelButtonLv1:$("#valueLevelBtn_lv1"),
            sliderValueLevelButtonLv1Text:$("#valueLevelBtn_lv1 div.btnText"),
            sliderValueLevelButtonLv2:$("#valueLevelBtn_lv2"),
            sliderValueLevelButtonLv2Text:$("#valueLevelBtn_lv2 div.btnText"),
            sliderValueLevelButtonLv3:$("#valueLevelBtn_lv3"),
            sliderValueLevelButtonLv3Text:$("#valueLevelBtn_lv3 div.btnText"),
            hideSliderValueLevelDiv:function(){
            	fwd.sliderValueLevelDiv.addClass("hidden");
            },
            showSliderValueLevelDiv:function(){
            	fwd.sliderValueLevelDiv.removeClass("hidden");
            },
            createSlider:function(){
            	if (fwd.sliderTpl.data("ui-slider")){
            		fwd.sliderTpl.slider("destroy");
            	}
            	fwd.sliderTpl.slider(fwd.sliderObj).find(".ui-slider-handle").append(
            		'<span id="tooltip" class="ui-slider-tooltip ui-widget-content ui-corner-all"><span class="unitLabel"></span><span class="valueLabel"></span></span>'
            		+'<span class="ui-tooltip-pointer-down ui-widget-content"><span class="ui-tooltip-pointer-down-inner"></span></span>'
            	);
            	fwd.sliderUnit.html(fwd.sliderObj.unit);
            	$("#slider #tooltip span.unitLabel").html(fwd.sliderObj.unitLabel);
            	for (var i in fwd.sliderClasses) {
                    fwd.sliderDivTpl.removeClass(fwd.sliderClasses[i]);
                }
            	
            }, 
            sliderDivSavingTpl: $("#sliderDivSaving"),
            sliderSavingTpl: $("#sliderSaving"), 
            sliderSavingUnit: $("#sliderDivSaving .sliderUnit.saving"),
            sliderSavingPeriodTpl: $("#sliderSavingPeriod"),
            sliderSavingPeriodUnit: $("#sliderDivSaving .sliderUnit.savingPeriod"), 
            sliderSavingVal: function (val) {
            	var p = $("#tooltipSaving span.valueLabel");
                p.html(val);
            },
            sliderSavingPeriodVal: function (val) {
            	var p = $("#tooltipSavingPeriod span.valueLabel");
                p.html(val);
            },
            createSavingSlider: function(){
            	var sliderObj = {
					orientation: "horizontal",
					range: "min",
					value: fwd.savingVal,
					min: 0,
					max: 80,
					step: 100,
					slide: function(event, ui){
						fwd.savingVal = ui.value;
                		fwd.sliderSavingVal("$"+addFormatComma(fwd.savingVal));
					},
					change: function(event, ui){
						fwd.savingVal = ui.value;
                		fwd.sliderSavingVal("$"+addFormatComma(fwd.savingVal));
					}
				};
            	//slider of saving
                if (fwd.sliderSavingTpl.data("ui-slider")){
            		fwd.sliderSavingTpl.slider("destroy");
            	}
                fwd.sliderSavingTpl.slider(sliderObj).find(".ui-slider-handle").append(
            		'<span id="tooltipSaving" class="ui-slider-tooltip ui-widget-content ui-corner-all"><span class="unitLabel"></span><span class="valueLabel"></span></span>'
            		+'<span class="ui-tooltip-pointer-down ui-widget-content"><span class="ui-tooltip-pointer-down-inner"></span></span>'
            	);
            	fwd.sliderSavingUnit.html(wordings[language].sliderUnit_hkd);
            },
            createSavingPeriodSlider: function(){
            	var sliderObj = {
					orientation: "horizontal",
					range: "min",
					value: 1,
					min: 1,
					max: 60,
					step: 1,
					slide: function(event, ui){
						fwd.savingPeriodVal = ui.value;
                		fwd.sliderSavingPeriodVal(addFormatComma(fwd.savingPeriodVal));
					},
					change: function(event, ui){
						fwd.savingPeriodVal = ui.value;
                		fwd.sliderSavingPeriodVal(addFormatComma(fwd.savingPeriodVal));
					},
				};
            	//slider of saving period
                if (fwd.sliderSavingPeriodTpl.data("ui-slider")){
            		fwd.sliderSavingPeriodTpl.slider("destroy");
            	}
                fwd.sliderSavingPeriodTpl.slider(sliderObj).find(".ui-slider-handle").append(
            		'<span id="tooltipSavingPeriod" class="ui-slider-tooltip ui-widget-content ui-corner-all"><span class="unitLabel"></span><span class="valueLabel"></span></span>'
            		+'<span class="ui-tooltip-pointer-down ui-widget-content"><span class="ui-tooltip-pointer-down-inner"></span></span>'
            	);
            	fwd.sliderSavingPeriodUnit.html(wordings[language].sliderUnit_years);
            }, 
            calculateSavingValue: function(){
            	var nonCompVal= fwd.nonCompoundedInterestResult();
				var compVal= fwd.compoundedInterestResult();
				$("#calculationResult .nonCompoundInterest").html(wordings[language].resultContent_hkd+addFormatComma(nonCompVal));
				$("#calculationResult .compoundInterest").html(wordings[language].resultContent_hkd+addFormatComma(compVal));
            }, 
            addROR: function(){
            	if(fwd.rorVal<15){
					fwd.rorVal+=1;
					$("#ror").html(fwd.rorVal+"%");
					fwd.calculateSavingValue();
            	}
            }, 
            reduceROR: function(){
            	if(fwd.rorVal>0){
					fwd.rorVal-=1;
					$("#ror").html(fwd.rorVal+"%");
					fwd.calculateSavingValue();
            	}
            }, 
            PMT: function(rate, nper, pv, fv, type) {
				rate = parseFloat(rate);
				nper = parseFloat(nper);
				pv = parseFloat(pv);
				fv = parseFloat(fv);
				
				// Validate parameters
				if (type != 0 && type != 1) {
					return 0;
				}
			
				// Calculate
				if (rate != 0.0) {
					return (-fv - (pv * Math.pow(1 + rate, nper))) * rate / (1 + rate * type) / (Math.pow(1 + rate, nper) - 1);
				} else {
					return (-fv - pv) / nper;
				}
			}, 
			nonCompoundedInterestResult:function(){
				return (fwd.dreamVal-fwd.savingVal)/(fwd.savingPeriodVal*12);
			}, 
			compoundedInterestResult:function(){
				return -fwd.PMT(fwd.rorVal/12/100,fwd.savingPeriodVal*12,0,fwd.dreamVal,0)+fwd.PMT(fwd.rorVal/12/100,fwd.savingPeriodVal*12,0,fwd.savingVal,0);
			}, 
			sendEmail: function(){
				fwd.emailAddress = $("#emailAddress").val();
				if(fwd.validEmail(fwd.emailAddress)){
					fwd.hideObj(fwd.leftArrow);
					$("#rorReduceBtn").hide();
					$("#rorAddBtn").hide();
					$("#emailDiv .inputDiv").hide();
					fwd.setEmailIcon(3);
					$("#emailDiv .desc .text").html(wordings[language].resultEmailThx1+"<span class='emailAddressText'>"+fwd.emailAddress+"</span>"+wordings[language].resultEmailThx2);
					$("#emailDiv .startoverDiv").show();
				}
				else{
					fwd.setEmailIcon(2);
					$("#emailDiv .desc .text").html("<span class='warning'>"+wordings[language].resultEmailWarning+"</span>");
				}
			}, 
			setEmailIcon: function(val){
				$("#emailDiv .desc .mailIcon").removeClass("warning");
				$("#emailDiv .desc .mailIcon").removeClass("sent");
				if(val==2){
					$("#emailDiv .desc .mailIcon").addClass("warning");
				}
				else if(val==3){
					$("#emailDiv .desc .mailIcon").addClass("sent");
				}
			},
			validEmail: function(v) {
				var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
				return (v.match(r) == null) ? false : true;
			}, 
			startOver:function(){
				var f = fwd.flow;
				f.current = 1;
				fwd.setEmailIcon(1);
				fwd.resetAllThing();
			}, 
			add_placeholder: function (id, placeholder){
				var el = document.getElementById(id);
				el.placeholder = placeholder;
			 
				el.onfocus = function ()
				{
					if(this.value == this.placeholder)
					{
						this.value = '';
						el.style.cssText  = '';
					}
				};
			 
				el.onblur = function ()
				{
					if(this.value.length == 0)
					{
						this.value = this.placeholder;
						el.style.cssText = 'color:#999999;';
					}
				};
				el.onblur();
			}, 
			openNewWindow:function(){
				var win = window.open('index.html', '_blank');
				win.focus();
			}
        }
    window.fwd = fwd;
})(window);

$(window).on('load', function (e) {
	fwd.preloadImg();
    fwd.init();
    $("body").nodoubletapzoom();
});

function addFormatComma(objValue)
{
	var res = objValue.toFixed(2).split(".");
	var fieldValue = res[0];
	var decimalVal = res.length>1?"."+res[1]:"";
	if(decimalVal==".00"){
		decimalVal = "";
	}
	var fieldLength = fieldValue.length;
	var commaSeparatedFieldValue = "";
	var count = 0;
	for(var i=fieldLength-1 ; i>=0;i--)
	{
		count++;
		commaSeparatedFieldValue = commaSeparatedFieldValue + fieldValue.charAt(i) ;
		if(count == 3)
		{
			count = 0;
			commaSeparatedFieldValue = commaSeparatedFieldValue + ",";
		}
	}
	if(commaSeparatedFieldValue.charAt(commaSeparatedFieldValue.length-1) == ",")
	{
		commaSeparatedFieldValue = commaSeparatedFieldValue.substr(0,commaSeparatedFieldValue.length-1) ;
	}
	return reverse(commaSeparatedFieldValue)+decimalVal ;
}

function reverse(inp) 
{ 	
	var outp = "" 
	for (i = 0; i < inp.length; i++) 
	{ 
		outp = inp.charAt (i) + outp 
	} 
	return outp ;
} 

