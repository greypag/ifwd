var contextPath = context; //"/fwdhk"

$(document).ready(function(){
	
	$(".startCar").click(function(){
		Car.startAnimation();
	});
	$(".stopCar").click(function(){
		Car.stopAnimation();
	});


	$(".startPlane").click(function(){
		Plane.startAnimation();
	});
	$(".stopPlane").click(function(){
		Plane.stopAnimation();
	});

	$(".startGirl").click(function(){
		Girl.startAnimation();
	});
	$(".stopGirl").click(function(){
		Girl.stopAnimation();
	});

	$(".startWoman").click(function(){
		Woman.startAnimation();
	});
	$(".stopWoman").click(function(){
		Woman.stopAnimation();
	});

	$(".startFamily").click(function(){
		Family.startAnimation();
	});
	$(".stopFamily").click(function(){
		Family.stopAnimation();
	});

	$(".startMatrix").click(function(){
		Matrix.start();

	})
});

var Car = {
	shakeFunction :null,
	startAnimation:function(){
		var that = this;
    	that.stopAnimation();
    	//start animate first time
    	$('#car .body').effect('bounce',{times: 3, distance:7}, 100, null);
    	that.startSmokeAnimation();
    	//set interval
    	that.shakeFunction = setInterval(function(){
    		$('#car .body').effect('bounce',{times: 3, distance:7}, 100, null);
    		that.startSmokeAnimation();
    	}, 3000);
	},
	stopAnimation:function(){
		var that = this;
		if(that.shakeFunction!=null){
			clearInterval(that.shakeFunction);
		}
		that.stopSmokeAnimation();
	},
	startSmokeAnimation:function(){
		var that = this;
    	that.stopSmokeAnimation();
    	if ($("#car .smoke").data("animateSprite")){
			$.removeData($("#car .smoke")[0],"animateSprite");
		}
		$("#car .smoke").show();
		$("#car .smoke").animateSprite({
			fps: 33,
			columns:11,
			animations: {
				wink: [0,1,2,3,4,5,6,7,8,9,10]
			},
			autoplay:true,
			loop: false,
			complete:function(){
				that.stopSmokeAnimation();
			}
		});
	},
	stopSmokeAnimation:function(){
		$("#car .smoke").hide();
		if ($("#car .smoke").data("animateSprite")){
			$("#car .smoke").animateSprite('stop');
			$("#car .smoke").animateSprite('frame', 0);
			$.removeData($("#car .smoke")[0],"animateSprite");
		}
	},
}


var Plane = {
	shakeFunction:null,
	startAnimation:function(){
		var that = this;
    	that.stopAnimation();
    	//start animate first time
    	$('#plane .body').animate( { top: "0px" }, 800, "easeInOutExpo" )
	        .animate( { top: "0px"}, 600, "easeOutQuad" );

    	//set interval
    	that.shakeFunction = setInterval(function(){

    		$('#plane .body').animate( { top: "5px" }, 800, "easeInOutExpo" )
	        .animate( { top: "0px"}, 600, "easeInQuad" );

    	}, 1400);
	},
	stopAnimation:function(){
		var that = this;
		if(that.shakeFunction!=null){
			clearInterval(that.shakeFunction);
		}
	},
}


var Girl = {
	shakeFunction :null,
	startAnimation:function(){
		var that = this;
    	that.stopAnimation();
    	//start animate first time
    	$('#girl .body').effect('bounce',{times: 1, distance:7}, 300, null);
    	//set interval
    	that.shakeFunction = setInterval(function(){
    		$('#girl .body').effect('bounce',{times: 1, distance:7}, 300, null);
    	}, 3000);
	},
	stopAnimation:function(){
		var that = this;
		if(that.shakeFunction!=null){
			clearInterval(that.shakeFunction);
		}
	},
	
}

var Woman = {
	startAnimation:function(){
		var that = this;
    	that.stopAnimation();
    	if ($("#woman .body").data("animateSprite")){
			$.removeData($("#woman .body")[0],"animateSprite");
		}
		$("#woman .body").animateSprite({
			fps: 5,
			columns:3,
			animations: {
				wink: [0,0,0,0,1,0,0,0,2,0,2]
			},
			autoplay:true,
			loop: true,
			complete:function(){
				//that.stopSmokeAnimation();
			}
		});
	},
	stopAnimation:function(){
		if ($("#woman .body").data("animateSprite")){
			$("#woman .body").animateSprite('stop');
			$("#woman .body").animateSprite('frame', 0);
			$.removeData($("#woman .body")[0],"animateSprite");
		}
	},
}

var Family = {
	startAnimation:function(){
		var that = this;
    	that.stopAnimation();
    	if ($("#family .body").data("animateSprite")){
			$.removeData($("#family .body")[0],"animateSprite");
		}
		$("#family .body").animateSprite({
			fps: 8,
			columns:3,
			animations: {
				wink: [0,1,0,1,0,1,0,1,0,1,0,1,0,2]
			},
			autoplay:true,
			loop: true,
			complete:function(){
				//that.stopSmokeAnimation();
			}
		});
	},
	stopAnimation:function(){
		if ($("#family .body").data("animateSprite")){
			$("#family .body").animateSprite('stop');
			$("#family .body").animateSprite('frame', 0);
			$.removeData($("#family .body")[0],"animateSprite");
		}
	},
}

var Matrix = {

	base: "matrix_m1",
	depends: "spacer",
	pos: 0,
	pattern: contextPath+"/resources/images/onlinesavieFNA/matrix_mob_{base}_{depends}.png",
	start:function(gender,age,status,dependents){
		var that = this;
		/*var gender = parseInt($('input[name=gender]:checked', '#myForm').val());
		var age = parseInt($("#age").val());
		var status = parseInt($("#marital_status").val());
		var dependents = parseInt($("#dependents").val());*/
		that.genBasic(gender, age, status);
		that.genDependents(dependents);
		that.animate();
	},

	genBasic:function(gender, age, status){

		var that = this;
		var filename = "matrix_";
		if(status == 1){
			filename += "c";
		}else{
			filename += (gender == 0)? "m":"w";
		}

		if(age <= 30){
			filename += "1";
		}else if( age > 30 && age <= 50){
			filename += "2";
		}else{
			filename += "3";
		}
		that.base = filename;
	},

	genDependents:function(dependents){
		var that = this;
		that.pos = dependents;
		if(dependents > 0){
			that.depends = "matrix_dependent"+dependents;
		}else{
			that.depends = "spacer";
		}
	},

	animate:function(){
		var that = this;
		var target = $('#matrix .self');
		
		var currentBase = target.find("img").attr("src");
		var newBase = contextPath+"/resources/images/onlinesavieFNA/"+that.base+".png";


		var dependent = $('#matrix .dependents');
		var currentDepend = dependent.find("img").attr("src");
		var newDepend = contextPath+"/resources/images/onlinesavieFNA/"+that.depends+".png";

		if(currentBase != newBase || currentDepend != newDepend){
			target.effect('clip',{"mode":"hide"}, 100, function(){
				target.find("img").attr("src", newBase);
				target.attr("class", "self").addClass("d"+that.pos);
				target.effect('clip',{"mode":"show"}, 100, null);
			});

			dependent.effect('clip',{"mode":"hide"}, 100, function(){
				dependent.find("img").attr("src", newDepend);
				dependent.effect('clip',{"mode":"show"}, 100, null);
			});
		}

		//Mobile
		var mobsrc = that.pattern.replace("{base}",that.base.replace("matrix_","")).replace("{depends}",that.depends == "spacer" ? 0 : that.depends.replace("matrix_dependent",""));
		$(".img-martix-mob").attr("src",mobsrc);
	}
}