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
                fwd.sliderVal(fwd.dreamVal+"K");
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
                fwd.sliderVal(fwd.dreamVal+"K");
                // change image
                fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(false, function(){fwd.runningAnimation=false;});
            }else{
            }
        },
        fwd = {
        	preloadImg:function(){
        		$.loadImages([
        			'mini-calcu/img//sliced_FWD_interface_v03_out_dream_car_btn.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_dream_marriage_btn.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_dream_other_btn.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_dream_travel_btn.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_title_screen.png',
        			'mini-calcu/img//img_button_long.png',
        			'mini-calcu/img//img_button_mid.png',
        			'mini-calcu/img//img_button_short.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_cs5_land.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_cs5_arrow_l.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_cs5_arrow_r.png',
        			'mini-calcu/img//img_man_young.png', 
        			'mini-calcu/img//img_man_middle.png',
        			'mini-calcu/img//img_man_old.png',
        			'mini-calcu/img//img_woman_young.png',
        			'mini-calcu/img//img_woman_middle.png',
        			'mini-calcu/img//img_woman_old.png',
        			'mini-calcu/img//sprite/img_man_young_sprite.png',
        			'mini-calcu/img//sprite/img_woman_young_sprite.png',
        			'mini-calcu/img//img_couple_young.png',
        			'mini-calcu/img//sprite/img_couple_young_sprite.png',
        			'mini-calcu/img//img_map_low.png',
        			'mini-calcu/img//img_map_mid.png',
        			'mini-calcu/img//img_map_high.png',
        			'mini-calcu/img//sliced_FWD_interface_v03_out_cs5_slider_bar_base.png'
        		], function(){
//         			alert('');
        		});
        	},
        	winkMax: 5000,
        	winkMin: 1000,
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
            userAge: 11,
            currentAgeGroup: "young",
            calAgeTpl: $(".calAge"),
            user_sex: {},
            resetData:function(){
            	fwd.userAge = 11;
            	fwd.user_sex={};
            },
            _this: '',
            dreamSelect: "car",
            dreamVal: 200+"K",
            dreamBudgetTxt :$(".calAge .budget"),
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
                var hideArray  = [fwd.headerBanner, fwd.manConfig.tpl, fwd.girlConfig.tpl, fwd.manConfig.tpl, fwd.leftArrow, fwd.rightArrow, fwd.calAgeTpl];
                for (var i in hideArray) {
                    fwd.hideObj(hideArray[i]);
                }
            },
            
            storyFlow: { // main story flow and the initial state 
                first: function () {
                	fwd.runningAnimation = true;
                    fwd.showObj(fwd.firstPageLetgoBtn);
                    fwd.hideObj(fwd.secondPageDreaming);
                    fwd.hideObj(fwd.dreamTxt);
                    $.when(fwd.hideCommon()).then(fwd.showObj($(".wrapper")));
                    var cssObj = {
                        "background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_cs5-01.png')",
                        "height": "100%"
                    };
                    fwd.tplCss(fwd.main_background, cssObj);
                    fwd.runningAnimation = false;
                },
                second: function () {
                	fwd.runningAnimation = true;
                    fwd.hideObj(fwd.firstPageLetgoBtn);
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
								fwd.user_sex={};
								fwd.showObj(fwd.dreamTxt);
								fwd.showObj(fwd.secondPageDreaming);
								var cssObj = {
									"background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_title_screen.png')",
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
						"background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_land_bg.png')",
						"height": "100%"
					};
					fwd.tplCss(fwd.main_background, cssObj);
					fwd.manConfig.stopAnimation();
					fwd.girlConfig.stopAnimation();
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
                        fwd.hideObj(fwd.dreamTxt),
                        fwd.setText(fwd.headerBannerDialog, "How old are you?")
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
							fwd.sliderObj.min = 10;
							fwd.sliderObj.max = 80;
		
							fwd.setText(fwd.sliderRange.under, "under "+fwd.sliderObj.min);
							fwd.setText(fwd.sliderRange.over, "over "+fwd.sliderObj.max);
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
								fwd.fadeInAnimate(fwd.user_sex.tpl);
								$.when(
									fwd.moveAnimation(genderObj)
								).then(
									fwd.showHeaderBannerDialog(function(){fwd.runningAnimation=false;})
								);
								fwd.sliderObj.value = fwd.userAge;
								$.when(
									fwd.createSlider(),
									fwd.showObj(fwd.calAgeTpl)
								).then(
									function(){
										fwd.sliderVal(fwd.userAge);
									}
								);
		
							}else{
								fwd.setText(fwd.headerBannerDialog, "Are you a man or a woman?");
								fwd.manConfig.tpl.removeClass("wink big");
								fwd.girlConfig.tpl.removeClass("wink big");
								fwd.disableRightArrow();
								fwd.applyAgeToCharImg(fwd.manConfig, false, function(){fwd.runningAnimation=false;});
								fwd.applyAgeToCharImg(fwd.girlConfig, false, function(){fwd.runningAnimation=false;});
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
											fwd.hideObj(fwd.calAgeTpl)
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
											fwd.hideObj(fwd.calAgeTpl)
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
                        common:function(specificFunction){
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
									fwd.setText(fwd.dreamBudgetTxt, dreamObj[fwd.dreamSelect].sliderTest);
									fwd.showHeaderBannerDialog();
									fwd.tplCss(fwd.main_background, dreamObj[fwd.dreamSelect].cssObj);
									fwd.runningAnimation=false;
								});
							});
                        },
                        img: $(".wrapper .levelSelectionDiv"),
                        car: {
                            sliderTest:"Budget for your car",
                            bannerTxt :"What is your dream car?",
                            cssObj:{
                                "background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"40%"
                                },
                                low:"mini-calcu/img//img_car_low.png",
                                high:"mini-calcu/img//img_car_high.png",
                                mid:"mini-calcu/img//img_car_mid.png"
                            },
                            shakeFunction:null,
//                             smokeAnimationFunction:null,
                            startAnimation:function(){
                            	fwd.storyFlow.fourth.dream.car.stopAnimation();
                            	fwd.storyFlow.fourth.dream.car.shakeFunction = setInterval(function(){
                            		fwd.storyFlow.fourth.dream.img.find('img:visible').effect('bounce',{times: 3, distance:7}, 100, function(){});
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
// 								if(fwd.storyFlow.fourth.dream.car.smokeAnimationFunction!=null){
// 									clearInterval(fwd.storyFlow.fourth.dream.car.smokeAnimationFunction);
// 								}
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
								if(fwd.storyFlow.fourth.dream.img.find('img.low').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.low');
									carSmoke.removeClass('low');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('img.mid').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.mid');
									carSmoke.removeClass('mid');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('img.high').is(':visible')){
									prevObj = fwd.storyFlow.fourth.dream.img.find('img.high');
									carSmoke.removeClass('high');
								}
								if(fwd.dreamVal<200){
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.low');
									carSmoke.addClass('low');
								}else if(fwd.dreamVal>350){
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.high');
									carSmoke.addClass('high');
								}else{
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.mid');
									carSmoke.addClass('mid');
								}
								if(firstTime){
									targetObj.fadeIn( "slow", function(){
										fwd.storyFlow.fourth.dream.car.startAnimation();
										callback();
									});
								}
								else{
									fwd.storyFlow.fourth.dream.car.stopAnimation();
									targetObj.addClass("transition");
									prevObj.addClass("transition", 100, "", function(){
										prevObj.hide();
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
                            layout:function (){
                                fwd.storyFlow.fourth.dream.common(
                                	function(callback){
                                		var dreamObj = fwd.storyFlow.fourth.dream;
										$(dreamObj.img).html('<div class="carSmoke"></div><img class="low car" src="'+dreamObj[fwd.dreamSelect].img.low+'" alt=""/><img class="mid car" src="'+dreamObj[fwd.dreamSelect].img.mid+'" alt=""/><img class="high car" src="'+dreamObj[fwd.dreamSelect].img.high+'" alt=""/>');
                                		fwd.sliderObj.min = 10;
										fwd.sliderObj.max = 500;
										fwd.sliderObj.value = 200;
										$.when(fwd.createSlider()).then(fwd.sliderVal(fwd.dreamVal));
										fwd.setText(fwd.sliderRange.under, fwd.sliderObj.min+"K");
										fwd.setText(fwd.sliderRange.over, fwd.sliderObj.max+"K");
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        },
                        trip: {
                            sliderTest:"Budget for your trip",
                            bannerTxt :"What is your trip?",
                            cssObj:{
                                "background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"25%"
                                },
                                low:"mini-calcu/img//img_map_low.png",
                                high:"mini-calcu/img//img_map_high.png",
                                mid:"mini-calcu/img//img_map_mid.png"
                            },
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
								if(fwd.dreamVal<200){
									targetClass = 'low';
									targetObj = fwd.storyFlow.fourth.dream.img.find('img.low');
								}else if(fwd.dreamVal>350){
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
											callback();
										});
									});
								}
								else if(prevClass!=targetClass){
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
                            layout:function (){
                                fwd.storyFlow.fourth.dream.common(
                                	function(callback){
                                		fwd.storyFlow.fourth.dream.switchImage('trip', '<div class="pinContainer"><div class="pin"></div></div>');
                                		fwd.sliderObj.min = 10;
										fwd.sliderObj.max = 500;
										fwd.sliderObj.value = 200;
										$.when(fwd.createSlider()).then(fwd.sliderVal(fwd.dreamVal));
										fwd.setText(fwd.sliderRange.under, fwd.sliderObj.min+"K");
										fwd.setText(fwd.sliderRange.over, fwd.sliderObj.max+"K");
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        },
                        wedding:{
                            sliderTest:"Budget for your wedding",
                            bannerTxt :"What is your wedding?",
                            cssObj:{
                                "background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"25%"
                                },
                                low:"mini-calcu/img//img_couple_young.png",
                                high:"mini-calcu/img//img_couple_young.png",
                                mid:"mini-calcu/img//img_couple_young.png"
                            },
                            winkFunction:null,
                            startAnimation:function(classname){
                            	fwd.storyFlow.fourth.dream.wedding.stopAnimation();
                            	var divObj = fwd.storyFlow.fourth.dream.img.find('div.'+classname+' .animationDiv');
                            	if (divObj.data("animateSprite")){
									$.removeData(divObj[0],"animateSprite");
								}
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
										fwd.storyFlow.fourth.dream.wedding.startAnimation(classname);
								}, rand);
							},
							stopAnimation:function(classname){
								var divObj = fwd.storyFlow.fourth.dream.img.find('div.'+classname+' .animationDiv');
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
                            	var weddingObj = fwd.storyFlow.fourth.dream.wedding;
                            	var levelSelectionDivObj = fwd.storyFlow.fourth.dream.img;
                            	var prevClass = '';
                            	var targetClass = '';
                            	var prevObj = null;
                            	var targetObj = null;
								if(fwd.storyFlow.fourth.dream.img.find('div.low').is(':visible')){
									prevClass = 'low';
									prevObj = levelSelectionDivObj.find('div.low');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('div.mid').is(':visible')){
									prevClass = 'mid';
									prevObj = levelSelectionDivObj.find('div.mid');
								}
								else if(fwd.storyFlow.fourth.dream.img.find('div.high').is(':visible')){
									prevClass = 'high';
									prevObj = levelSelectionDivObj.find('div.high');
								}
								if(fwd.dreamVal<200){
									targetClass = "low";
									targetObj = levelSelectionDivObj.find('div.low');
								}else if(fwd.dreamVal>350){
									targetClass = "high";
									targetObj = levelSelectionDivObj.find('div.high');
								}else{
									targetClass = "mid";
									targetObj = levelSelectionDivObj.find('div.mid');
								}
								weddingObj.stopAnimation(prevClass);
								levelSelectionDivObj.find('div.couple').removeClass('wink');
                            	if(firstTime){
									targetObj.addClass('init');
									targetObj.show();
									targetObj.switchClass('init','',500,"easeOutElastic", function(){
										targetObj.addClass("wink");
										weddingObj.startAnimation(targetClass);
										callback();
									});
								}
								else if(prevClass!=targetClass){
									weddingObj.stopAnimation(prevClass);
									targetObj.addClass("transition");
									prevObj.addClass("transition", 100, "", function(){
										prevObj.hide();
										prevObj.removeClass("transition");
										$.when(targetObj.show())
										.then(
											targetObj.removeClass("transition", 100, "", function(){
												weddingObj.startAnimation(targetClass);
												callback();
											})
										);
									});
								} 	
								else{
									callback();
								}
                            },
                            layout:function () {
                                fwd.storyFlow.fourth.dream.common(
                                	function(callback){
                                		var dreamObj = fwd.storyFlow.fourth.dream;
										$(dreamObj.img).html('<div class="low couple"><div class="animationDiv"></div></div><div class="mid couple"><div class="animationDiv"></div></div><div class="high couple"><div class="animationDiv"></div></div>');
                                		fwd.sliderObj.min = 10;
										fwd.sliderObj.max = 500;
										fwd.sliderObj.value = 200;
										$.when(fwd.createSlider()).then(fwd.sliderVal(fwd.dreamVal));
										fwd.setText(fwd.sliderRange.under, fwd.sliderObj.min+"K");
										fwd.setText(fwd.sliderRange.over, fwd.sliderObj.max+"K");
										fwd.storyFlow.fourth.dream[fwd.dreamSelect].showImg(true,callback);
                                	}
                                );
                            }
                        },
                        saving: {
                            sliderTest:"Budget for your saving plan",
                            bannerTxt :"What is your saving plan?",
                            cssObj:{
                                "background-image": "url('mini-calcu/img//sliced_FWD_interface_v03_out_land_bg.png')",
                                "height": "100%"
                            },
                            img:{
                                cssObj:{
                                    top:"-2%"
                                },
                                low:"mini-calcu/img//sliced_FWD_interface_v03_out_cs5_others_low.png",
                                high:"mini-calcu/img//sliced_FWD_interface_v03_out_cs5_pig_high.png",
                                mid:"mini-calcu/img//sliced_FWD_interface_v03_out_cs5_pig_mid.png"
                            },
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
								if(fwd.dreamVal<200){
									targetClass = 'low';
									fwd.storyFlow.fourth.dream.saving.prevPigLevel = 1;
									targetLevel = 1;
								}else if(fwd.dreamVal>350){
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
                            layout:function (){
                                fwd.storyFlow.fourth.dream.common(
                                	function(callback){
                                		$(fwd.storyFlow.fourth.dream.img).html('<div class="coin"></div><div class="saving"></div>');
                                		fwd.sliderObj.min = 10;
										fwd.sliderObj.max = 500;
										fwd.sliderObj.value = 200;
										$.when(fwd.createSlider()).then(fwd.sliderVal(fwd.dreamVal));
										fwd.setText(fwd.sliderRange.under, fwd.sliderObj.min+"K");
										fwd.setText(fwd.sliderRange.over, fwd.sliderObj.max+"K");
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

                },
                sixth: function () {

                }
            },
            init: function () {
                fwd.ResetAllThing();
            },
            ResetAllThing:function(){
                var f = fwd.flow;
                fwd._this =f.flow[f.current].status;
                fwd.storyFlow[fwd._this]();
            },
            flow: new state([{status:"first"},{status:"second"}, {status:"third"},{status:"fourth"},{status:"fifth"},{status:"sixth"}]),

            onClickRight: function (data) {
            	if(fwd.runningAnimation==false){
            		fwd.runningAnimation=true;
					switch(fwd._this) {
						case "first":
							fwd.flow.next();
							fwd.storyFlow[fwd._this]();
							break;
						case "second":
							fwd.resetData();
							fwd.dreamSelect = data;
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
								fwd.storyFlow.fourth.dream[fwd.dreamSelect].layout();
							}
							break;
						case "fourth":
							fwd.runningAnimation = false;
							break;
						case "fifth":
							fwd.runningAnimation = false;
							break;
						case "sixth":
							fwd.runningAnimation = false;
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
								console.log("go to select gender!");
								fwd.user_sex = null;
							}else{
								fwd.flow.prev();
							}
							break;
						case "fourth":
							if(!jQuery.isEmptyObject(fwd.user_sex)) {
								fwd.flow.prev();
							}
							fwd.storyFlow.fourth.dream.car.stopAnimation();
							fwd.storyFlow.fourth.dream.trip.stopAnimation();
							fwd.storyFlow.fourth.dream.wedding.stopAnimation();
							break;
						case "fifth":
							fwd.flow.prev();
							break;
						case "sixth":
							fwd.flow.prev();
							break;
					}
					fwd.storyFlow[fwd._this]();
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
							fwd.fadeInAnimate(fwd.calAgeTpl);
							fwd.enableRightArrow();
							fwd.hideObj(fwd.headerBannerDialog);
							fwd.setText(fwd.headerBannerDialog, "How old are you?");
							fwd.showHeaderBannerDialog(function(){fwd.runningAnimation=false;});
						}}
					);
                }
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
            main_background: $(".wrapper .main_background"),
            setText: function (tpl, msg) {
                tpl.text(msg);
            },
            sliderVal: function (val) {
            	var p = $(fwd.sliderValueSelector);
                p.html(val);
            },
            sliderTpl: $("#slider"),
            sliderObj: {
                orientation: "horizontal",
                range: "min",
                value: 18,
                min: 10,
                max: 80,
                step: 1,
                slide: slideSlider,
                change: changeSlider
            },
            sliderValueSelector:"#slider .slider_val",
            createSlider:function(){
            	if (fwd.sliderTpl.data("ui-slider")){
            		fwd.sliderTpl.slider("destroy");
            	}
            	fwd.sliderTpl.slider(fwd.sliderObj);
				var p = $(".ui-slider-handle", fwd.sliderTpl);
				p.html("<span class='slider_val'></span>");
            },
            sliderRange: {
                over: $(".calAge .sliderRange.over"),
                under: $(".calAge .sliderRange.under")
            }
        }
    window.fwd = fwd;
})(window);

$(window).on('load', function (e) {
	fwd.preloadImg();
    fwd.init();
    $("body").nodoubletapzoom();
})