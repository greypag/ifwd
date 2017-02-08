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
		//console.log(search);
		var searchCtrl = $(this).val();
		if(searchCtrl==""){
			$('.category-item[data-link="category1"]').trigger("click");
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
		$( ".category-item.active" ).each(function(){
			$(this).removeClass("active");
		});
		var link = $(this).attr("data-link");
		var that = $(this);
		$(this).addClass("active");			
		$( ".faq-group" ).each(function(){
			if($(this).attr("id")==link){
				$(this).show();
				$(this).children().show();
			}else{
				$(this).hide();
			} 
		});		  
	});
	$('.category-item[data-link="category1"]').trigger("click");
});	