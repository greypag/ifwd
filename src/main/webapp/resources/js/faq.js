var questionData;
$.ajax({
	url: jsonPath,
	dataType: 'json',
	async: false,
	success: function(data) {
		questionData = data;
  }
});	
$(function() {
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
		console.log(search);
		var searchCtrl = $(this).val();
		var searchResult = search.search(searchCtrl);
		console.log(searchResult);
		$( ".faq-group" ).hide();
		$( ".faq-group__question" ).hide();
		$( ".faq-group__answer" ).hide();
		for (var i = 0; i < searchResult.length; i++) {
		  var qId = searchResult[i]['ref'];
		  var qIndex = $("#question"+qId);
		  $("#question"+qId).show();
		  $("#question"+qId).parent().show();
		  console.log(qIndex);
		};
	});
	$( ".category-item" ).on( "click", function() {
		var link = $(this).attr("data-link");
		$(this).toggleClass("active");
		$( ".faq-group" ).each(function(){
			if($(this).attr("id")==link){
				$(this).show();
				$(this).children().show();
			}else{
				$(this).hide();
			} 
		});		  
	});		
});	