(function (lib, img, cjs, ss) {

var p; // shortcut to reference prototypes
lib.webFontTxtFilters = {}; 

// library properties:
lib.properties = {
	width: 1024,
	height: 480,
	fps: 24,
	color: "#90D3DD",
	webfonts: {},
	manifest: [
		{src:window.eh_caseAniImgPath + "/case01_bomb_01.png", id:"case01_bomb_01"},
		{src:window.eh_caseAniImgPath + "/case01_bomb_02.png", id:"case01_bomb_02"},
		{src:window.eh_caseAniImgPath + "/case01_bottom.png", id:"case01_bottom"},
		{src:window.eh_caseAniImgPath + "/case01_build.png", id:"case01_build"},
		{src:window.eh_caseAniImgPath + "/case01_cloud.png", id:"case01_cloud"},
		{src:window.eh_caseAniImgPath + "/case01_txt_v2.png", id:"case01_txt_v2"},
		{src:window.eh_caseAniImgPath + "/case01_window_01.png", id:"case01_window_01"},
		{src:window.eh_caseAniImgPath + "/case01_window_02.png", id:"case01_window_02"},
		{src:window.eh_caseAniImgPath + "/case01_window_03.png", id:"case01_window_03"},
		{src:window.eh_caseAniImgPath + "/case02_balloon.png", id:"case02_balloon"},
		{src:window.eh_caseAniImgPath + "/case02_bottom.png", id:"case02_bottom"},
		{src:window.eh_caseAniImgPath + "/case02_build.png", id:"case02_build"},
		{src:window.eh_caseAniImgPath + "/case02_hand.png", id:"case02_hand"},
		{src:window.eh_caseAniImgPath + "/case02_ppl.png", id:"case02_ppl"},
		{src:window.eh_caseAniImgPath + "/case02_tree.png", id:"case02_tree"},
		{src:window.eh_caseAniImgPath + "/case03_bottom.png", id:"case03_bottom"},
		{src:window.eh_caseAniImgPath + "/case03_guard.png", id:"case03_guard"},
		{src:window.eh_caseAniImgPath + "/case03_hill.png", id:"case03_hill"},
		{src:window.eh_caseAniImgPath + "/case03_ppl.png", id:"case03_ppl"},
		{src:window.eh_caseAniImgPath + "/case03_pplwithdog.png", id:"case03_pplwithdog"},
		{src:window.eh_caseAniImgPath + "/case04_home.png", id:"case04_home"},
		{src:window.eh_caseAniImgPath + "/case04_ppl01.png", id:"case04_ppl01"},
		{src:window.eh_caseAniImgPath + "/case04_ppl03.png", id:"case04_ppl03"},
		{src:window.eh_caseAniImgPath + "/case04_speaking.png", id:"case04_speaking"},
		{src:window.eh_caseAniImgPath + "/case04_waterdrop.png", id:"case04_waterdrop"},
		{src:window.eh_caseAniImgPath + "/case05_bottom.png", id:"case05_bottom"},
		{src:window.eh_caseAniImgPath + "/case05_broken_A.png", id:"case05_broken_A"},
		{src:window.eh_caseAniImgPath + "/case05_broken_B.png", id:"case05_broken_B"},
		{src:window.eh_caseAniImgPath + "/case05_img01.png", id:"case05_img01"},
		{src:window.eh_caseAniImgPath + "/case05_img02.png", id:"case05_img02"},
		{src:window.eh_caseAniImgPath + "/case05_paint_v2.jpg", id:"case05_paint_v2"},
		{src:window.eh_caseAniImgPath + "/case05_wall.png", id:"case05_wall"},
		{src:window.eh_caseAniImgPath + "/case_txt_02.png", id:"case_txt_02"},
		{src:window.eh_caseAniImgPath + "/case_txt_03.png", id:"case_txt_03"},
		{src:window.eh_caseAniImgPath + "/case_txt_04.png", id:"case_txt_04"},
		{src:window.eh_caseAniImgPath + "/case_txt_05.png", id:"case_txt_05"},
		{src:window.eh_caseAniImgPath + "/main_txt_02.png", id:"en_txt_tab_02"},
		{src:window.eh_caseAniImgPath + "/main_txt_01.png", id:"main_txt_01"},
		{src:window.eh_caseAniImgPath + "/main_txt_02.png", id:"main_txt_02"},
		{src:window.eh_caseAniImgPath + "/main_txt_03_v2.png", id:"main_txt_03_v2"},
		{src:window.eh_caseAniImgPath + "/main_txt_04_v2.png", id:"main_txt_04_v2"},
		{src:window.eh_caseAniImgPath + "/main_txt_05.png", id:"main_txt_05"}
	]
};



lib.webfontAvailable = function(family) { 
	lib.properties.webfonts[family] = true;
	var txtFilters = lib.webFontTxtFilters && lib.webFontTxtFilters[family] || [];
	for(var f = 0; f < txtFilters.length; ++f) {
		txtFilters[f].updateCache();
	}
};
// symbols:



(lib.case01_bomb_01 = function() {
	this.initialize(img.case01_bomb_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,175,156);


(lib.case01_bomb_02 = function() {
	this.initialize(img.case01_bomb_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,231,184);


(lib.case01_bottom = function() {
	this.initialize(img.case01_bottom);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case01_build = function() {
	this.initialize(img.case01_build);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,190,240);


(lib.case01_cloud = function() {
	this.initialize(img.case01_cloud);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,96,65);


(lib.case01_txt_v2 = function() {
	this.initialize(img.case01_txt_v2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,696,36);


(lib.case01_window_01 = function() {
	this.initialize(img.case01_window_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,234,141);


(lib.case01_window_02 = function() {
	this.initialize(img.case01_window_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,256,176);


(lib.case01_window_03 = function() {
	this.initialize(img.case01_window_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,65,90);


(lib.case02_balloon = function() {
	this.initialize(img.case02_balloon);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,118,172);


(lib.case02_bottom = function() {
	this.initialize(img.case02_bottom);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case02_build = function() {
	this.initialize(img.case02_build);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,206,222);


(lib.case02_hand = function() {
	this.initialize(img.case02_hand);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,291,337);


(lib.case02_ppl = function() {
	this.initialize(img.case02_ppl);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,403,340);


(lib.case02_tree = function() {
	this.initialize(img.case02_tree);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,71,157);


(lib.case03_bottom = function() {
	this.initialize(img.case03_bottom);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case03_guard = function() {
	this.initialize(img.case03_guard);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,181,49);


(lib.case03_hill = function() {
	this.initialize(img.case03_hill);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,270,213);


(lib.case03_ppl = function() {
	this.initialize(img.case03_ppl);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,388,453);


(lib.case03_pplwithdog = function() {
	this.initialize(img.case03_pplwithdog);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,208,319);


(lib.case04_home = function() {
	this.initialize(img.case04_home);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,340,457);


(lib.case04_ppl01 = function() {
	this.initialize(img.case04_ppl01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,97,74);


(lib.case04_ppl03 = function() {
	this.initialize(img.case04_ppl03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,81,159);


(lib.case04_speaking = function() {
	this.initialize(img.case04_speaking);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,38,37);


(lib.case04_waterdrop = function() {
	this.initialize(img.case04_waterdrop);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,16,36);


(lib.case05_bottom = function() {
	this.initialize(img.case05_bottom);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case05_broken_A = function() {
	this.initialize(img.case05_broken_A);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,198,192);


(lib.case05_broken_B = function() {
	this.initialize(img.case05_broken_B);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,210,191);


(lib.case05_img01 = function() {
	this.initialize(img.case05_img01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,183,77);


(lib.case05_img02 = function() {
	this.initialize(img.case05_img02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,107,233);


(lib.case05_paint_v2 = function() {
	this.initialize(img.case05_paint_v2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,124,134);


(lib.case05_wall = function() {
	this.initialize(img.case05_wall);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,376,244);


(lib.case_txt_02 = function() {
	this.initialize(img.case_txt_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,568,36);


(lib.case_txt_03 = function() {
	this.initialize(img.case_txt_03);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,636,16);


(lib.case_txt_04 = function() {
	this.initialize(img.case_txt_04);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,518,36);


(lib.case_txt_05 = function() {
	this.initialize(img.case_txt_05);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,609,37);


(lib.en_txt_tab_02 = function() {
	this.initialize(img.en_txt_tab_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,131,44);


(lib.main_txt_01 = function() {
	this.initialize(img.main_txt_01);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,136,20);


(lib.main_txt_02 = function() {
	this.initialize(img.main_txt_02);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,131,44);


(lib.main_txt_03_v2 = function() {
	this.initialize(img.main_txt_03_v2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,216,44);


(lib.main_txt_04_v2 = function() {
	this.initialize(img.main_txt_04_v2);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,138,44);


(lib.main_txt_05 = function() {
	this.initialize(img.main_txt_05);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,192,44);


(lib.main_txt_05_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.main_txt_05();
	this.instance.setTransform(0,-13);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-13,192,44);


(lib.main_txt_04 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.main_txt_04_v2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,138,44);


(lib.main_txt_03 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.main_txt_03_v2();
	this.instance.setTransform(2,-11.2);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(2,-11.2,216,44);


(lib.main_txt_02_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.en_txt_tab_02();
	this.instance.setTransform(0,-1);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-1,131,44);


(lib.main_txt_01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.main_txt_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,136,20);


(lib.case05_wall_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_wall();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,376,244);


(lib.case05_paint = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_paint_v2();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,124,134);


(lib.case05_img02_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_img02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,107,233);


(lib.case05_img01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_img01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,183,77);


(lib.case05_broken_B_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_broken_B();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,210,191);


(lib.case05_broken_A_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_broken_A();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,198,192);


(lib.case05_bottom_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case05_bottom();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case04_waterdrop_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_waterdrop();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,16,36);


(lib.case04_speak = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_speaking();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,38,37);


(lib.case04_ppl03_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_ppl03();
	this.instance.setTransform(-4.2,18.3);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-4.2,18.3,81,159);


(lib.case04_ppl01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_ppl01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,97,74);


(lib.case04_home_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_home();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,340,457);


(lib.case03_pplwithdog_mc = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_pplwithdog();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,208,319);


(lib.case03_ppl_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_ppl();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,388,453);


(lib.case03_hill_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_hill();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,270,213);


(lib.case03_guard_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_guard();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,181,49);


(lib.case03_bottom_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_bottom();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case02_tree_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_tree();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,71,157);


(lib.case02_ppl_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_ppl();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,403,340);


(lib.case02_hand_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_hand();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,291,337);


(lib.case02_build_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_build();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,206,222);


(lib.case02_bottom_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_bottom();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case02_balloon_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case02_balloon();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,118,172);


(lib.case01_window_03_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_window_03();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,65,90);


(lib.case01_window_02_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_window_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,256,176);


(lib.case01_window_01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_window_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,234,141);


(lib.case01_txt = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_txt_v2();
	this.instance.setTransform(-55,0);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-55,0,696,36);


(lib.case01_cloud_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_cloud();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,96,65);


(lib.case01_build_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_build();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,190,240);


(lib.case01_bottom_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_bottom();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,539,242);


(lib.case01_bomb_02_v2 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_bomb_02();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,231,184);


(lib.case01_bomb_01_v2 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_bomb_01();

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,175,156);


(lib.case_05_txt_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_txt_05();
	this.instance.setTransform(74.5,0);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FCB714").s().p("Eg6BAGzIAAtlMB0DAAAIAANlg");
	this.shape.setTransform(382,15.2,1.028,0.928);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-25.2,764,80.8);


(lib.case_04_txt_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_txt_04();
	this.instance.setTransform(113,0.5);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FCB714").s().p("Eg6BAGzIAAtlMB0DAAAIAANlg");
	this.shape.setTransform(382,15.6,1.028,0.918);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-24.3,764,79.9);


(lib.case_03_txt_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_txt_03();
	this.instance.setTransform(62,14.5);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FCB714").s().p("Eg6BAGzIAAtlMB0DAAAIAANlg");
	this.shape.setTransform(382,15.2,1.028,0.928);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-25.2,764,80.8);


(lib.case_02_txt_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case_txt_02();
	this.instance.setTransform(101,0);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FCB714").s().p("Eg6BAGzIAAtlMB0DAAAIAANlg");
	this.shape.setTransform(382,15.2,1.028,0.928);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-25.2,764,80.8);


(lib.case04_water_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// case04_waterdrop
	this.instance = new lib.case04_waterdrop_1();
	this.instance.setTransform(22,-4.6,0.735,0.735,0,0,0,8.1,18.1);
	this.instance.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance).to({y:49.3,alpha:1},9).to({y:119.7},9,cjs.Ease.get(-1)).to({regY:18,scaleY:0.21,y:134.7,alpha:0},7,cjs.Ease.get(1)).wait(1));

	// case04_waterdrop
	this.instance_1 = new lib.case04_waterdrop_1();
	this.instance_1.setTransform(8,-9.5,1,1,0,0,0,8,18);
	this.instance_1.alpha = 0;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).to({y:18,alpha:1},9).to({y:107.7},9,cjs.Ease.get(-1)).to({scaleY:0.28,y:139.9,alpha:0},7,cjs.Ease.get(1)).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-27.5,27.8,36);


(lib.case04_speak_mc = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case04_speak();
	this.instance.setTransform(38,37,1,1,0,0,0,38,37);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({scaleX:1.09,scaleY:1.09},9).to({scaleX:1,scaleY:1},9).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,38,37);


(lib.case03_pplwithdog_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case03_pplwithdog_mc();
	this.instance.setTransform(104,159.5,1,1,0,0,0,104,159.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({rotation:1,x:104.1,y:159.6},5).to({rotation:-3.2,x:104,y:159.5},4).to({rotation:1,x:104.1,y:159.6},5).to({rotation:0,x:104,y:159.5},5).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,208,319);


(lib.case01_bomb_02_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_bomb_02_v2();
	this.instance.setTransform(115.5,92,1,1,0,0,0,115.5,92);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({scaleX:1.11,scaleY:1.11,rotation:-4.2},10).to({scaleX:1,scaleY:1,rotation:0},10).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,231,184);


(lib.case01_bomb_01_1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_bomb_01_v2();
	this.instance.setTransform(87.5,78,1,1,0,0,0,87.5,78);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({rotation:10.4},9).to({rotation:0},10).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,175,156);


(lib.case_01_txt_main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Layer 1
	this.instance = new lib.case01_txt();
	this.instance.setTransform(381,17.5,1,1,0,0,0,290.5,17.5);

	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FCB714").s().dr(-371.5,-43.5,743,87);
	this.shape.setTransform(382,15.2,1.028,0.928);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.shape},{t:this.instance}]}).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,-25.2,764,80.8);


(lib.btnCaseE = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{transIn:1,transOut:14});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_13 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.startTransInBtn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(13).call(this.frame_13).wait(16).call(this.frame_29).wait(1));

	// Layer 2
	this.instance = new lib.main_txt_05_1();
	this.instance.setTransform(64,60.5,1,1,0,0,0,39,9);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(30));

	// Layer 3
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#FFFFFF").s().p("Ag8iVIB5CVIh5CWg");
	this.shape.setTransform(10,59.2);

	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_1.setTransform(5,59.2,0.034,1.195);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FFFFFF").s().p("AggJPIAAydIBBAAIAASdg");
	this.shape_2.setTransform(3,59.2);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#FFFFFF").s().p("AgPJPIAAydIAgAAIAASdg");
	this.shape_3.setTransform(1.1,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_1,p:{scaleX:0.034,x:5}},{t:this.shape}]},5).to({state:[{t:this.shape_1,p:{scaleX:0.034,x:5}}]},9).to({state:[{t:this.shape_2}]},1).to({state:[{t:this.shape_3}]},1).to({state:[{t:this.shape_1,p:{scaleX:0,x:-0.9}}]},1).to({state:[]},1).wait(12));

	// Layer 4
	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_4.setTransform(1.8,59.2,0.012,1.195);

	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#FFFFFF").s().p("AlRJPIAAydIKjAAIAASdg");
	this.shape_5.setTransform(33.8,59.2);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#FFFFFF").s().p("AqSJPIAAydIUkAAIAASdg");
	this.shape_6.setTransform(65.9,59.2);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#FFFFFF").s().p("AvSJPIAAydIelAAIAASdg");
	this.shape_7.setTransform(98,59.2);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#FFFFFF").s().p("AvPJPIAAydIefAAIAASdg");
	this.shape_8.setTransform(163.1,59.2);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#FFFFFF").s().p("AqLJPIAAydIUXAAIAASdg");
	this.shape_9.setTransform(196.3,59.2);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#FFFFFF").s().p("AlHJPIAAydIKPAAIAASdg");
	this.shape_10.setTransform(229.3,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_4,p:{scaleX:0.012,x:1.8}}]},1).to({state:[{t:this.shape_5}]},1).to({state:[{t:this.shape_6}]},1).to({state:[{t:this.shape_7}]},1).to({state:[{t:this.shape_4,p:{scaleX:0.884,x:130}}]},1).to({state:[{t:this.shape_8}]},1).to({state:[{t:this.shape_9}]},1).to({state:[{t:this.shape_10}]},1).to({state:[{t:this.shape_4,p:{scaleX:0.003,x:262.5}}]},1).to({state:[]},1).wait(20));

	// Layer 5
	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#24484F").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_11.setTransform(130,59.7,0.884,1.205);

	this.timeline.addTween(cjs.Tween.get(this.shape_11).wait(1).to({scaleY:1.2,y:59.2},0).wait(29));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,260,119.3);


(lib.btnCaseD = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":14});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_13 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.startTransInBtn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(13).call(this.frame_13).wait(16).call(this.frame_29).wait(1));

	// Layer 6
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(255,255,255,0.2)").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape.setTransform(130,117.6,0.884,0.006,0,180,0);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(30));

	// Layer 2
	this.instance = new lib.main_txt_04();
	this.instance.setTransform(65,47.5,1,1,0,0,0,39,9);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(30));

	// Layer 3
	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#FFFFFF").s().p("Ag8iVIB5CVIh5CWg");
	this.shape_1.setTransform(10,59.2);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_2.setTransform(5,59.2,0.034,1.195);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#FFFFFF").s().p("AggJPIAAydIBBAAIAASdg");
	this.shape_3.setTransform(3,59.2);

	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#FFFFFF").s().p("AgPJPIAAydIAgAAIAASdg");
	this.shape_4.setTransform(1.1,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}},{t:this.shape_1}]},5).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}}]},9).to({state:[{t:this.shape_3}]},1).to({state:[{t:this.shape_4}]},1).to({state:[{t:this.shape_2,p:{scaleX:0,x:-0.9}}]},1).to({state:[]},1).wait(12));

	// Layer 4
	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_5.setTransform(1.8,59.2,0.012,1.195);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#FFFFFF").s().p("AlRJPIAAydIKjAAIAASdg");
	this.shape_6.setTransform(33.8,59.2);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#FFFFFF").s().p("AqSJPIAAydIUkAAIAASdg");
	this.shape_7.setTransform(65.9,59.2);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#FFFFFF").s().p("AvSJPIAAydIelAAIAASdg");
	this.shape_8.setTransform(98,59.2);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#FFFFFF").s().p("AvPJPIAAydIefAAIAASdg");
	this.shape_9.setTransform(163.1,59.2);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#FFFFFF").s().p("AqLJPIAAydIUXAAIAASdg");
	this.shape_10.setTransform(196.3,59.2);

	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#FFFFFF").s().p("AlHJPIAAydIKPAAIAASdg");
	this.shape_11.setTransform(229.3,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_5,p:{scaleX:0.012,x:1.8}}]},1).to({state:[{t:this.shape_6}]},1).to({state:[{t:this.shape_7}]},1).to({state:[{t:this.shape_8}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.884,x:130}}]},1).to({state:[{t:this.shape_9}]},1).to({state:[{t:this.shape_10}]},1).to({state:[{t:this.shape_11}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.003,x:262.5}}]},1).to({state:[]},1).wait(20));

	// Layer 5
	this.shape_12 = new cjs.Shape();
	this.shape_12.graphics.f("#24484F").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_12.setTransform(130,59.7,0.884,1.205);

	this.timeline.addTween(cjs.Tween.get(this.shape_12).wait(1).to({scaleY:1.2,y:59.2},0).wait(29));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,260,119.3);


(lib.btnCaseC = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":14});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_13 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.startTransInBtn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(13).call(this.frame_13).wait(16).call(this.frame_29).wait(1));

	// Layer 6
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(255,255,255,0.2)").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape.setTransform(130,118.6,0.884,0.006,0,180,0);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(30));

	// Layer 2
	this.instance = new lib.main_txt_03();
	this.instance.setTransform(61,60.5,1,1,0,0,0,39,9);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(30));

	// Layer 3
	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#FFFFFF").s().p("Ag8iVIB5CVIh5CWg");
	this.shape_1.setTransform(10,59.2);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_2.setTransform(5,59.2,0.034,1.195);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#FFFFFF").s().p("AggJPIAAydIBBAAIAASdg");
	this.shape_3.setTransform(3,59.2);

	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#FFFFFF").s().p("AgPJPIAAydIAgAAIAASdg");
	this.shape_4.setTransform(1.1,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}},{t:this.shape_1}]},5).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}}]},9).to({state:[{t:this.shape_3}]},1).to({state:[{t:this.shape_4}]},1).to({state:[{t:this.shape_2,p:{scaleX:0,x:-0.9}}]},1).to({state:[]},1).wait(12));

	// Layer 4
	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_5.setTransform(1.8,59.2,0.012,1.195);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#FFFFFF").s().p("AlRJPIAAydIKjAAIAASdg");
	this.shape_6.setTransform(33.8,59.2);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#FFFFFF").s().p("AqSJPIAAydIUkAAIAASdg");
	this.shape_7.setTransform(65.9,59.2);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#FFFFFF").s().p("AvSJPIAAydIelAAIAASdg");
	this.shape_8.setTransform(98,59.2);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#FFFFFF").s().p("AvPJPIAAydIefAAIAASdg");
	this.shape_9.setTransform(163.1,59.2);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#FFFFFF").s().p("AqLJPIAAydIUXAAIAASdg");
	this.shape_10.setTransform(196.3,59.2);

	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#FFFFFF").s().p("AlHJPIAAydIKPAAIAASdg");
	this.shape_11.setTransform(229.3,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_5,p:{scaleX:0.012,x:1.8}}]},1).to({state:[{t:this.shape_6}]},1).to({state:[{t:this.shape_7}]},1).to({state:[{t:this.shape_8}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.884,x:130}}]},1).to({state:[{t:this.shape_9}]},1).to({state:[{t:this.shape_10}]},1).to({state:[{t:this.shape_11}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.003,x:262.5}}]},1).to({state:[]},1).wait(20));

	// Layer 5
	this.shape_12 = new cjs.Shape();
	this.shape_12.graphics.f("#24484F").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_12.setTransform(130,59.7,0.884,1.205);

	this.timeline.addTween(cjs.Tween.get(this.shape_12).wait(1).to({scaleY:1.2,y:59.2},0).wait(29));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,260,119.3);


(lib.btnCaseB = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":14});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_13 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.startTransInBtn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(13).call(this.frame_13).wait(16).call(this.frame_29).wait(1));

	// Layer 6
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(255,255,255,0.2)").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape.setTransform(130,118.6,0.884,0.006,0,180,0);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(30));

	// Layer 2
	this.instance = new lib.main_txt_02();
	this.instance.setTransform(25,40.5);

	this.instance_1 = new lib.main_txt_02_1();
	this.instance_1.setTransform(63,49.5,1,1,0,0,0,39,9);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},1).to({state:[{t:this.instance_1}]},4).to({state:[{t:this.instance_1}]},9).to({state:[{t:this.instance_1}]},3).wait(13));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},0).wait(29));

	// Layer 3
	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#FFFFFF").s().p("Ag8iVIB5CVIh5CWg");
	this.shape_1.setTransform(10,59.2);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_2.setTransform(5,59.2,0.034,1.195);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#FFFFFF").s().p("AggJPIAAydIBBAAIAASdg");
	this.shape_3.setTransform(3,59.2);

	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#FFFFFF").s().p("AgPJPIAAydIAgAAIAASdg");
	this.shape_4.setTransform(1.1,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}},{t:this.shape_1}]},5).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}}]},9).to({state:[{t:this.shape_3}]},1).to({state:[{t:this.shape_4}]},1).to({state:[{t:this.shape_2,p:{scaleX:0,x:-0.9}}]},1).to({state:[]},1).wait(12));

	// Layer 4
	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_5.setTransform(1.8,59.2,0.012,1.195);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#FFFFFF").s().p("AlRJPIAAydIKjAAIAASdg");
	this.shape_6.setTransform(33.8,59.2);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#FFFFFF").s().p("AqSJPIAAydIUkAAIAASdg");
	this.shape_7.setTransform(65.9,59.2);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#FFFFFF").s().p("AvSJPIAAydIelAAIAASdg");
	this.shape_8.setTransform(98,59.2);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#FFFFFF").s().p("AvPJPIAAydIefAAIAASdg");
	this.shape_9.setTransform(163.1,59.2);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#FFFFFF").s().p("AqLJPIAAydIUXAAIAASdg");
	this.shape_10.setTransform(196.3,59.2);

	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#FFFFFF").s().p("AlHJPIAAydIKPAAIAASdg");
	this.shape_11.setTransform(229.3,59.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_5,p:{scaleX:0.012,x:1.8}}]},1).to({state:[{t:this.shape_6}]},1).to({state:[{t:this.shape_7}]},1).to({state:[{t:this.shape_8}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.884,x:130}}]},1).to({state:[{t:this.shape_9}]},1).to({state:[{t:this.shape_10}]},1).to({state:[{t:this.shape_11}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.003,x:262.5}}]},1).to({state:[]},1).wait(20));

	// Layer 5
	this.shape_12 = new cjs.Shape();
	this.shape_12.graphics.f("#24484F").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_12.setTransform(130,59.7,0.884,1.205);

	this.timeline.addTween(cjs.Tween.get(this.shape_12).wait(1).to({scaleY:1.2,y:59.2},0).wait(29));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,260,119.3);


(lib.btnCaseA = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":14});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_13 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.startTransInBtn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(13).call(this.frame_13).wait(16).call(this.frame_29).wait(1));

	// Layer 6
	this.shape = new cjs.Shape();
	this.shape.graphics.f("rgba(255,255,255,0.2)").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape.setTransform(130,94.6,0.884,0.006,0,180,0);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(30));

	// Layer 1
	this.instance = new lib.main_txt_01_1();
	this.instance.setTransform(77,49.5,1,1,0,0,0,39,9);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(30));

	// Layer 5
	this.shape_1 = new cjs.Shape();
	this.shape_1.graphics.f("#FFFFFF").s().p("Ag8h5IB5B5Ih5B6g");
	this.shape_1.setTransform(10,48.2);

	this.shape_2 = new cjs.Shape();
	this.shape_2.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_2.setTransform(5,48.2,0.034,0.973);

	this.shape_3 = new cjs.Shape();
	this.shape_3.graphics.f("#FFFFFF").s().p("AggHhIAAvBIBBAAIAAPBg");
	this.shape_3.setTransform(3,48.2);

	this.shape_4 = new cjs.Shape();
	this.shape_4.graphics.f("#FFFFFF").s().p("AgPHhIAAvBIAgAAIAAPBg");
	this.shape_4.setTransform(1.1,48.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}},{t:this.shape_1}]},5).to({state:[{t:this.shape_2,p:{scaleX:0.034,x:5}}]},9).to({state:[{t:this.shape_3}]},1).to({state:[{t:this.shape_4}]},1).to({state:[{t:this.shape_2,p:{scaleX:0,x:-0.9}}]},1).to({state:[]},1).wait(12));

	// Layer 4
	this.shape_5 = new cjs.Shape();
	this.shape_5.graphics.f("#FFFFFF").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_5.setTransform(1.8,48.2,0.012,0.973);

	this.shape_6 = new cjs.Shape();
	this.shape_6.graphics.f("#FFFFFF").s().p("AlRHhIAAvBIKjAAIAAPBg");
	this.shape_6.setTransform(33.8,48.2);

	this.shape_7 = new cjs.Shape();
	this.shape_7.graphics.f("#FFFFFF").s().p("AqSHhIAAvBIUkAAIAAPBg");
	this.shape_7.setTransform(65.9,48.2);

	this.shape_8 = new cjs.Shape();
	this.shape_8.graphics.f("#FFFFFF").s().p("AvSHhIAAvBIelAAIAAPBg");
	this.shape_8.setTransform(98,48.2);

	this.shape_9 = new cjs.Shape();
	this.shape_9.graphics.f("#FFFFFF").s().p("AvPHhIAAvBIefAAIAAPBg");
	this.shape_9.setTransform(163.1,48.2);

	this.shape_10 = new cjs.Shape();
	this.shape_10.graphics.f("#FFFFFF").s().p("AqLHhIAAvBIUXAAIAAPBg");
	this.shape_10.setTransform(196.3,48.2);

	this.shape_11 = new cjs.Shape();
	this.shape_11.graphics.f("#FFFFFF").s().p("AlHHhIAAvBIKPAAIAAPBg");
	this.shape_11.setTransform(229.3,48.2);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[]}).to({state:[{t:this.shape_5,p:{scaleX:0.012,x:1.8}}]},1).to({state:[{t:this.shape_6}]},1).to({state:[{t:this.shape_7}]},1).to({state:[{t:this.shape_8}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.884,x:130}}]},1).to({state:[{t:this.shape_9}]},1).to({state:[{t:this.shape_10}]},1).to({state:[{t:this.shape_11}]},1).to({state:[{t:this.shape_5,p:{scaleX:0.003,x:262.5}}]},1).to({state:[]},1).wait(20));

	// Layer 2
	this.shape_12 = new cjs.Shape();
	this.shape_12.graphics.f("#24484F").s().p("A29HuIAAvcMAt6AAAIAAPcg");
	this.shape_12.setTransform(130,48.2,0.884,0.973);

	this.timeline.addTween(cjs.Tween.get(this.shape_12).wait(30));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,260,96.3);


(lib.mainCaseE = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":30});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.finishTransIn();
	}
	this.frame_50 = function() {
		this.stop();
		this.parent.startTransIn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(29).call(this.frame_29).wait(21).call(this.frame_50).wait(1));

	// case01_txt
	this.instance = new lib.case_05_txt_main();
	this.instance.setTransform(381.9,474.8,1,1,0,0,0,381.9,27.8);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({scaleY:1.04,y:392.6},5,cjs.Ease.get(-1)).to({scaleY:1,y:393.8},3,cjs.Ease.get(1)).wait(21).to({scaleY:1.09,y:391.3},3,cjs.Ease.get(-1)).to({scaleY:1,y:475.6},6,cjs.Ease.get(1)).to({_off:true},1).wait(11));

	// case05_broken_B
	this.instance_1 = new lib.case05_broken_B_1();
	this.instance_1.setTransform(544.5,-180.6,1,1,-9.9,0,0,105,95.5);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(15).to({_off:false},0).to({rotation:3,x:576.5,y:300.4},7,cjs.Ease.get(-1)).to({rotation:0,x:571.6,y:294.7},3,cjs.Ease.get(1)).wait(15).to({y:-203.4},6,cjs.Ease.get(1)).to({_off:true},1).wait(4));

	// case05_broken_A
	this.instance_2 = new lib.case05_broken_A_1();
	this.instance_2.setTransform(424.6,-199.4,1,1,0,0,0,99,96);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(13).to({_off:false},0).to({rotation:-4.7,x:415.1,y:274.3},7,cjs.Ease.get(-1)).to({rotation:0,x:425.6,y:273.1},3,cjs.Ease.get(1)).wait(14).to({y:-225},6,cjs.Ease.get(1)).to({_off:true},1).wait(7));

	// case01_bomb_01
	this.instance_3 = new lib.case01_bomb_01_1();
	this.instance_3.setTransform(557.4,181.2,0.134,0.134,0,0,0,87.5,78.2);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(18).to({_off:false},0).to({regY:78,scaleX:1.26,scaleY:1.26,rotation:-4.5,x:529.8,y:167.4},5,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,rotation:0,x:533.1,y:169.1},3,cjs.Ease.get(1)).wait(7).to({regX:87.4,regY:78.2,scaleX:0.17,scaleY:0.17,x:556.4,y:180.7},6).to({_off:true},1).wait(11));

	// case01_bomb_02
	this.instance_4 = new lib.case01_bomb_02_1();
	this.instance_4.setTransform(561.1,183.1,0.134,0.134,0,0,0,115.5,92);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(19).to({_off:false},0).to({scaleX:1.12,scaleY:1.12},5,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1},3,cjs.Ease.get(1)).wait(6).to({regY:92.1,scaleX:0.17,scaleY:0.17},6).to({_off:true},1).wait(11));

	// case05_img01
	this.instance_5 = new lib.case05_img01_1();
	this.instance_5.setTransform(211.1,231.6,1,0.142,0,0,0,91.5,38.6);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(12).to({_off:false},0).to({regY:38.5,scaleY:1.07,y:196.1},5,cjs.Ease.get(-1)).to({scaleY:1,y:198.6},3,cjs.Ease.get(1)).wait(16).to({scaleX:0.69,scaleY:0.69,x:239.7,y:439.6},3).to({_off:true},1).wait(11));

	// case01_bottom
	this.instance_6 = new lib.case05_bottom_1();
	this.instance_6.setTransform(384.9,480,1,1,-153.8,0,0,270.5,242);
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(1).to({_off:false},0).to({regX:270.6,rotation:2.7,x:385,y:480.1},11,cjs.Ease.get(-1)).to({regX:270.5,rotation:0,y:480},5,cjs.Ease.get(1)).wait(23).to({regX:270.6,rotation:1.3},4,cjs.Ease.get(-1)).to({regX:270.5,rotation:180},5,cjs.Ease.get(0.97)).to({_off:true},1).wait(1));

	// case05_paint
	this.instance_7 = new lib.case05_paint();
	this.instance_7.setTransform(383.6,-79.8,1,0.212,0,0,0,62,67);
	this.instance_7._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(14).to({_off:false},0).to({scaleY:1.04,y:102.9},6,cjs.Ease.get(-1)).to({scaleY:1,y:98.1},4,cjs.Ease.get(0.99)).wait(6).to({regX:62.1,scaleX:0.66,scaleY:0.66,x:380.6,y:535.2},6,cjs.Ease.get(-1)).to({_off:true},1).wait(14));

	// case05_wall
	this.instance_8 = new lib.case05_wall_1();
	this.instance_8.setTransform(382,584.9,1,0.212,0,0,0,188,122);
	this.instance_8._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(11).to({_off:false},0).to({scaleY:1.04,x:379.6,y:110.6},6,cjs.Ease.get(-1)).to({scaleY:1,y:115.1},4,cjs.Ease.get(0.99)).wait(10).to({scaleX:0.66,scaleY:0.66,x:377.9,y:546.3},6,cjs.Ease.get(-1)).to({_off:true},1).wait(13));

	// case05_img02
	this.instance_9 = new lib.case05_img02_1();
	this.instance_9.setTransform(577.5,586,1,0.212,0,0,0,53.5,116.5);
	this.instance_9._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_9).wait(6).to({_off:false},0).to({scaleY:1.04,x:575.1,y:116.3},6,cjs.Ease.get(-1)).to({scaleY:1,y:120.6},4,cjs.Ease.get(0.99)).wait(18).to({regX:53.6,scaleX:0.66,scaleY:0.66,x:506.5,y:550},6,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// case05_img02
	this.instance_10 = new lib.case05_img02_1();
	this.instance_10.setTransform(194,586.2,1,0.212,0,0,0,53.5,116.5);
	this.instance_10._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_10).wait(6).to({_off:false},0).to({scaleY:1.04,x:191.6,y:117.3},6,cjs.Ease.get(-1)).to({scaleY:1,y:121.5},4,cjs.Ease.get(0.99)).wait(16).to({scaleX:0.66,scaleY:0.66,x:254.3,y:550.6},6,cjs.Ease.get(-1)).to({_off:true},1).wait(12));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = null;


(lib.mainCaseD = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":30});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.finishTransIn();
	}
	this.frame_49 = function() {
		this.stop();
		this.parent.startTransIn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(29).call(this.frame_29).wait(20).call(this.frame_49).wait(1));

	// case01_txt
	this.instance = new lib.case_04_txt_main();
	this.instance.setTransform(381.9,474.6,1,1,0,0,0,381.9,27.8);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({y:393.8},5,cjs.Ease.get(-1)).wait(24).to({scaleY:1.09,y:391.3},3,cjs.Ease.get(-1)).to({scaleY:1,y:477.8},6,cjs.Ease.get(1)).to({_off:true},1).wait(10));

	// case04_waterdrop.png
	this.instance_1 = new lib.case04_water_main();
	this.instance_1.setTransform(408.2,170.9,1,1,0,0,0,13.8,31.2);
	this.instance_1.alpha = 0;
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(13).to({_off:false},0).to({x:409,y:209.8,alpha:1},4,cjs.Ease.get(-1)).wait(13).to({alpha:0},5).to({_off:true},1).wait(14));

	// case04_speaking.png
	this.instance_2 = new lib.case04_speak_mc();
	this.instance_2.setTransform(459.7,189.5,0.361,0.361,0,0,0,19,18.4);
	this.instance_2.alpha = 0;
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(13).to({_off:false},0).to({regX:19.1,regY:18.5,scaleX:1.17,scaleY:1.17,x:444.5,y:174.6,alpha:1},4,cjs.Ease.get(-1)).to({regX:19,scaleX:1,scaleY:1,x:447.5,y:177.7},3).wait(10).to({alpha:0},5).to({_off:true},1).wait(14));

	// case04_ppl01.png
	this.instance_3 = new lib.case04_ppl01_1();
	this.instance_3.setTransform(373.7,-307,1,1,0,0,0,48.5,37);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(8).to({_off:false},0).to({y:114.3},5,cjs.Ease.get(-1)).to({y:109.2},4,cjs.Ease.get(1)).wait(16).to({y:595.3},6,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// case04_ppl02.png
	this.instance_4 = new lib.case04_ppl03_1();
	this.instance_4.setTransform(491.1,-165,1,1,0,0,0,48,80);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(8).to({_off:false},0).to({y:256.3},5,cjs.Ease.get(-1)).to({y:251.2},4,cjs.Ease.get(1)).wait(16).to({y:737.4},6,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// case04_home.png
	this.instance_5 = new lib.case04_home_1();
	this.instance_5.setTransform(386.1,-292.6,1,1,0,0,0,170,228.5);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(8).to({_off:false},0).to({y:128.7},5,cjs.Ease.get(-1)).to({y:123.6},4,cjs.Ease.get(1)).wait(16).to({y:609.8},6,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// case01_bottom
	this.instance_6 = new lib.case02_bottom_1();
	this.instance_6.setTransform(384.9,480,1,1,-153.8,0,0,270.5,242);
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(1).to({_off:false},0).to({regX:270.6,rotation:2.7,x:385,y:480.1},11,cjs.Ease.get(-1)).to({regX:270.5,rotation:0,y:480},5,cjs.Ease.get(1)).wait(22).to({regX:270.6,rotation:1.3},4,cjs.Ease.get(-1)).to({regX:270.5,rotation:180},5,cjs.Ease.get(0.97)).to({_off:true},1).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = null;


(lib.mainCaseC = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":30});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.finishTransIn();
	}
	this.frame_49 = function() {
		this.stop();
		this.parent.startTransIn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(29).call(this.frame_29).wait(20).call(this.frame_49).wait(1));

	// case01_txt
	this.instance = new lib.case_03_txt_main();
	this.instance.setTransform(381.9,474,1,1,0,0,0,381.9,27.8);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({scaleY:1.11,y:390.8},5,cjs.Ease.get(-1)).to({scaleY:1,y:393.8},3,cjs.Ease.get(1)).wait(21).to({scaleY:1.13,y:390.3},3,cjs.Ease.get(-1)).to({scaleY:1,y:474.7},6,cjs.Ease.get(1)).to({_off:true},1).wait(10));

	// case03_ppl
	this.instance_1 = new lib.case03_ppl_1();
	this.instance_1.setTransform(519.7,-324.6,1,1,0,0,0,194,226.5);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(15).to({_off:false},0).to({y:261.5},6,cjs.Ease.get(-1)).to({y:253.5},3,cjs.Ease.get(1)).to({rotation:4,x:519.8},2).to({rotation:0,x:519.7},2).wait(8).to({y:-296.6},4).to({_off:true},1).wait(9));

	// case03_pplwithdog
	this.instance_2 = new lib.case03_pplwithdog_1();
	this.instance_2.setTransform(256.6,-382.1,1,1,0,0,0,104,159.5);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(12).to({_off:false},0).to({y:204.1},6,cjs.Ease.get(-1)).to({y:196.1},3,cjs.Ease.get(1)).to({regY:159.6,rotation:-3.7,x:258.7},4).to({regY:159.5,rotation:0,x:256.6},2).wait(9).to({y:-354},4).to({_off:true},1).wait(9));

	// case03_bottom
	this.instance_3 = new lib.case03_bottom_1();
	this.instance_3.setTransform(384,480,1,1,-143,0,0,269.5,242.1);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(1).to({_off:false},0).to({regX:269.4,regY:242,rotation:2,x:383.9},11,cjs.Ease.get(-1)).to({regX:269.5,rotation:0,x:384},5,cjs.Ease.get(1)).wait(23).to({regX:269.4,rotation:2,x:383.9},4).to({regX:269.5,regY:242.1,rotation:147},4).to({_off:true},1).wait(1));

	// case03_guard
	this.instance_4 = new lib.case03_guard_1();
	this.instance_4.setTransform(563,232.5,1,0.224,0,0,0,90.5,24.5);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(9).to({_off:false},0).to({scaleY:1.1,y:211},6,cjs.Ease.get(-1)).to({scaleY:1,y:213.5},3,cjs.Ease.get(1)).wait(12).to({scaleY:1.03,y:212.7},4).to({regY:24.4,scaleX:0.42,scaleY:0.42,x:447.9,y:501.9},4).to({_off:true},1).wait(11));

	// case03_guard
	this.instance_5 = new lib.case03_guard_1();
	this.instance_5.setTransform(205,232.5,1,0.224,0,0,0,90.5,24.5);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(11).to({_off:false},0).to({scaleY:1.1,y:211},5,cjs.Ease.get(-1)).to({scaleY:1,y:213.5},3,cjs.Ease.get(1)).wait(11).to({scaleY:1.03,y:212.7},4).to({regY:24.4,scaleX:0.42,scaleY:0.42,x:299.1,y:501.9},4).to({_off:true},1).wait(11));

	// case03_hill
	this.instance_6 = new lib.case03_hill_1();
	this.instance_6.setTransform(239.8,550.5,0.793,0.793,0,0,0,135,106.5);
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(5).to({_off:false},0).to({scaleY:0.82,y:150.8},7,cjs.Ease.get(-1)).to({scaleY:0.79,y:153.5},4,cjs.Ease.get(1)).wait(14).to({scaleY:0.82,y:150.8},4).to({scaleX:0.33,scaleY:0.33,x:313.6,y:477},4).to({_off:true},1).wait(11));

	// case03_hill
	this.instance_7 = new lib.case03_hill_1();
	this.instance_7.setTransform(419.7,528.5,1,1,0,0,0,135,106.5);
	this.instance_7._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(7).to({_off:false},0).to({scaleY:1.03,y:128},7,cjs.Ease.get(-1)).to({scaleY:1,y:131.5},4,cjs.Ease.get(1)).wait(12).to({scaleY:1.03,y:128},4).to({scaleX:0.42,scaleY:0.42,x:388.3,y:467.9},4).to({_off:true},1).wait(11));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = null;


(lib.mainCase_B = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":30});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_29 = function() {
		this.stop();
		this.parent.finishTransIn();
	}
	this.frame_50 = function() {
		this.stop();
		this.parent.startTransIn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(29).call(this.frame_29).wait(21).call(this.frame_50).wait(1));

	// case01_txt
	this.instance = new lib.case_02_txt_main();
	this.instance.setTransform(381.9,475.8,1,1,0,0,0,381.9,27.8);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({scaleY:1.09,y:391.3},5,cjs.Ease.get(-1)).to({scaleY:1,y:393.8},3,cjs.Ease.get(1)).wait(31).to({scaleY:1.09,y:391.3},3,cjs.Ease.get(-1)).to({scaleY:1,y:475.8},6,cjs.Ease.get(1)).to({_off:true},1).wait(1));

	// case02_hand.png
	this.instance_1 = new lib.case02_hand_1();
	this.instance_1.setTransform(161.5,395,1,1,-142.8,0,0,0,337.1);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(14).to({_off:false},0).to({regY:337,rotation:2},5).to({rotation:0},4).wait(7).to({y:382},3).to({y:758.5},3).to({_off:true},1).wait(14));

	// case02_ppl.png
	this.instance_2 = new lib.case02_ppl_1();
	this.instance_2.setTransform(469,-253,1,1,0,0,0,201.5,170);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(10).to({_off:false},0).to({scaleY:0.98,y:231.5},5,cjs.Ease.get(-1)).to({scaleY:1,y:228},4,cjs.Ease.get(1)).to({rotation:2.2,x:475.4,y:235.9},4).to({regX:201.6,rotation:-1.7,x:463.9,y:222.1},3).to({regX:201.5,rotation:0,x:469,y:228},2).wait(2).to({y:215},3).to({y:591.5},3).to({_off:true},1).wait(14));

	// case01_bomb_01
	this.instance_3 = new lib.case01_bomb_01_1();
	this.instance_3.setTransform(454.2,58.1,0.134,0.134,0,0,0,87.5,77.9);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(20).to({_off:false},0).to({regY:78,scaleX:1.14,scaleY:1.14,rotation:7.7,x:426,y:44},3,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,rotation:0,x:430,y:46},3,cjs.Ease.get(1)).wait(7).to({regY:78.4,scaleX:0.08,scaleY:0.08,x:455.7,y:58.9},3).to({_off:true},1).wait(14));

	// case01_bomb_02
	this.instance_4 = new lib.case01_bomb_02_1();
	this.instance_4.setTransform(458,60,0.134,0.134,0,0,0,115.5,92);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(22).to({_off:false},0).to({scaleX:1.14,scaleY:1.14},3,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1},3,cjs.Ease.get(1)).wait(5).to({regY:92.4,scaleX:0.08,scaleY:0.08},3).to({_off:true},1).wait(14));

	// case02_bottom.png
	this.instance_5 = new lib.case02_bottom_1();
	this.instance_5.setTransform(384,480,1,1,-148,0,0,269.5,242);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(2).to({_off:false},0).to({rotation:2.7,y:480.1},7,cjs.Ease.get(-1)).to({rotation:0,y:480},4,cjs.Ease.get(1)).wait(28).to({regX:269.6,rotation:2.7,x:384.1},3,cjs.Ease.get(-1)).to({rotation:146.2,x:383.8,y:480.1},4,cjs.Ease.get(1)).to({_off:true},1).wait(2));

	// case02_build.png
	this.instance_6 = new lib.case02_build_1();
	this.instance_6.setTransform(264.5,448.7,1,0.156,0,0,0,103,111.1);
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(5).to({_off:false},0).to({regY:111,scaleY:1,y:118},5,cjs.Ease.get(-1)).to({y:127},3,cjs.Ease.get(0.99)).wait(20).to({scaleX:0.39,scaleY:0.39,x:327.2,y:322.6},3).to({_off:true},1).wait(14));

	// case02_tree.png
	this.instance_7 = new lib.case02_tree_1();
	this.instance_7.setTransform(155,453.8,1,0.156,0,0,0,35.5,78.7);
	this.instance_7._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(10).to({_off:false},0).to({regY:78.5,scaleY:1,y:150.5},5,cjs.Ease.get(-1)).to({y:159.5},3,cjs.Ease.get(0.99)).wait(15).to({regX:35.6,scaleX:0.39,scaleY:0.39,x:284.4,y:335.3},3).to({_off:true},1).wait(14));

	// case02_balloon.png
	this.instance_8 = new lib.case02_balloon_1();
	this.instance_8.setTransform(118.5,434.4,1,0.156,0,0,0,59,86);
	this.instance_8._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(13).to({_off:false},0).to({scaleY:1,y:26},5,cjs.Ease.get(-1)).to({y:35},3,cjs.Ease.get(0.99)).wait(12).to({regX:59.1,scaleX:0.39,scaleY:0.39,x:270.1,y:286.6},3).to({_off:true},1).wait(14));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = null;


(lib.main = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{"transIn":1,"transOut":40});

	// timeline functions:
	this.frame_0 = function() {
		this.stop();
	}
	this.frame_39 = function() {
		this.stop();
		this.parent.finishTransIn();
	}
	this.frame_57 = function() {
		this.stop();
		this.parent.startTransIn();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(39).call(this.frame_39).wait(18).call(this.frame_57).wait(1));

	// case01_txt
	this.instance = new lib.case_01_txt_main();
	this.instance.setTransform(381.9,474.5,1,1,0,0,0,381.9,27.8);
	this.instance._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({_off:false},0).to({scaleY:1.11,y:390.8},5,cjs.Ease.get(-1)).to({scaleY:1,y:393.8},3,cjs.Ease.get(1)).wait(31).to({scaleY:1.13,y:390.3},3,cjs.Ease.get(-1)).to({scaleY:1,y:475},6,cjs.Ease.get(1)).to({_off:true},1).wait(8));

	// Layer 11
	this.instance_1 = new lib.case01_window_03_1();
	this.instance_1.setTransform(550,190.5,0.123,0.123,0,0,0,32.5,45.1);
	this.instance_1._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(25).to({_off:false},0).to({regY:45,scaleX:1,scaleY:1,x:564,y:179.3},6,cjs.Ease.get(-1)).to({x:550,y:190.5},4,cjs.Ease.get(1)).wait(11).to({y:458.5},6,cjs.Ease.get(1)).to({_off:true},1).wait(5));

	// case01_window_02
	this.instance_2 = new lib.case01_window_02_1();
	this.instance_2.setTransform(495.4,59.6,1,1,-49.7,0,0,128,88);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(24).to({_off:false},0).to({rotation:8.2,y:267.7},7,cjs.Ease.get(-1)).to({rotation:0,y:259.7},3,cjs.Ease.get(1)).wait(9).to({scaleY:1.04,y:255.6},3,cjs.Ease.get(-1)).to({scaleY:1,y:527.7},6,cjs.Ease.get(1)).to({_off:true},1).wait(5));

	// case01_window_01
	this.instance_3 = new lib.case01_window_01_1();
	this.instance_3.setTransform(363.3,83.4,1,1,-53.2,0,0,117,70.5);
	this.instance_3._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(22).to({_off:false},0).to({rotation:3.5,x:363.5,y:294.8},7,cjs.Ease.get(-1)).to({rotation:0,x:363.4,y:283.5},3,cjs.Ease.get(1)).wait(11).to({scaleY:1.04,y:280.4},3,cjs.Ease.get(-1)).to({scaleY:1,y:551.4},6,cjs.Ease.get(1)).to({_off:true},1).wait(5));

	// case01_bomb_01
	this.instance_4 = new lib.case01_bomb_01_1();
	this.instance_4.setTransform(479.6,169.1,0.117,0.117,0,0,0,87.2,78.3);
	this.instance_4._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(27).to({_off:false},0).to({regX:87.5,regY:78,scaleX:1.09,scaleY:1.09,rotation:5.2,x:452.5,y:154.7},4,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,rotation:0,x:454.9,y:156},3,cjs.Ease.get(1)).wait(9).to({regX:87.4,regY:78.2,scaleX:0.11,scaleY:0.11,x:480,y:211.7},4,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// case01_bomb_02
	this.instance_5 = new lib.case01_bomb_02_1();
	this.instance_5.setTransform(482.9,170.9,0.117,0.117,0,0,0,115.5,92);
	this.instance_5._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(29).to({_off:false},0).to({scaleX:1.09,scaleY:1.09,rotation:-4.2,y:171.6},4,cjs.Ease.get(-1)).to({scaleX:1,scaleY:1,rotation:0,y:171.5},3,cjs.Ease.get(1)).wait(7).to({regY:91.7,scaleX:0.11,scaleY:0.11,y:213.3},4,cjs.Ease.get(-1)).to({_off:true},1).wait(10));

	// Layer 3
	this.instance_6 = new lib.case01_window_01_1();
	this.instance_6.setTransform(331.8,79.9,0.165,0.366,0,-26.3,-15.4,117,70.6);
	this.instance_6.alpha = 0;
	this.instance_6._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(14).to({_off:false},0).to({regX:116.4,regY:70.8,scaleX:0.1,scaleY:0.23,skewX:-56.3,skewY:-45.4,x:381.1,y:98.3,alpha:1},4).to({regX:117.2,regY:70.7,scaleX:0.17,scaleY:0.37,skewX:3.7,skewY:14.6,x:382.8,y:127.5},3).to({_off:true},1).wait(36));

	// Layer 2
	this.instance_7 = new lib.case01_window_02_1();
	this.instance_7.setTransform(331.8,77.7,0.141,0.266,0,-51.9,-63.1,127.6,88);
	this.instance_7.alpha = 0;
	this.instance_7._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_7).wait(15).to({_off:false},0).to({regX:127.5,skewX:-96.9,skewY:-108.1,x:374.3,y:60.7,alpha:1},4).to({regX:127.8,regY:88.2,skewX:-21.9,skewY:-33.1,x:399.8,y:94.7},3).to({_off:true},1).wait(35));

	// case01_bottom
	this.instance_8 = new lib.case01_bottom_1();
	this.instance_8.setTransform(384.9,480,1,1,-153.8,0,0,270.5,242);
	this.instance_8._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_8).wait(1).to({_off:false},0).to({regX:270.6,rotation:2.7,x:385,y:480.1},9,cjs.Ease.get(-1)).to({regX:270.5,rotation:0,y:480},5,cjs.Ease.get(1)).wait(32).to({regX:270.6,rotation:1.3},4,cjs.Ease.get(-1)).to({regX:270.5,rotation:180},5,cjs.Ease.get(0.97)).to({_off:true},1).wait(1));

	// case01_build
	this.instance_9 = new lib.case01_build_1();
	this.instance_9.setTransform(272.4,486,1,1,0,0,0,95,120);
	this.instance_9._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_9).wait(5).to({_off:false},0).to({y:115},5,cjs.Ease.get(-1)).to({y:120},3,cjs.Ease.get(1)).wait(27).to({scaleY:1.03,y:116},3,cjs.Ease.get(-1)).to({scaleY:1,y:430},6,cjs.Ease.get(1)).to({_off:true},1).wait(8));

	// case01_cloud
	this.instance_10 = new lib.case01_cloud_1();
	this.instance_10.setTransform(183.9,157.7,0.719,0.719,0,0,0,48,32.5);
	this.instance_10.alpha = 0;
	this.instance_10._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_10).wait(10).to({_off:false},0).to({x:86,alpha:1},5,cjs.Ease.get(-1)).to({x:92},3,cjs.Ease.get(1)).wait(24).to({x:82,y:145.7},3,cjs.Ease.get(-1)).to({regX:48.1,scaleX:0.46,scaleY:0.46,x:274.6,y:295.2},6,cjs.Ease.get(1)).to({_off:true},1).wait(6));

	// case01_cloud
	this.instance_11 = new lib.case01_cloud_1();
	this.instance_11.setTransform(261.4,76.5,1,1,0,0,0,48,32.5);
	this.instance_11.alpha = 0;
	this.instance_11._off = true;

	this.timeline.addTween(cjs.Tween.get(this.instance_11).wait(7).to({_off:false},0).to({x:163.5,alpha:1},5,cjs.Ease.get(-1)).to({x:169.5},3,cjs.Ease.get(1)).wait(29).to({x:159.5,y:64.5},3,cjs.Ease.get(-1)).to({regX:48.1,scaleX:0.64,scaleY:0.64,x:327,y:301},6,cjs.Ease.get(1)).to({_off:true},1).wait(4));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = null;


// stage content:



(lib.personal_case_v2_canvas_en = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// timeline functions:
	this.frame_0 = function() {
		var cases = ["CaseB","CaseC","CaseD","CaseE"];
		var that = this;
		that.current = "";
		that.isAnimating = false;
		stage.enableMouseOver();
		
		function init(){
			
			for(var i = 0; i < cases.length;i++){
				that["btn"+cases[i]].name = cases[i];
				that["btn"+cases[i]].addEventListener("click",swapCase.bind(that));
				that["btn"+cases[i]].cursor = "pointer";
				that["btn"+cases[i]].mouseChildren = false;
			}
			
			//var evt = new createjs.MouseEvent("click", false, 1, 1, null, 0, true, 1, 1, null);
			setTimeout(function(){
				var evt = new createjs.MouseEvent('click');
				that.btnCaseB.dispatchEvent(evt);
			},1000);
			
			console.log(that.btnCaseA);
			console.log(that.btnCaseB);
		}
		
		function swapCase(e){
			
			//New
			var n = e.currentTarget.name;
			
			if(that.current == n || that.isAnimating) return;
			
			that.isAnimating = true;
			if(that.current != ""){
				that["main" + that.current].gotoAndPlay("transOut");
				that["btn" + that.current].gotoAndPlay("transOut");
			}else{
				that.startTransIn(n);
				that.startTransInBtn(n);
			}	
			that.current = n;
		}
		
		that.startTransIn = function(n){
			n = n ? n : that.current;
			console.log("startTransIn",n);
			that["main" + n].gotoAndPlay("transIn");
		}
		
		that.startTransInBtn = function(n){
			n = n ? n : that.current;
			that["btn" + n].gotoAndPlay("transIn");
		}
		
		that.finishTransIn = function(){
			that.isAnimating = false;
		}
		
		init();
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(1));

	// Btns
	this.btnCaseE = new lib.btnCaseE();
	this.btnCaseE.setTransform(894,408.4,1,1.007,0,0,0,130,48.2);

	this.btnCaseD = new lib.btnCaseD();
	this.btnCaseD.setTransform(894,288.4,1,1.007,0,0,0,130,48.1);

	this.btnCaseC = new lib.btnCaseC();
	this.btnCaseC.setTransform(894,168.5,1,1.007,0,0,0,130,48.2);

	this.btnCaseB = new lib.btnCaseB();
	this.btnCaseB.setTransform(894,48.4,1,1.007,0,0,0,130,48.1);

	this.btnCaseA = new lib.btnCaseA();
	this.btnCaseA.setTransform(894,-48.2,1,1,0,0,0,130,48.1);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.btnCaseA},{t:this.btnCaseB},{t:this.btnCaseC},{t:this.btnCaseD},{t:this.btnCaseE}]}).wait(1));

	// CaseA
	this.mainCaseA = new lib.main();
	this.mainCaseA.setTransform(381.9,298.5,1,1,0,0,0,381.9,240);

	this.timeline.addTween(cjs.Tween.get(this.mainCaseA).wait(1));

	// CaseB
	this.mainCaseB = new lib.mainCase_B();
	this.mainCaseB.setTransform(381.9,298.5,1,1,0,0,0,381.9,240);

	this.timeline.addTween(cjs.Tween.get(this.mainCaseB).wait(1));

	// CaseC
	this.mainCaseC = new lib.mainCaseC();
	this.mainCaseC.setTransform(381.9,298.5,1,1,0,0,0,381.9,240);

	this.timeline.addTween(cjs.Tween.get(this.mainCaseC).wait(1));

	// CaseD
	this.mainCaseD = new lib.mainCaseD();
	this.mainCaseD.setTransform(381.9,298.5,1,1,0,0,0,381.9,240);

	this.timeline.addTween(cjs.Tween.get(this.mainCaseD).wait(1));

	// CaseE
	this.mainCaseE = new lib.mainCaseE();
	this.mainCaseE.setTransform(381.9,298.5,1,1,0,0,0,381.9,240);

	this.timeline.addTween(cjs.Tween.get(this.mainCaseE).wait(1));

	// Layer 7
	this.shape = new cjs.Shape();
	this.shape.graphics.f("#EBEBEB").s().p("EgUSAlfMAAAhK+MAomAAAMAAABK+g");
	this.shape.setTransform(894,240);

	this.timeline.addTween(cjs.Tween.get(this.shape).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(1276,143.7,260,576.3);

})(lib = lib||{}, images = images||{}, createjs = createjs||{}, ss = ss||{});
var lib, images, createjs, ss;