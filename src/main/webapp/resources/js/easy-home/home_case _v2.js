(function (lib, img, cjs, ss) {

var p; // shortcut to reference prototypes

// library properties:
lib.properties = {
	width: 1024,
	height: 540,
	fps: 24,
	color: "#FFFFFF",
	manifest: [
		{src:window.eh_caseAniImgPath + "/A1.png?1466500166525", id:"A1"},
		{src:window.eh_caseAniImgPath + "/A2.png?1466500166525", id:"A2"},
		{src:window.eh_caseAniImgPath + "/A3.png?1466500166525", id:"A3"},
		{src:window.eh_caseAniImgPath + "/A4.png?1466500166525", id:"A4"},
		{src:window.eh_caseAniImgPath + "/A5.png?1466500166525", id:"A5"},
		{src:window.eh_caseAniImgPath + "/A6.png?1466500166525", id:"A6"},
		{src:window.eh_caseAniImgPath + "/A_bg.png?1466500166525", id:"A_bg"},
		{src:window.eh_caseAniImgPath + "/A_on_01.png?1466500166525", id:"A_on_01"},
		{src:window.eh_caseAniImgPath + "/A_on_02.png?1466500166525", id:"A_on_02"},
		{src:window.eh_caseAniImgPath + "/A_on_03.png?1466500166525", id:"A_on_03"},
		{src:window.eh_caseAniImgPath + "/A_on_04.png?1466500166525", id:"A_on_04"},
		{src:window.eh_caseAniImgPath + "/A_on_05.png?1466500166525", id:"A_on_05"},
		{src:window.eh_caseAniImgPath + "/A_on_06.png?1466500166525", id:"A_on_06"},
		{src:window.eh_caseAniImgPath + "/A_on_07.png?1466500166525", id:"A_on_07"},
		{src:window.eh_caseAniImgPath + "/B1.png?1466500166525", id:"B1"},
		{src:window.eh_caseAniImgPath + "/B2.png?1466500166525", id:"B2"},
		{src:window.eh_caseAniImgPath + "/B3.png?1466500166525", id:"B3"},
		{src:window.eh_caseAniImgPath + "/B4.png?1466500166525", id:"B4"},
		{src:window.eh_caseAniImgPath + "/B5.png?1466500166525", id:"B5"},
		{src:window.eh_caseAniImgPath + "/B6.png?1466500166525", id:"B6"},
		{src:window.eh_caseAniImgPath + "/B_on_01.png?1466500166525", id:"B_on_01"},
		{src:window.eh_caseAniImgPath + "/B_on_02.png?1466500166525", id:"B_on_02"},
		{src:window.eh_caseAniImgPath + "/B_on_03.png?1466500166525", id:"B_on_03"},
		{src:window.eh_caseAniImgPath + "/B_on_04.png?1466500166525", id:"B_on_04"},
		{src:window.eh_caseAniImgPath + "/B_on_05.png?1466500166525", id:"B_on_05"},
		{src:window.eh_caseAniImgPath + "/C1.png?1466500166525", id:"C1"},
		{src:window.eh_caseAniImgPath + "/C2.png?1466500166525", id:"C2"},
		{src:window.eh_caseAniImgPath + "/C3.png?1466500166525", id:"C3"},
		{src:window.eh_caseAniImgPath + "/C_bg.png?1466500166525", id:"C_bg"},
		{src:window.eh_caseAniImgPath + "/C_on_01.png?1466500166525", id:"C_on_01"},
		{src:window.eh_caseAniImgPath + "/C_on_02.png?1466500166525", id:"C_on_02"},
		{src:window.eh_caseAniImgPath + "/C_on_03.png?1466500166525", id:"C_on_03"},
		{src:window.eh_caseAniImgPath + "/C_on_04.png?1466500166525", id:"C_on_04"},
		{src:window.eh_caseAniImgPath + "/C_on_05.png?1466500166525", id:"C_on_05"},
		{src:window.eh_caseAniImgPath + "/C_on_06.png?1466500166525", id:"C_on_06"},
		{src:window.eh_caseAniImgPath + "/case_building.png?1466500166525", id:"case_building"},
		{src:window.eh_caseAniImgPath + "/case_building_b.png?1466500166525", id:"case_building_b"},
		{src:window.eh_caseAniImgPath + "/case_building_c.png?1466500166525", id:"case_building_c"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_A.png?1466500166525", id:"case_main_txt_A"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_B.png?1466500166525", id:"case_main_txt_B"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_C.png?1466500166525", id:"case_main_txt_C"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_D.png?1466500166525", id:"case_main_txt_D"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_E.png?1466500166525", id:"case_main_txt_E"},
		{src:window.eh_caseAniImgPath + "/case_main_txt_hints.png?1466500166525", id:"case_main_txt_hints"},
		{src:window.eh_caseAniImgPath + "/D1.png?1466500166525", id:"D1"},
		{src:window.eh_caseAniImgPath + "/D2.png?1466500166525", id:"D2"},
		{src:window.eh_caseAniImgPath + "/D3.png?1466500166525", id:"D3"},
		{src:window.eh_caseAniImgPath + "/D4.png?1466500166525", id:"D4"},
		{src:window.eh_caseAniImgPath + "/D_bg.png?1466500166525", id:"D_bg"},
		{src:window.eh_caseAniImgPath + "/D_on_01.png?1466500166525", id:"D_on_01"},
		{src:window.eh_caseAniImgPath + "/D_on_02.png?1466500166525", id:"D_on_02"},
		{src:window.eh_caseAniImgPath + "/D_on_03.png?1466500166525", id:"D_on_03"},
		{src:window.eh_caseAniImgPath + "/d_on_07.png?1466500166525", id:"d_on_07"},
		{src:window.eh_caseAniImgPath + "/E1.png?1466500166525", id:"E1"},
		{src:window.eh_caseAniImgPath + "/E2.png?1466500166525", id:"E2"},
		{src:window.eh_caseAniImgPath + "/E3.png?1466500166525", id:"E3"},
		{src:window.eh_caseAniImgPath + "/E4.png?1466500166525", id:"E4"},
		{src:window.eh_caseAniImgPath + "/E5.png?1466500166525", id:"E5"},
		{src:window.eh_caseAniImgPath + "/E6.png?1466500166525", id:"E6"},
		{src:window.eh_caseAniImgPath + "/E_bg.png?1466500166525", id:"E_bg"},
		{src:window.eh_caseAniImgPath + "/E_on_01.png?1466500166525", id:"E_on_01"},
		{src:window.eh_caseAniImgPath + "/E_on_02.png?1466500166525", id:"E_on_02"},
		{src:window.eh_caseAniImgPath + "/e_on_03.png?1466500166525", id:"e_on_03"},
		{src:window.eh_caseAniImgPath + "/e_On_04.png?1466500166525", id:"e_On_04"},
		{src:window.eh_caseAniImgPath + "/main_btn_hints.png?1466500166525", id:"main_btn_hints"}
	]
};



// symbols:



(lib.A1 = function() {
	this.initialize(img.A1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,25,94);


(lib.A2 = function() {
	this.initialize(img.A2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,35,69);


(lib.A3 = function() {
	this.initialize(img.A3);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,54,54);


(lib.A4 = function() {
	this.initialize(img.A4);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,35,40);


(lib.A5 = function() {
	this.initialize(img.A5);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,145,76);


(lib.A6 = function() {
	this.initialize(img.A6);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,63,46);


(lib.A_bg = function() {
	this.initialize(img.A_bg);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,159,159);


(lib.A_on_01 = function() {
	this.initialize(img.A_on_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,143,92);


(lib.A_on_02 = function() {
	this.initialize(img.A_on_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,52,48);


(lib.A_on_03 = function() {
	this.initialize(img.A_on_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,36,40);


(lib.A_on_04 = function() {
	this.initialize(img.A_on_04);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,65,76);


(lib.A_on_05 = function() {
	this.initialize(img.A_on_05);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,66,48);


(lib.A_on_06 = function() {
	this.initialize(img.A_on_06);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,36,72);


(lib.A_on_07 = function() {
	this.initialize(img.A_on_07);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,54,54);


(lib.B1 = function() {
	this.initialize(img.B1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,103,161);


(lib.B2 = function() {
	this.initialize(img.B2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,77,11);


(lib.B3 = function() {
	this.initialize(img.B3);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,72,22);


(lib.B4 = function() {
	this.initialize(img.B4);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,84,46);


(lib.B5 = function() {
	this.initialize(img.B5);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,71,37);


(lib.B6 = function() {
	this.initialize(img.B6);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,43,64);


(lib.B_on_01 = function() {
	this.initialize(img.B_on_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,26,36);


(lib.B_on_02 = function() {
	this.initialize(img.B_on_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,74,53);


(lib.B_on_03 = function() {
	this.initialize(img.B_on_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,26,36);


(lib.B_on_04 = function() {
	this.initialize(img.B_on_04);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,34,47);


(lib.B_on_05 = function() {
	this.initialize(img.B_on_05);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,131,169);


(lib.C1 = function() {
	this.initialize(img.C1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,65,147);


(lib.C2 = function() {
	this.initialize(img.C2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,41,74);


(lib.C3 = function() {
	this.initialize(img.C3);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,97,83);


(lib.C_bg = function() {
	this.initialize(img.C_bg);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,127,163);


(lib.C_on_01 = function() {
	this.initialize(img.C_on_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,31,20);


(lib.C_on_02 = function() {
	this.initialize(img.C_on_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,42,21);


(lib.C_on_03 = function() {
	this.initialize(img.C_on_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,33,24);


(lib.C_on_04 = function() {
	this.initialize(img.C_on_04);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,41,30);


(lib.C_on_05 = function() {
	this.initialize(img.C_on_05);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,27,46);


(lib.C_on_06 = function() {
	this.initialize(img.C_on_06);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,130,50);


(lib.case_building = function() {
	this.initialize(img.case_building);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,494,117);


(lib.case_building_b = function() {
	this.initialize(img.case_building_b);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,439,356);


(lib.case_building_c = function() {
	this.initialize(img.case_building_c);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,460,224);


(lib.case_main_txt_A = function() {
	this.initialize(img.case_main_txt_A);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,341,149);


(lib.case_main_txt_B = function() {
	this.initialize(img.case_main_txt_B);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,321,166);


(lib.case_main_txt_C = function() {
	this.initialize(img.case_main_txt_C);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,346,145);


(lib.case_main_txt_D = function() {
	this.initialize(img.case_main_txt_D);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,343,163);


(lib.case_main_txt_E = function() {
	this.initialize(img.case_main_txt_E);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,340,183);


(lib.case_main_txt_hints = function() {
	this.initialize(img.case_main_txt_hints);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,314,28);


(lib.D1 = function() {
	this.initialize(img.D1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,135,78);


(lib.D2 = function() {
	this.initialize(img.D2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,47,103);


(lib.D3 = function() {
	this.initialize(img.D3);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,49,34);


(lib.D4 = function() {
	this.initialize(img.D4);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,47,37);


(lib.D_bg = function() {
	this.initialize(img.D_bg);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,178,157);


(lib.D_on_01 = function() {
	this.initialize(img.D_on_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,39,42);


(lib.D_on_02 = function() {
	this.initialize(img.D_on_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,65,70);


(lib.D_on_03 = function() {
	this.initialize(img.D_on_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,52,107);


(lib.d_on_07 = function() {
	this.initialize(img.d_on_07);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,139,151);


(lib.E1 = function() {
	this.initialize(img.E1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,38,45);


(lib.E2 = function() {
	this.initialize(img.E2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,37,83);


(lib.E3 = function() {
	this.initialize(img.E3);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,50,108);


(lib.E4 = function() {
	this.initialize(img.E4);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,106,58);


(lib.E5 = function() {
	this.initialize(img.E5);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,69,32);


(lib.E6 = function() {
	this.initialize(img.E6);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,137,62);


(lib.E_bg = function() {
	this.initialize(img.E_bg);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,218,158);


(lib.E_on_01 = function() {
	this.initialize(img.E_on_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,44,54);


(lib.E_on_02 = function() {
	this.initialize(img.E_on_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,89,56);


(lib.e_on_03 = function() {
	this.initialize(img.e_on_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,21,53);


(lib.e_On_04 = function() {
	this.initialize(img.e_On_04);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,43,57);


(lib.main_btn_hints = function() {
	this.initialize(img.main_btn_hints);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,28,28);


(lib.Tween8 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_building_b();
	this.instance.setTransform(-219.5,-178);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-219.5,-178,439,356);


(lib.Tween6 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_building();
	this.instance.setTransform(-247,-58.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-247,-58.5,494,117);


(lib.Tween4 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_building_c();
	this.instance.setTransform(-230,449);

	this.instance_1 = new lib.case_building_c();
	this.instance_1.setTransform(-230,259);

	this.instance_2 = new lib.case_building_c();
	this.instance_2.setTransform(-230,71);

	this.instance_3 = new lib.case_building_c();
	this.instance_3.setTransform(-230,-112);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_3},{t:this.instance_2},{t:this.instance_1},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-230,-112,460,785);


(lib.main_hints = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.main_btn_hints();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,28,28);


(lib.e6_ = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E6();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,137,62);


(lib.e5_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E5();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,69,32);


(lib.e4_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E4();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,106,58);


(lib.e3_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E3();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,50,108);


(lib.e2_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,37,83);


(lib.e1_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E1();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,38,45);


(lib.e_txt_01 = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_E();
	this.instance.setTransform(45,-20);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	// Layer 2
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/ARRMAAAgihMBP/AAAMAAAAihg");
	this.shape.setTransform(249,61);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-7,-49.5,512.1,221.1);


(lib.e_on_04 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.e_On_04();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,43,57);


(lib.e_on_03_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.e_on_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,21,53);


(lib.e_on_02 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E_on_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,89,56);


(lib.e_on_01 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E_on_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,44,54);


(lib.E_bg_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.E_bg();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,218,158);


(lib.d4_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D4();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,47,37);


(lib.d3_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D3();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,49,34);


(lib.d2_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,47,103);


(lib.D1_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D1();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,135,78);


(lib.D_txt_mc = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_D();
	this.instance.setTransform(43,-21.9);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	// Layer 2
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/AUTMAAAgomMBP/AAAMAAAAomg");
	this.shape.setTransform(247,69.5);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-9,-60.5,512.1,260);


(lib.d_on_04 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.d_on_07();
	this.instance.setTransform(0,0,1.04,1.04);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,144.5,157);


(lib.d_on_03 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D_on_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,52,107);


(lib.d_on_02 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D_on_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,65,70);


(lib.d_on_01 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D_on_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,39,42);


(lib.D_bg_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.D_bg();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,178,157);


(lib.case_main_hints = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_hints();
	this.instance.setTransform(0,6);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,6,314,28);


(lib.c3_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C3();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,97,83);


(lib.c2_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,41,74);


(lib.c1_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C1();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,65,147);


(lib.c_txt = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_C();
	this.instance.setTransform(21.5,11);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	// Layer 2
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/ARVMAAAgiqMBP/AAAMAAAAiqg");
	this.shape.setTransform(243,52.5);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-13,-58.5,512.1,222);


(lib.c_on_06 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_06();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,130,50);


(lib.c_on_05 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_05();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,27,46);


(lib.c_on_04 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_04();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,41,30);


(lib.c_on_03 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,33,24);


(lib.c_on_02 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,42,21);


(lib.c_on_01 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_on_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,31,20);


(lib.C_bg_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.C_bg();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,127,163);


(lib.b6_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B6();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,43,64);


(lib.b5_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B5();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,71,37);


(lib.b4_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B4();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,84,46);


(lib.b3_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B3();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,72,22);


(lib.b2_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,77,11);


(lib.b_on_txt = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_B();
	this.instance.setTransform(26,-10);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	// Layer 2
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/APnIAA/OMBP/AAAIAAfOg");
	this.shape.setTransform(246,56);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-10,-44,512.1,200);


(lib.B_on_05_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B_on_05();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,131,169);


(lib.B_on_04_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B_on_04();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,34,47);


(lib.B_on_03_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B_on_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,26,36);


(lib.B_on_02_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B_on_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,74,53);


(lib.B_on_01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B_on_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,26,36);


(lib.b_bg = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.B1();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,103,161);


(lib.A6_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A6();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,63,46);


(lib.A5_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A5();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,145,76);


(lib.A4_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A4();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,35,40);


(lib.A3_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A3();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,54,54);


(lib.A2_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,35,69);


(lib.A1_m = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A1();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,25,94);


(lib.Aon_01 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,143,92);


(lib.A_txt = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_txt_A();
	this.instance.setTransform(16.5,-4);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	// Layer 2
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/AUTMAAAgomMBP/AAAMAAAAomg");
	this.shape.setTransform(240,71.5);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-16,-58.5,512.1,260);


(lib.A_on_07_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_07();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,54,54);


(lib.A_on_06_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_06();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,36,72);


(lib.A_on_05_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_05();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,66,48);


(lib.A_on_04_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_04();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,65,76);


(lib.A_on_03_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,36,40);


(lib.A_on_02_gx = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,52,48);


(lib.A_bg_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_bg();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,159,159);


(lib.e_main_over = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// E_txt_01.png
	this.instance = new lib.e_txt_01();
	this.instance.setTransform(409,-51.2,1,1,0,0,0,135,53.5);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).wait(24));

	// e_On_04.png
	this.instance_1 = new lib.e_on_04();
	this.instance_1.setTransform(17.5,91.5,1,1,0,0,0,21.5,28.5);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(9).to({_off:false},0).wait(16));

	// e_on_03.png
	this.instance_2 = new lib.e_on_03_1();
	this.instance_2.setTransform(91,3,1,0.113,0,0,0,10.5,26.5);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(9).to({_off:false},0).to({scaleY:1,y:26.5},2).wait(14));

	// E_on_02.png
	this.instance_3 = new lib.e_on_02();
	this.instance_3.setTransform(108.5,91.9,1,1,0,0,0,44.5,28);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(8).to({_off:false},0).to({y:95.6},1).to({y:102.9},2).to({y:98.9},2).wait(12));

	// E_on_01.png
	this.instance_4 = new lib.e_on_01();
	this.instance_4.setTransform(144.6,36,1.333,1.333,0,0,0,22.1,27);
	this.instance_4.alpha = 0;
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(9).to({_off:false},0).to({regX:22,scaleX:1,scaleY:1,x:120.5,y:72,alpha:1},4).to({x:123.5,y:67},2).wait(10));

	// E6.png
	this.instance_5 = new lib.e6_();
	this.instance_5.setTransform(107.5,89,1,1,0,0,0,68.5,31);

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(25));

	// E5.png
	this.instance_6 = new lib.e5_m();
	this.instance_6.setTransform(98.5,-14,1,1,0,0,0,34.5,16);

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(5).to({y:110},0).to({y:-14},3).to({_off:true},1).wait(16));

	// E4.png
	this.instance_7 = new lib.e4_m();
	this.instance_7.setTransform(103,34,1,1,0,0,0,53,29);

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(6).to({regX:53.1,regY:28.9,rotation:-8.7,x:98.1,y:26.2},3).to({regX:53,regY:29,rotation:-6,x:99.7,y:28.6},2).wait(14));

	// E3.png
	this.instance_8 = new lib.e3_m();
	this.instance_8.setTransform(185,40,1,1,0,0,0,25,54);

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(6).to({regX:24.9,regY:53.9,rotation:8.5,x:192.7,y:44.2},3).to({regX:25.1,regY:54,rotation:5,x:189.7,y:42.4},2).wait(14));

	// E2.png
	this.instance_9 = new lib.e2_m();
	this.instance_9.setTransform(21.5,78.5,1,1,0,0,0,18.5,41.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_9).to({_off:true},9).wait(16));

	// E1.png
	this.instance_10 = new lib.e1_m();
	this.instance_10.setTransform(24,8.5,1,1,0,0,0,19,22.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_10).wait(9).to({rotation:-8.7,x:17.2,y:27.4},0).wait(16));

	// Layer 8
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s().p("Egh9AZ2MAAAgzrMBD7AAAMAAAAzrgAikZEMAh4AAAIAA4hMgh4AAAg");
	this.shape.setTransform(8,-35.5);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(25));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-209.4,-201,435,331);


(lib.e_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// E6.png
	this.instance = new lib.e6_();
	this.instance.setTransform(108.5,242,1,1,0,0,0,68.5,31);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({x:107.5,y:85,alpha:1},6,cjs.Ease.get(-1)).to({y:89},3,cjs.Ease.get(0.87)).wait(15));

	// E5.png
	this.instance_1 = new lib.e5_m();
	this.instance_1.setTransform(98.5,-122,1,1,0,0,0,34.5,16);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(9).to({_off:false},0).to({y:-17,alpha:1},6,cjs.Ease.get(-1)).to({y:-14},3,cjs.Ease.get(0.87)).wait(7));

	// E4.png
	this.instance_2 = new lib.e4_m();
	this.instance_2.setTransform(103,-62,1,1,0,0,0,53,29);
	this.instance_2.alpha = 0;
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(3).to({_off:false},0).to({y:32,alpha:1},6,cjs.Ease.get(-1)).to({y:34},3,cjs.Ease.get(1)).wait(13));

	// E3.png
	this.instance_3 = new lib.e3_m();
	this.instance_3.setTransform(185,186,1,1,0,0,0,25,54);
	this.instance_3.alpha = 0;
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(4).to({_off:false},0).to({y:38,alpha:1},6,cjs.Ease.get(-1)).to({y:40},3,cjs.Ease.get(1)).wait(12));

	// E2.png
	this.instance_4 = new lib.e2_m();
	this.instance_4.setTransform(21.5,244.5,1,1,0,0,0,18.5,41.5);
	this.instance_4.alpha = 0;
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(2).to({_off:false},0).to({y:75.5,alpha:1},6,cjs.Ease.get(-1)).to({y:78.5},3,cjs.Ease.get(1)).wait(14));

	// E1.png
	this.instance_5 = new lib.e1_m();
	this.instance_5.setTransform(22,169.5,1,1,0,0,0,19,22.5);
	this.instance_5.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).to({x:24,y:4.5,alpha:1},6,cjs.Ease.get(-1)).to({y:8.5},3,cjs.Ease.get(1)).wait(16));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(3,147,38,45);


(lib.d_main_over = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// D_txt.png
	this.instance = new lib.D_txt_mc();
	this.instance.setTransform(615.5,-67.1,1,1,0,0,0,144.5,57);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({y:-63.1},8,cjs.Ease.get(1)).wait(16));

	// D_on_01.png
	this.instance_1 = new lib.d_on_01();
	this.instance_1.setTransform(114.5,-13.1,0.333,0.333,0,0,0,19.5,21);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(13).to({_off:false},0).to({scaleX:1,scaleY:1,x:110.5,y:-17.1,alpha:1},5,cjs.Ease.get(-1)).to({x:114.5,y:-13.1},3,cjs.Ease.get(1)).wait(4));

	// D_on_02.png
	this.instance_2 = new lib.d_on_02();
	this.instance_2.setTransform(129.5,21.9,0.415,0.4,0,0,0,32.5,35);
	this.instance_2.alpha = 0;
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(11).to({_off:false},0).to({scaleX:1.06,scaleY:1.06,x:108.5,y:-1.1,alpha:1},5,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,x:110.5,y:0.9},3,cjs.Ease.get(1)).wait(6));

	// d_on_07.png
	this.instance_3 = new lib.d_on_04();
	this.instance_3.setTransform(139.8,27.5,0.329,1,0,0,0,72.2,78.5);
	this.instance_3.alpha = 0;
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(9).to({_off:false},0).to({scaleX:1.05,x:87.8,alpha:1},5,cjs.Ease.get(-1)).to({scaleX:1,x:91.3},3,cjs.Ease.get(1)).wait(8));

	// D_on_03.png
	this.instance_4 = new lib.d_on_03();
	this.instance_4.setTransform(155,39.5,1,1,0,0,0,26,53.5);
	this.instance_4.alpha = 0;
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(9).to({_off:false},0).to({y:34.5,alpha:1},3,cjs.Ease.get(1)).wait(13));

	// D2.png
	this.instance_5 = new lib.d2_m();
	this.instance_5.setTransform(153.5,33.5,1,1,0,0,0,23.5,51.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(5).to({y:38.5},3,cjs.Ease.get(-1)).to({_off:true},1).wait(16));

	// D1.png
	this.instance_6 = new lib.D1_m();
	this.instance_6.setTransform(66.5,52,1,1,0,0,0,67.5,39);

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(25));

	// D3.png
	this.instance_7 = new lib.d3_m();
	this.instance_7.setTransform(49.5,-5,1,1,0,0,0,24.5,17);

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(25));

	// D4.png
	this.instance_8 = new lib.d4_m();
	this.instance_8.setTransform(105.5,-36.5,1,1,0,0,0,23.5,18.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(25));

	// Layer 8
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s().p("EgiJAZsMAAAgzXMBETAAAMAAAAzXgA/6ZYIb0AAIAA4hI70AAg");
	this.shape.setTransform(202.7,-57.6);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(25));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-15.9,-222.1,437.3,329);


(lib.d_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// D1.png
	this.instance = new lib.D1_m();
	this.instance.setTransform(67.5,178,1,1,0,0,0,67.5,39);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(3).to({_off:false},0).to({x:66.5,y:50},5,cjs.Ease.get(-1)).to({y:52},3,cjs.Ease.get(1)).wait(14));

	// D2.png
	this.instance_1 = new lib.d2_m();
	this.instance_1.setTransform(154.5,159.5,1,1,0,0,0,23.5,51.5);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(7).to({_off:false},0).to({x:153.5,y:30.5},5,cjs.Ease.get(-1)).to({y:33.5},3,cjs.Ease.get(1)).wait(10));

	// D3.png
	this.instance_2 = new lib.d3_m();
	this.instance_2.setTransform(50.5,-59,1,1,0,0,0,24.5,17);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(2).to({_off:false},0).to({x:49.5,y:-2},5,cjs.Ease.get(-1)).to({y:-5},3,cjs.Ease.get(1)).wait(15));

	// D4.png
	this.instance_3 = new lib.d4_m();
	this.instance_3.setTransform(106.5,-90.5,1,1,0,0,0,23.5,18.5);
	this.instance_3.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).to({x:105.5,y:-34.5,alpha:1},5,cjs.Ease.get(-1)).to({y:-36.5},3,cjs.Ease.get(1)).wait(17));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(83,-109,47,37);


(lib.case_main_hints_mc = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_main_hints();
	this.instance.setTransform(104,15.5,1,1,0,0,0,104,15.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:114},9).to({x:104},10).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,6,314,28);


(lib.c_main_over = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// c_txt.png
	this.instance = new lib.c_txt();
	this.instance.setTransform(334.5,128.5,1,1,0,0,0,136,71);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(2).to({_off:false},0).to({y:143.5,alpha:1},7,cjs.Ease.get(1)).wait(16));

	// C_on_05.png
	this.instance_1 = new lib.c_on_05();
	this.instance_1.setTransform(66.2,58.6,0.352,0.109,0,0,0,77.3,-8.3);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(7).to({_off:false},0).to({regX:77.2,regY:-8.5,scaleX:1,scaleY:1,x:116.2,y:51},5,cjs.Ease.get(-1)).wait(13));

	// C_on_04.png
	this.instance_2 = new lib.c_on_04();
	this.instance_2.setTransform(109.5,132.5,1,1,0,0,0,20.5,15);
	this.instance_2.alpha = 0;
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(10).to({_off:false},0).to({x:92.5,alpha:1},5,cjs.Ease.get(-1)).to({x:96.5},2,cjs.Ease.get(1)).wait(8));

	// C_on_03.png
	this.instance_3 = new lib.c_on_03();
	this.instance_3.setTransform(16.5,114,1,1,0,0,0,16.5,12);
	this.instance_3.alpha = 0;
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(12).to({_off:false},0).to({x:35,y:117.5,alpha:1},5,cjs.Ease.get(-1)).to({x:32},2,cjs.Ease.get(1)).wait(6));

	// C_on_06.png
	this.instance_4 = new lib.c_on_06();
	this.instance_4.setTransform(65,149.8,1,0.091,0,0,0,65,25.2);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(7).to({_off:false},0).to({regY:25,scaleY:1.12,y:124},5,cjs.Ease.get(-1)).to({scaleY:1,y:127},2,cjs.Ease.get(1)).wait(11));

	// C_on_02.png
	this.instance_5 = new lib.c_on_02();
	this.instance_5.setTransform(51.8,49.6,0.393,0.393,0,0,0,21,10.5);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(9).to({_off:false},0).to({scaleX:1,scaleY:1,x:73.5,y:46.5},5,cjs.Ease.get(-1)).to({x:69.5},2,cjs.Ease.get(1)).wait(9));

	// C_on_01.png
	this.instance_6 = new lib.c_on_01();
	this.instance_6.setTransform(49.7,60.6,0.393,0.393,0,0,0,15.6,10.1);
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(7).to({_off:false},0).to({regX:15.5,regY:10,scaleX:1,scaleY:1,x:66,y:76.5},5,cjs.Ease.get(-1)).to({x:64,y:74.5},2,cjs.Ease.get(1)).wait(11));

	// C3.png
	this.instance_7 = new lib.c3_m();
	this.instance_7.setTransform(68.5,103.5,1,1,0,0,0,48.5,41.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(7).to({rotation:-12.5,x:67.5,y:87},5,cjs.Ease.get(1)).wait(13));

	// C2.png
	this.instance_8 = new lib.c2_m();
	this.instance_8.setTransform(96.5,65,1,1,0,0,0,20.5,37);

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(25));

	// C1.png
	this.instance_9 = new lib.c1_m();
	this.instance_9.setTransform(32.5,59.5,1,1,0,0,0,32.5,73.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_9).wait(25));

	// Layer 10
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s("#5F5D5F").ss(1,1,1).dr(-218.5,-166.5,437,333);
	this.shape.setTransform(-74.8,156);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(25));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-294.3,-14,439,337.5);


(lib.c_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// C3.png
	this.instance = new lib.c3_m();
	this.instance.setTransform(68.5,196.5,1,1,0,0,0,48.5,41.5);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({y:100.5,alpha:1},7,cjs.Ease.get(-1)).to({y:103.5},3,cjs.Ease.get(1)).wait(14));

	// C2.png
	this.instance_1 = new lib.c2_m();
	this.instance_1.setTransform(96.5,-70,1,1,0,0,0,20.5,37);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(2).to({_off:false},0).to({y:69,alpha:1},7,cjs.Ease.get(-1)).to({y:65},3,cjs.Ease.get(1)).wait(13));

	// C1.png
	this.instance_2 = new lib.c1_m();
	this.instance_2.setTransform(185.5,59.5,1,1,0,0,0,32.5,73.5);
	this.instance_2.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).to({x:30.5,alpha:1},7,cjs.Ease.get(-1)).to({x:32.5},3,cjs.Ease.get(1)).wait(15));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(153,-14,65,147);


(lib.b_main_over = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// B_on_tx.png
	this.instance = new lib.b_on_txt();
	this.instance.setTransform(436.5,47,1,1,0,0,0,141.5,74);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({y:68,alpha:1},7,cjs.Ease.get(1)).wait(17));

	// B_on_05.png
	this.instance_1 = new lib.B_on_05_1();
	this.instance_1.setTransform(33.5,7.5,1,1,0,0,0,65.5,84.5);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(11).to({_off:false},0).to({y:-18.5,alpha:1},4).to({y:-12.5},2).wait(8));

	// B_on_04.png
	this.instance_2 = new lib.B_on_04_1();
	this.instance_2.setTransform(61,-14,1,0.213,0,0,0,17,23.5);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(8).to({_off:false},0).to({regY:23.6,scaleY:1.13,y:-35.4},4).to({regY:23.5,scaleY:1,y:-32.5},2).wait(11));

	// B_on_03.png
	this.instance_3 = new lib.B_on_03_1();
	this.instance_3.setTransform(13,-2.5,1,0.363,0,0,0,13,18.1);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(9).to({_off:false},0).to({regY:18,scaleY:1.17,y:-17},4).to({scaleY:1,y:-14},2).wait(10));

	// B_on_01.png
	this.instance_4 = new lib.B_on_01_1();
	this.instance_4.setTransform(70,54,1,0.443,0,0,0,13,17.9);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(9).to({_off:false},0).to({regY:18,scaleY:1.17,y:41},4).to({scaleY:1,y:44},2).wait(10));

	// B_on_02.png
	this.instance_5 = new lib.B_on_02_1();
	this.instance_5.setTransform(43.9,38,1,1,5.7,0,0,37,26.6);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(9).to({_off:false},0).to({regY:26.4,rotation:-4.5,x:39.1,y:44.4},3).to({regY:26.5,rotation:0,x:41,y:41.5},2).wait(11));

	// B6.png
	this.instance_6 = new lib.b6_m();
	this.instance_6.setTransform(41.5,36,1,1,0,0,0,21.5,32);

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(4).to({rotation:-82.7},4).to({_off:true},1).wait(16));

	// B5.png
	this.instance_7 = new lib.b5_m();
	this.instance_7.setTransform(41.5,-16.5,1,1,0,0,0,35.5,18.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(25));

	// B4.png
	this.instance_8 = new lib.b4_m();
	this.instance_8.setTransform(48,23,1,1,0,0,0,42,23);

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(25));

	// B3.png
	this.instance_9 = new lib.b3_m();
	this.instance_9.setTransform(42,-60,1,1,0,0,0,36,11);

	this.timeline.addTween(cjs.Tween.get(this.instance_9).wait(25));

	// B2.png
	this.instance_10 = new lib.b2_m();
	this.instance_10.setTransform(39.5,-43.5,1,1,0,0,0,38.5,5.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_10).wait(25));

	// dim
	this.shape = new cjs.Shape();
	this.shape.graphics.f().s("#5F5D5F").ss(1,1,1).p("Egh+gZ6MBD9AAAMAAAAz1MhD9AAAg");
	this.shape.setTransform(22.6,80);

	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("rgba(0,0,0,0.498)").s().p("Egh9AZ7MAAAgz1MBD7AAAMAAAAz1gAlsgmIQZAAIAA5AIwZAAg");
	this.shape_1.setTransform(22.6,80);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape_1},{t:this.shape}]}).wait(25));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-195.9,-87,437,334);


(lib.b_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// B6.png
	this.instance = new lib.b6_m();
	this.instance.setTransform(41.5,-125,1,1,0,0,0,21.5,32);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(5).to({_off:false},0).to({y:33,alpha:1},6).to({y:36},3).wait(11));

	// B5.png
	this.instance_1 = new lib.b5_m();
	this.instance_1.setTransform(41.5,124.5,1,1,0,0,0,35.5,18.5);
	this.instance_1.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).to({y:-13.5,alpha:1},6).to({y:-16.5},3).wait(16));

	// B4.png
	this.instance_2 = new lib.b4_m();
	this.instance_2.setTransform(48,110,1,1,0,0,0,42,23);
	this.instance_2.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).to({y:27,alpha:1},6).to({y:23},3).wait(16));

	// B3.png
	this.instance_3 = new lib.b3_m();
	this.instance_3.setTransform(41,-194,1,1,0,0,0,36,11);
	this.instance_3.alpha = 0;
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(1).to({_off:false},0).to({x:42,y:-56,alpha:1},6).to({y:-60},3).wait(15));

	// B2.png
	this.instance_4 = new lib.b2_m();
	this.instance_4.setTransform(38.5,-177.5,1,1,0,0,0,38.5,5.5);
	this.instance_4.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).to({x:39.5,y:-39.5,alpha:1},6).to({y:-43.5},3).wait(16));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-183,90,326);


(lib.A_on_02_1 = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.A_on_02_gx();
	this.instance.setTransform(26,24,1,1,0,0,0,26,24);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({y:30},5).to({y:24},6).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,52,48);


(lib.A_main_over = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// Layer 11
	this.instance = new lib.A_txt();
	this.instance.setTransform(613.3,75.5,1,1,0,0,0,141.5,71);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({y:80.5,alpha:1},4).wait(20));

	// A_on_01.png
	this.instance_1 = new lib.Aon_01();
	this.instance_1.setTransform(60.5,58,1,1,0,0,0,71.5,46);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(9).to({_off:false},0).to({x:65.5,alpha:1},4).wait(12));

	// A_on_04.png
	this.instance_2 = new lib.A_on_04_1();
	this.instance_2.setTransform(36,25.9,1,1,0,0,0,32.5,38);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(9).to({_off:false},0).wait(16));

	// A_on_07.png
	this.instance_3 = new lib.A_on_07_1();
	this.instance_3.setTransform(89.8,31.5,1,1,0,0,0,27,27);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(11).to({_off:false},0).wait(14));

	// A_on_06.png
	this.instance_4 = new lib.A_on_06_1();
	this.instance_4.setTransform(134.8,30.9,1,1,0,0,0,18,36);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(9).to({_off:false},0).wait(16));

	// A_on_02.png
	this.instance_5 = new lib.A_on_02_1();
	this.instance_5.setTransform(111,-31.6,1,1,0,0,0,26,24);
	this.instance_5.alpha = 0;
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(9).to({_off:false},0).to({scaleX:1.35,scaleY:1.35,x:97,y:-45.8,alpha:1},4,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,x:101,y:-41.8},3,cjs.Ease.get(1)).wait(9));

	// A_on_05.png
	this.instance_6 = new lib.A_on_05_1();
	this.instance_6.setTransform(70,-34.6,1,1,0,0,0,33,24);
	this.instance_6.alpha = 0;
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(9).to({_off:false},0).to({y:-31.6,alpha:1},4).wait(12));

	// A_on_03.png
	this.instance_7 = new lib.A_on_03_1();
	this.instance_7.setTransform(133.8,-25.1,1,1,0,0,0,18,20);
	this.instance_7.alpha = 0;
	this.instance_7._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(9).to({_off:false},0).to({alpha:1},2).to({alpha:0},2).to({alpha:1},2).to({alpha:0},2).to({alpha:1},2).wait(6));

	// A5.png
	this.instance_8 = new lib.A5_m();
	this.instance_8.setTransform(66,49.8,1,1,0,0,0,72.5,38);

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(4).to({x:68,alpha:0},4).to({_off:true},1).wait(16));

	// A6.png
	this.instance_9 = new lib.A6_m();
	this.instance_9.setTransform(70,-32.3,1,1,0,0,0,31.5,23);

	this.timeline.addTween(cjs.Tween.get(this.instance_9).wait(3).to({y:-27.3,alpha:0},5).to({_off:true},1).wait(16));

	// A4.png
	this.instance_10 = new lib.A4_m();
	this.instance_10.setTransform(134.3,-25.6,1,1,0,0,0,17.5,20);

	this.timeline.addTween(cjs.Tween.get(this.instance_10).to({y:-23.6},3,cjs.Ease.get(-1)).to({y:-29.6,alpha:0},5,cjs.Ease.get(1)).to({_off:true},1).wait(16));

	// A3.png
	this.instance_11 = new lib.A3_m();
	this.instance_11.setTransform(89.8,29.4,1,1,0,0,0,27,27);

	this.timeline.addTween(cjs.Tween.get(this.instance_11).wait(10).to({_off:true},1).wait(14));

	// A2.png
	this.instance_12 = new lib.A2_m();
	this.instance_12.setTransform(134.3,29.4,1,1,0,0,0,17.5,34.5);

	this.timeline.addTween(cjs.Tween.get(this.instance_12).wait(8).to({_off:true},1).wait(16));

	// A1.png
	this.instance_13 = new lib.A1_m();
	this.instance_13.setTransform(19.4,16.9,1,1,0,0,0,12.5,47);

	this.timeline.addTween(cjs.Tween.get(this.instance_13).wait(4).to({rotation:22,x:36.1,y:25},4).to({_off:true},1).wait(16));

	// Layer 10
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s().p("Egh+AZ2MAAAgzrMBD8AAAMAAAAzrgA/agzIYYAAIAA42I4YAAg");
	this.shape.setTransform(196,99.7);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(25));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-21.5,-65.8,435,331);


(lib.A_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_24 = function() {
		stop();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(24).call(this.frame_24).wait(1));

	// A5.png
	this.instance = new lib.A5_m();
	this.instance.setTransform(66,141.8,1,1,0,0,0,72.5,38);
	this.instance.alpha = 0;
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(6).to({_off:false},0).to({y:47.8,alpha:1},6,cjs.Ease.get(-1)).to({y:49.8},3,cjs.Ease.get(1)).wait(10));

	// A6.png
	this.instance_1 = new lib.A6_m();
	this.instance_1.setTransform(70,-39.3,1,1,0,0,0,31.5,23);
	this.instance_1.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).to({y:-30.3,alpha:1},6,cjs.Ease.get(-1)).to({y:-32.3},3,cjs.Ease.get(1)).wait(16));

	// A4.png
	this.instance_2 = new lib.A4_m();
	this.instance_2.setTransform(134.3,-49.6,1,1,0,0,0,17.5,20);
	this.instance_2.alpha = 0;
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(8).to({_off:false},0).to({y:-23.6,alpha:1},6,cjs.Ease.get(-1)).to({y:-25.6},3,cjs.Ease.get(1)).wait(8));

	// A3.png
	this.instance_3 = new lib.A3_m();
	this.instance_3.setTransform(89.8,104.4,1,1,0,0,0,27,27);
	this.instance_3.alpha = 0;
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(1).to({_off:false},0).to({y:27.4,alpha:1},6,cjs.Ease.get(-1)).to({y:29.4},3,cjs.Ease.get(1)).wait(15));

	// A2.png
	this.instance_4 = new lib.A2_m();
	this.instance_4.setTransform(134.3,104.4,1,1,0,0,0,17.5,34.5);
	this.instance_4.alpha = 0;
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(2).to({_off:false},0).to({y:27.4,alpha:1},6,cjs.Ease.get(-1)).to({y:29.4},3,cjs.Ease.get(1)).wait(14));

	// A1.png
	this.instance_5 = new lib.A1_m();
	this.instance_5.setTransform(19.4,-7.1,1,1,0,0,0,12.5,47);
	this.instance_5.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).to({y:18.9,alpha:1},6,cjs.Ease.get(-1)).to({y:16.9},3,cjs.Ease.get(1)).wait(16));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(6.9,-62.3,94.6,102.2);


(lib.A_btn = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 2
	this.instance = new lib.main_hints();
	this.instance.setTransform(14,9,1,1,0,0,0,14,14);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({_off:true},1).wait(3));

	// Layer 1
	this.instance_1 = new lib.A_main("synched",24,false);
	this.instance_1.setTransform(79,102.3,1,1,0,0,0,72.5,47);

	this.instance_2 = new lib.A_main_over();
	this.instance_2.setTransform(79,102.3,1,1,0,0,0,72.5,47);

	this.shape = new cjs.Shape();
	this.shape.graphics.f().s("#5F5D5F").ss(1,1,1).p("AsasUIY1AAIAAYqI41AAg");
	this.shape.setTransform(79.9,68.7);

	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("rgba(0,0,0,0.498)").s().p("AsZMVIAA4pIY0AAIAAYpg");
	this.shape_1.setTransform(79.9,68.7);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_1}]}).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.shape_1},{t:this.shape}]},2).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-5,158.3,148.1);


(lib.e_main_btn = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 2
	this.instance = new lib.main_hints();
	this.instance.setTransform(8,14,1,1,0,0,0,14,14);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({_off:true},1).wait(3));

	// Layer 1
	this.instance_1 = new lib.e_main("synched",24,false);
	this.instance_1.setTransform(65.5,84,1,1,0,0,0,68.5,54);

	this.instance_2 = new lib.e_main_over();
	this.instance_2.setTransform(65.5,84,1,1,0,0,0,68.5,54);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s("#5F5D5F").ss(1,1,1).dr(-109.5,-78,219,156);
	this.shape.setTransform(100,77);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_1}]}).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.shape}]},2).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-6,0,213,150);


(lib.d_main_btn = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 2
	this.instance = new lib.main_hints();
	this.instance.setTransform(14,20,1,1,0,0,0,14,14);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({_off:true},1).wait(3));

	// Layer 1
	this.instance_1 = new lib.d_main("synched",24,false);
	this.instance_1.setTransform(68.5,106.5,1,1,0,0,0,67.5,51.5);

	this.instance_2 = new lib.d_main_over();
	this.instance_2.setTransform(68.5,106.5,1,1,0,0,0,67.5,51.5);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s("#5F5D5F").ss(1,1,1).dr(-88,-79,176,158);
	this.shape.setTransform(89.1,78.6,0.997,0.997);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_1}]}).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.shape}]},2).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,178,146);


(lib.c_main_btn = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 2
	this.instance = new lib.main_hints();
	this.instance.setTransform(111,23.5,1,1,0,0,0,14,14);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({_off:true},1).wait(3));

	// Layer 1
	this.instance_1 = new lib.c_main("synched",24,false);
	this.instance_1.setTransform(48.5,87.5,1,1,0,0,0,48.5,73.5);

	this.instance_2 = new lib.c_main_over();
	this.instance_2.setTransform(48.5,87.5,1,1,0,0,0,48.5,73.5);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s().p("Ap/MzIAA5lIT+AAIAAZlg");
	this.shape.setTransform(62.7,84.5);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_1}]}).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.shape}]},2).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,125,159);


(lib.b_main_btn = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// Layer 2
	this.instance = new lib.main_hints();
	this.instance.setTransform(-2,2.5,1,1,0,0,0,14,14);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({_off:true},1).wait(3));

	// Layer 1
	this.instance_1 = new lib.b_main("synched",24,false);
	this.instance_1.setTransform(41,103,1,1,0,0,0,42,32);

	this.instance_2 = new lib.b_main_over();
	this.instance_2.setTransform(41,103,1,1,0,0,0,42,32);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(0,0,0,0.498)").s().p("An4MfIAA49IPwAAIAAY9g");
	this.shape.setTransform(38.6,67);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_1}]}).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.shape}]},2).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-16,-11.5,105,150.6);


// stage content:



(lib.home_case_v2_en = function(mode,startPosition,loop) {
if (loop == null) { loop = false; }	this.initialize(mode,startPosition,loop,{});

	// A_main
	this.instance = new lib.A_main("synched",0,false);
	this.instance.setTransform(130.6,247.6,1,1,0,0,0,72.5,47);

	this.instance_1 = new lib.A_btn();
	this.instance_1.setTransform(130.8,216.8,1,1,0,0,0,79.2,71.5);
	new cjs.ButtonHelper(this.instance_1, 0, 1, 2, false, new lib.A_btn(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.instance}]},23).to({state:[{t:this.instance_1}]},21).wait(106));

	// E_main
	this.instance_2 = new lib.e_main("synched",0,false);
	this.instance_2.setTransform(314,388,1,1,0,0,0,68.5,54);

	this.instance_3 = new lib.e_main_btn();
	this.instance_3.setTransform(352,379,1,1,0,0,0,103.5,75);
	new cjs.ButtonHelper(this.instance_3, 0, 1, 2, false, new lib.e_main_btn(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.instance_2}]},23).to({state:[{t:this.instance_3}]},21).wait(106));

	// D_main
	this.instance_4 = new lib.d_main("synched",0,false);
	this.instance_4.setTransform(119.1,407.6,1,1,0,0,0,67.5,51.5);

	this.instance_5 = new lib.d_main_btn();
	this.instance_5.setTransform(139.6,374.1,1,1,0,0,0,89,73);
	new cjs.ButtonHelper(this.instance_5, 0, 1, 2, false, new lib.d_main_btn(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.instance_4}]},23).to({state:[{t:this.instance_5}]},21).wait(106));

	// C_main
	this.instance_6 = new lib.c_main("synched",0,false);
	this.instance_6.setTransform(376.8,217,1,1,0,0,0,48.5,73.5);

	this.instance_7 = new lib.c_main_btn();
	this.instance_7.setTransform(386.8,209,1,1,0,0,0,58.5,79.5);
	new cjs.ButtonHelper(this.instance_7, 0, 1, 2, false, new lib.c_main_btn(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.instance_6}]},23).to({state:[{t:this.instance_7}]},21).wait(106));

	// B_main
	this.instance_8 = new lib.b_main("synched",0,false);
	this.instance_8.setTransform(269.9,252,1,1,0,0,0,42,32);

	this.instance_9 = new lib.b_main_btn();
	this.instance_9.setTransform(273.4,218.5,1,1,0,0,0,44.5,69.5);
	new cjs.ButtonHelper(this.instance_9, 0, 1, 2, false, new lib.b_main_btn(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.instance_8}]},23).to({state:[{t:this.instance_9}]},21).wait(106));

	// Layer 4
	this.instance_10 = new lib.case_main_hints_mc();
	this.instance_10.setTransform(653,292.5,1,1,0,0,0,104,15.5);
	this.instance_10.alpha = 0;
	this.instance_10._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_10).wait(9).to({_off:false},0).to({y:282.5,alpha:1},6).wait(135));

	// D_bg.png
	this.instance_11 = new lib.D_bg_1();
	this.instance_11.setTransform(138.9,380.6,1,1,0,0,0,89,78.5);
	this.instance_11.alpha = 0;
	this.instance_11._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_11).wait(23).to({_off:false},0).to({alpha:1},6,cjs.Ease.get(-1)).wait(121));

	// E_bg.png
	this.instance_12 = new lib.E_bg_1();
	this.instance_12.setTransform(347.7,381.5,1,1,0,0,0,109,79);
	this.instance_12.alpha = 0;
	this.instance_12._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_12).wait(22).to({_off:false},0).to({alpha:1},6,cjs.Ease.get(-1)).wait(122));

	// C_bg.png
	this.instance_13 = new lib.C_bg_1();
	this.instance_13.setTransform(391.8,214.3,1,1,0,0,0,63.5,81.5);
	this.instance_13.alpha = 0;
	this.instance_13._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_13).wait(21).to({_off:false},0).to({alpha:1},6,cjs.Ease.get(-1)).wait(123));

	// B1.png
	this.instance_14 = new lib.b_bg();
	this.instance_14.setTransform(267.5,215.5,1,1,0,0,0,51.5,80.5);
	this.instance_14.alpha = 0;
	this.instance_14._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_14).wait(20).to({_off:false},0).to({alpha:1},6,cjs.Ease.get(-1)).wait(124));

	// A_bg.png
	this.instance_15 = new lib.A_bg_1();
	this.instance_15.setTransform(130.8,215.1,1,1,0,0,0,79.5,79.5);
	this.instance_15.alpha = 0;
	this.instance_15._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_15).wait(19).to({_off:false},0).to({alpha:1},6,cjs.Ease.get(-1)).wait(125));

	// case_building_c.png
	this.instance_16 = new lib.Tween4("synched",0);
	this.instance_16.setTransform(254,-118.8);

	this.timeline.addTween(cjs.Tween.get(this.instance_16).to({y:602.1},9,cjs.Ease.get(-1)).to({y:578.1},4,cjs.Ease.get(1)).to({y:588.1},3,cjs.Ease.get(-1)).to({y:578.1},3,cjs.Ease.get(1)).wait(131));

	// case_building.png
	this.instance_17 = new lib.Tween6("synched",0);
	this.instance_17.setTransform(254,-618.4);

	this.timeline.addTween(cjs.Tween.get(this.instance_17).to({y:102.5},9,cjs.Ease.get(-1)).to({y:78.5},4,cjs.Ease.get(1)).to({y:88.5},3,cjs.Ease.get(-1)).to({y:78.5},3,cjs.Ease.get(1)).wait(131));

	// case_building_b.png
	this.instance_18 = new lib.Tween8("synched",0);
	this.instance_18.setTransform(254,-400.8);

	this.timeline.addTween(cjs.Tween.get(this.instance_18).to({y:320.1},9,cjs.Ease.get(-1)).to({y:296.1},4,cjs.Ease.get(1)).to({y:306.1},3,cjs.Ease.get(-1)).to({y:296.1},3,cjs.Ease.get(1)).wait(131));

	// blue
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#24484F").s().p("Egn/AqMMAAAhUXMBP/AAAMAAABUXg");
	this.shape.setTransform(768,270);

	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#24484F").s().p("AszAAIMzszIM0MzIs0M0g");
	this.shape_1.setTransform(568.1,286.1);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape_1},{t:this.shape}]}).wait(150));

	// yellow
	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FCB714").s().p("EhP/AqMMAAAhUXMCf/AAAMAAABUXg");
	this.shape_2.setTransform(512,270);

	this.timeline.addTween(cjs.Tween.get(this.shape_2).wait(150));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(512,-407,1024,1231.1);

})(lib = lib||{}, images = images||{}, createjs = createjs||{}, ss = ss||{});
var lib, images, createjs, ss;