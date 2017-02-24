var questionData;
var urlUlility = {
	getUrlVars: function(){
		var vars = [], hash;
		var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		for(var i = 0; i < hashes.length; i++){
			hash = hashes[i].split('=');
			vars.push(hash[0]);
			vars[hash[0]] = hash[1];
		}
		return vars;
	},
	getUrlVar: function(name){
		return getUrlVars()[name];
	},
	gethashLocation: function(){
		return window.location.hash;
	}
};
$.ajax({
	url: jsonPath,
	dataType: 'json',
	async: false,
	success: function(data) {
		questionData = data;
  }
});
function backToTop(selector){
	var that = $(selector);
	$(window).scroll(function(){
		if ($(this).scrollTop() > 200) {
			that.fadeIn();
		} else {
			that.fadeOut();
		}
	});	
	that.click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});		
}

function anchorLink(selector){
	//var parentID;
	var headerOffset;
	$(window).width() <= 991 ? headerOffset = $('.navbar-fixed-top').height() : headerOffset = $('.top-bar').height();
	console.log(headerOffset);
	//console.log(isMobile);
	if(selector){
	    $('html, body').animate({
	        scrollTop: $(selector).offset().top - headerOffset
	    }, 2000);		
		//location.hash = "#" + selector;
	}
}
$(function() {
	var hashlocation = urlUlility.gethashLocation();
	var search = elasticlunr(function () {
	    this.setRef('id');
	    this.addField('question_title');
	    this.addField('question_answer');
	    this.addField('category');
	});
	var questions = questionData.questions.map(function (q) {
	    return {
	    	id: q.id,
	    	question_title: q.question_title,
	    	question_answer: q.question_answer,
	    	category: q.category
	    };
  	});
	questions.forEach(function (question) {
		search.addDoc(question);
  	});		
	$( "#search-input" ).keyup(function() {
		//console.log(search);
		var searchCtrl = $(this).val();
		if(searchCtrl==""){
			$('.category-item[data-link="category1"]').click();			
			return false;
		}
		var searchResult = search.search(searchCtrl);
		//console.log(searchResult);
		$( ".faq-group" ).hide();
		$( ".faq-group__question-index" ).hide();
		$( ".faq-group__question" ).hide();
		for (var i = 0; i < searchResult.length; i++) {
		  var qId = searchResult[i]['ref'];
		  var qIndex = $("#question"+qId);
		  $("#question"+qId).show();
		  $("#question"+qId).parent().show();
		  //console.log(qIndex);
		};
	});
	$( ".category-item" ).on( "click", function() {
		var thatLink = $(this).attr("data-link");
		var that = $(this);
		that.toggleClass("active");
		if( $(window).width()<992 ){
			$('html, body').animate({scrollTop : 0},800);
		}		
		$( ".category-item.active" ).each(function(){
			$(this).toggleClass("active");
		});
		/* added for synchronize active category for mobile */
		$('.category-item[data-link="'+thatLink+'"]').each(function(){
			$(this).toggleClass("active");
		});	
		$( ".faq-group" ).each(function(){
			if($(this).attr("id")==thatLink){
				$(this).show();
				$(this).children().show();
			}else{
				$(this).hide();
			} 
		});		  
	});
	$( ".faq-group__question-index" ).on( "click", ".question", function(event) {
		event.preventDefault();
		anchorLink($(this).attr("href"));
	});
	if(hashlocation==""){
		$('.category-item[data-link="category1"]').click();	
	}else{
		var parentID;
		parentID = $(hashlocation).parents(".js-show").attr("id");
		$('.category-item[data-link="'+parentID+'"]').click();
		anchorLink(hashlocation);
	}
	backToTop('.scrollToTop-btn');
});