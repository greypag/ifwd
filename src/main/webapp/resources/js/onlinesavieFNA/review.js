var contextPath = context; //"/fwdhk"
var UILANGUAGE = language;


var url_show = contextPath+"/ajax/savings-insurance/show";
var url_update = contextPath+"/ajax/savings-insurance/update";


$(document).ready(function(){
	Review.init();
});

var fnaData = {
  "name": null,
  "gender": null,
  "dob": null,
  "marital_status": null,
  "dependents": null,
  "education": null,
  "employment_status":null,
  "nature_of_business":null,
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
  "q4_g_others": null,
  "last_update":null
};


var fnaOccOther = {
	"nature":"NoB23",
	"occupation":"NoBD16"
}

//thousand comma separator
function formatNum (num) {
	num = (num + '').replace(/,/g,"");
    return (num + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
}

$(document).ready(function(){  
    $("#q4_a_others, #q4_b_amount, #q4_c_others, #q4_d_1_others, #q4_d_2_others").bind("blur",function(){
    	var val = $(this).val();
    	val = (val + '').replace(/,/g,"");
    	val = parseInt(val+'');
    	val = isNaN(val) ? "":val;
    	$(this).val(formatNum(val));
    });
    
})

var Review = {
	
	init:function(){
		var that = this;

		//Get question
		var question = FNAQuestion['data'];
		that.constructQuestion(question);

		//default disable all input
		$(".option").find("input[type='checkbox']").attr("disabled", "disabled");
		$(".option").find("input[type='text']").attr("readonly", "readonly");
		$(".occupation_others").val("").prop("disabled", true).hide();

		//Get review result
		var url = url_show;
		var postData = null;
		AjaxManager.fire(url, postData, function(result){
			that.constructInfo(result);
		}, null, null);

		
		//$("input.q3").change(that.radioEffect);
		$("input[type='checkbox']").change(that.checkboxChanged);
		$(".btn_edit").click(that.editClicked);
		$(".btn_ok").click(that.okClicked);
		$(".btn_cancel").click(that.cancelClicked);
		$("#btn_save").click(that.submitFNA);

		$("#status").change(function(){
			var status = $(this).val();
			var special_status = Boolean($("#status option[value='"+status+"']").attr("data-type") =="true");

			if(special_status){
				$("#nature").select2('destroy'); 
				$("#occupation").select2('destroy'); 
				$("#nature").empty().prop("disabled", true).addClass("disabled");
				$("#occupation").empty().prop("disabled", true).addClass("disabled");
				$(".NatureRow").hide()
				$(".OccupationRow").hide()
			}else if(!$("#nature").is(":visible")){
				$("#nature").prop("disabled", false).removeClass("disabled");
				$("#occupation").prop("disabled", false).removeClass("disabled");
				$(".NatureRow").show()
				$(".OccupationRow").show()
				that.constructSelection(status, null, null);
			}
			$("#occupation").change();
		});

		$("#nature").change(function(){
			var val = $(this).val();
			var id = $("#nature option[value='"+val+"']").attr("data-id");
			$("#occupation").empty();
			var occupations = Occupation['data'][id].position;
			var opt = $("<option/>");
			opt.val("").text(ReviewPageLocale['data'].select).attr("selected");
			$("#occupation").append(opt);
			for(var i = 0; i< occupations.length; i++){
				var opt = $("<option/>");
				opt.val(occupations[i].id).text(occupations[i].name);
				$("#occupation").append(opt);
			}
			$("#occupation").change();
			$("#occupation").focus();
		});


		$("#occupation").change(function(){
			var occ = $(this).val();
			var parent = $("#nature").val();

			if(parent == fnaOccOther.nature && occ == fnaOccOther.occupation){
				//others + others
				$(".occupation_others").show();
				$("#occupation_others").focus().val("").prop("disabled", false);
			}else{
				$(".occupation_others").hide();
				$("#occupation_others").val("").prop("disabled", true);
			}
		});
	},

	radioEffect:function(elm){
		//multiple 
		var id = $(elm).attr("id");
		var checked = $('#'+id).prop('checked');
		var row = id.replace("c", "r");
		var qid = $(elm).attr("class");
		
		$("#"+qid+" .option .row").each(function(){
			var rid = $(this).attr("id");
			if(rid != row){
				$("#"+rid).removeClass("selected");
				$("#"+rid).find("input[type='checkbox']").removeAttr("checked");
				$("#"+rid).find("input[type='text']").val("");
			}
		});
	},

	constructSelection:function(status, nature, occ){
		//$("#occupation").hide();
		status  = (status == undefined || status == "")? "ES1" :status;
		nature = (nature == undefined || nature == "")? "NoB1" :nature;
		occ = (occ == undefined || occ == "")? -1 :occ;

		var s = Status['data'];
		var natures = Occupation['data'];
		var occupations = natures[0].position;
		
		//status
		$("#status").empty();
		for(var i = 0; i< s.length; i++){
			var opt = $("<option/>");
			opt.val(s[i].id).text(s[i].name);
			opt.attr("data-type", s[i].disable);
			$("#status").append(opt);
		}
		$("#status option[value='"+status+"']").prop("selected", true);

		
		//nature of business
		$("#nature").empty();
		for(var i = 0; i< natures.length; i++){
			var opt = $("<option/>");
			opt.val(natures[i].id).text(natures[i].nob);
			opt.attr("data-id", i);
			$("#nature").append(opt);

			if(natures[i].id == nature){
				occupations = natures[i].position;
			}
		}
		$("#nature option[value='"+nature+"']").prop("selected", true);


		//occupation
		$("#occupation").empty();
		var opt = $("<option/>");
		opt.val(-1).text(ReviewPageLocale['data'].select).attr("selected");
		$("#occupation").append(opt);
		for(var i = 0; i< occupations.length; i++){
			var opt = $("<option/>");
			opt.val(occupations[i].id).text(occupations[i].name);
			$("#occupation").append(opt);
		}
		$("#occupation option[value='"+occ+"']").prop("selected", true);
		

		//$("#status").select2();
		$("#nature").select2();
		$("#occupation").select2();
	},

	constructQuestion:function(data){

		for(var i = 0; i< data.length; i++){
			//generate question
			var cell = $("#template_qu").clone(true, true);
			var qid = data[i].id;
			cell.attr("id", qid);
			cell.find(".btn_edit").attr("rel", qid);
			cell.find(".btn_cancel").attr("rel", qid);
			cell.find(".btn_ok").attr("rel", qid);
			cell.find(".num p").text(data[i].num + ". ");
			cell.find(".title p").html(data[i].title);

			//generate option
			var options = data[i].option;
			
			for(var j = 0; j < options.length; j++){
				var option = $("#template_op").clone(true, true);
				option.attr({"id":qid+"_r"+j});
				option.addClass("r"+qid);
				option.find("input").attr({"id": qid+"_c"+j, "name": qid+"_c"+j, "value":options[j].id});
				option.find("input").addClass(qid);
				option.find(".checkbox label").attr("for", qid+"_c"+j);

				var text = options[j].title;
				if(options[j].caption != ""){
					text = text + "<span><br>" + options[j].caption + "</span>";
				}
				if(options[j].other != undefined){
					var inputId = options[j].other;
					text = text.replace("{0}", "<input type='text' id='"+inputId+"' name='"+inputId+"' value='' maxlength='10' />");
					option.find(".checkbox input").attr("data-id", inputId);
				}

				if(options[j].popup != undefined){
					option.find(".checkbox input").attr("data-popup", "yes");
				}
				option.find(".checkbox label").html(text);
				cell.find(".option").append(option);
			}//end for option

			$("#question-list").append(cell);

		}//end for question

		//special treatment for "Total Amount"
		var hr = $("<hr/>");
		$("#q4_b_r7").prepend(hr);

		$("#q4_a_others").blur(function(){
			var val = $(this).val();
			if(!FormValidate.isEmpty(val)){
				$(".row.rq4_a").removeClass("selected");
				$("#q4_a").find("input[type='checkbox']").prop("checked", false);

				$("#q4_a_r0").addClass("selected");
				$("#q4_a_c0").prop("checked", true);
			}else{
				$("#q4_a_r0").removeClass("selected");
				$("#q4_a_c0").prop("checked", false);
			}
		});
	},

	constructInfo:function(data){

		fnaData = data;
		var that = this;
		$("#lastupdate").text(data.last_update);
		that.constructAnswer("personal_info");
		that.constructAnswer("q1");
		that.constructAnswer("q2");
		that.constructAnswer("q3");
		that.constructAnswer("q4");
		that.constructAnswer("q4_a");
		that.constructAnswer("q4_b");
		that.constructAnswer("q4_c");
		that.constructAnswer("q4_d_1");
		that.constructAnswer("q4_d_2");
		that.constructAnswer("q4_e");
		that.constructAnswer("q4_f");
		that.constructAnswer("q4_g");
	},

	constructAnswer:function(qid){
		var that = this;

		switch(qid){
			case "personal_info":
				var gender = ReviewPageLocale['data'].gender[fnaData.gender];
				var marital_status = ReviewPageLocale['data'].marital_status[fnaData.marital_status];
				var dependents = ReviewPageLocale['data'].dependents[fnaData.dependents];
				var education = ReviewPageLocale['data'].education[fnaData.education];

				$("#name").text(fnaData.name);
				$("#gender").text(gender);
				$("#dob").text( fnaData.dob );
				$(".marital_status").text( marital_status);
				$(".dependents").text( dependents);
				$(".education").text( education);
				
				that.constructSelection(fnaData.employment_status, fnaData.nature_of_business, fnaData.occupation);
				
				var status = $("#status option[value='"+fnaData.employment_status+"']").text();
				var nature = $("#nature option[value='"+fnaData.nature_of_business+"']").text();
				var occupation = $("#occupation option[value='"+fnaData.occupation+"']").text();
				if(fnaData.nature_of_business == fnaOccOther.nature && fnaData.occupation == fnaOccOther.occupation){
					occupation = fnaData.occupation_others;
					$(".occupation_others").show();
					$(".occupation_others input").val(occupation);
				}
				
				if(fnaData.nature_of_business == null && fnaData.occupation == null){
					$(".NatureRow").hide();
					$(".OccupationRow").hide();
				}

				$(".status").text(status);
				$(".nature").text(nature);
				$(".occupation").text(occupation);
				$("#marital_status option[value='"+fnaData.marital_status+"']").prop("selected", true);
				$("#dependents option[value='"+fnaData.dependents+"']").prop("selected", true);
				$("#education option[value='"+fnaData.education+"']").prop("selected", true);
				
				break;

			case "q1":
				var q1_ans = fnaData.q1.split(",");
				$("#q1 .option .row").removeClass("selected");
				$("#q1 .option .row input[type='checkbox']").removeAttr("checked");
				for(var i =0; i< q1_ans.length; i++){
					$("#q1_r"+q1_ans[i]).addClass("selected");
					$("#q1_c"+q1_ans[i]).prop('checked', true);
				}
				break;

			case "q2":
				var q2_ans = fnaData.q2.split(",");
				$("#q2 .option .row").removeClass("selected");
				$("#q2 .option .row input[type='checkbox']").removeAttr("checked");
				for(var i =0; i< q2_ans.length; i++){
					$("#q2_r"+q2_ans[i]).addClass("selected");
					$("#q2_c"+q2_ans[i]).prop('checked', true);
				}
				break;

			case "q3":
				$("#q3 .option .row").removeClass("selected");
				$("#q3 .option .row input[type='checkbox']").removeAttr("checked");
				$("#q3_r"+fnaData.q3).addClass("selected");
				$("#q3_c"+fnaData.q3).prop('checked', true);
				break;

			case "q4":
				$("#q4 .option .row").removeClass("selected");
				$("#q4 .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_r"+fnaData.q4).addClass("selected");
				$("#q4_c"+fnaData.q4).prop('checked', true);
				break;

			case "q4_a":
				$("#q4_a .option .row").removeClass("selected");
				$("#q4_a .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_a_others").val("");
				$("#q4_a_r"+fnaData.q4_a).addClass("selected");
				$("#q4_a_c"+fnaData.q4_a).prop('checked', true);
				if(fnaData.q4_a_others != null){
					$("#q4_a_others").val(formatNum(fnaData.q4_a_others));

				}
				break;

			case "q4_b":
				var q4_b_ans = fnaData.q4_b.split(",");
				$("#q4_b .option .row").removeClass("selected");
				$("#q4_b .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_b_others").val("");

				for(var i =0; i< q4_b_ans.length; i++){
					$("#q4_b_r"+q4_b_ans[i]).addClass("selected");
					$("#q4_b_c"+q4_b_ans[i]).prop('checked', true);
				}
				if(fnaData.q4_b_others != null){
					$("#q4_b_others").val(fnaData.q4_b_others);
				}

				if(fnaData.q4_b_amount != null){
					$("#q4_b_amount").val(formatNum(fnaData.q4_b_amount));
				}else{
					$("#q4_b_amount").val(0);
				}
				$("#q4_b_r7").addClass("selected");
				$("#q4_b_r7 label").removeAttr("for");
				$("#q4_b_r7 input[type='checkbox']").remove();
				$("#q4_b_r7 .checkbox").attr("class", "textbox");
				break;

			case "q4_c":
				//Text only
				$("#q4_c_r0").addClass("selected");
				$("#q4_c_r0 label").removeAttr("for");
				$("#q4_c_r0 input[type='checkbox']").remove();
				$("#q4_c_r0 .checkbox").attr("class", "textbox");
				$("#q4_c_others").val("");
				if(fnaData.q4_c != null){
					$("#q4_c_others").val(formatNum(fnaData.q4_c));
				}
				break;
			case "q4_d_1":
				//Text only
				$("#q4_d_1_r0").addClass("selected");
				$("#q4_d_1_r0 label").removeAttr("for");
				$("#q4_d_1_r0 input[type='checkbox']").remove();
				$("#q4_d_1_r0 .checkbox").attr("class", "textbox");
				$("#q4_d_1_others").val("");
				if(fnaData.q4_d_1 != null){
					$("#q4_d_1_others").val(formatNum(fnaData.q4_d_1));
				}
				break;
			case "q4_d_2":
				//Text only
				$("#q4_d_2_r0").addClass("selected");
				$("#q4_d_2_r0 label").removeAttr("for");
				$("#q4_d_2_r0 input[type='checkbox']").remove();
				$("#q4_d_2_r0 .checkbox").attr("class", "textbox");
				$("#q4_d_2_others").val("");
				if(fnaData.q4_d_2 != null){
					$("#q4_d_2_others").val(formatNum(fnaData.q4_d_2));
				}
				break;
			case "q4_e":
				$("#q4_e .option .row").removeClass("selected");
				$("#q4_e .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_e_r"+fnaData.q4_e).addClass("selected");
				$("#q4_e_c"+fnaData.q4_e).prop('checked', true);
				break;
			case "q4_f":
				$("#q4_f .option .row").removeClass("selected");
				$("#q4_f .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_f_r"+fnaData.q4_f).addClass("selected");
				$("#q4_f_c"+fnaData.q4_f).prop('checked', true);
				break;
			case "q4_g":
				var q4_g_ans = fnaData.q4_g.split(",");
				$("#q4_g .option .row").removeClass("selected");
				$("#q4_g .option .row input[type='checkbox']").removeAttr("checked");
				$("#q4_g_others").val("");

				for(var i =0; i< q4_g_ans.length; i++){
					$("#q4_g_r"+q4_g_ans[i]).addClass("selected");
					$("#q4_g_c"+q4_g_ans[i]).prop('checked', true);
				}
				if(fnaData.q4_g_others != null){
					$("#q4_g_others").val(fnaData.q4_g_others);
				}
				break;
		}		
	},

	saveAnswer:function(qid){

		var answer = "";
		var other = null;
		var amount = null;
		var answerArr = [];
		$("#"+qid+" .option .row").each(function(){
			var rid = $(this).attr("id");
			if($("#"+rid).find("input[type='checkbox']").prop("checked")){
				answer += $("#"+rid).find("input[type='checkbox']").val();
				answerArr.push($("#"+rid).find("input[type='checkbox']").val());
			}
		});
		answer = (answerArr.length > 0)?answerArr.join():"";

		var isError = false;
		
		if(qid == "personal_info"){
			var status = $("#status").val();
			var statusText = $("#status option[value='"+status+"']").text();
			var special_status = Boolean($("#status option[value='"+status+"']").attr("data-type")=="true");
			
			var nature = (special_status)? null : $("#nature").val();
			var natureText = (nature == null)? "" : $("#nature option[value='"+nature+"']").text();
			
			var occ = (special_status)? null : $("#occupation").val();
			var occText = (special_status)? "" : $("#occupation option[value='"+occ+"']").text();
			var occ_others = (special_status)? null : $("#occupation_others").val();
			occ = (FormValidate.isEmpty(occ))? null : occ;
			occ_others = (FormValidate.isEmpty(occ_others))? null : occ_others;

			if(!special_status && occ == null ){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].select_empty);
				$("#occupation").focus();
				isError = true;
			}else if(nature == fnaOccOther.nature && occ == fnaOccOther.occupation && occ_others == null){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].occupation_others_empty);
				$("#occupation_others").focus();
				isError = true;
			}else{
				answer = status;
				fnaData.marital_status = $("#marital_status").val();
				fnaData.dependents = $("#dependents").val();
				fnaData.education = $("#education").val();
				fnaData.employment_status = status;
				fnaData.nature_of_business = nature;
				fnaData.occupation = occ;
				fnaData.occupation_others = occ_others;
				occText = (occ_others == null)? occText: occ_others;

				$(".marital_status").text($("#marital_status option[value='"+fnaData.marital_status+"']").text());
				$(".dependents").text($("#dependents option[value='"+fnaData.dependents+"']").text());
				$(".education").text($("#education option[value='"+fnaData.education+"']").text());
				$(".status").text(statusText);
				$(".nature").text(natureText);
				$(".occupation").text(occText);
			}
		}
		

		if(qid == "q4_a"){
			other = $("#q4_a_others").val();
			other = (other + '').replace(/,/g,"");
			if(answer=="0" && other == ""){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].q4_a_others);
				$("#q4_a_others").focus();
				isError = true; 

			}else if(!FormValidate.isNumber(other)){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].number);
				$("#q4_a_others").focus();
				isError = true;
			}
			
			if(other!=null && other!=""){ 
				other = parseInt(other);
			}
		}

		if(qid == "q4_b"){
			/*
			other = $("#q4_b_others").val();
			if(answer.indexOf("6") >= 0 && other == ""){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].q4_b_others);
				$("#q4_b_others").focus();
				isError = true;
			}
			*/

			amount = $("#q4_b_amount").val();
			amount = (amount + '').replace(/,/g,"");
			if(amount == "" || amount == 0){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].q4_b_amount);
				$("#q4_b_amount").focus();
				isError = true;
			}else if(!FormValidate.isNumber(amount)){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].number);
				$("#q4_b_amount").focus();
				isError = true;
			}
			amount = parseInt(amount);
		}

		if(qid == "q4_c"){
			answer = $("#q4_c_others").val();
			answer = (answer + '').replace(/,/g,"");
			if(!FormValidate.isNumber(answer)){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].number);
				$("#q4_c_others").focus();
				isError = true;
			}
			answer = parseInt(answer);
		}

		if(qid == "q4_d_1"){
			answer = $("#q4_d_1_others").val();
			answer = (answer + '').replace(/,/g,"");
			if(!FormValidate.isNumber(answer)){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].number);
				$("#q4_d_1_others").focus();
				isError = true;
			}
			answer = parseInt(answer);
		}

		if(qid == "q4_d_2"){
			answer = $("#q4_d_2_others").val();
			answer = (answer + '').replace(/,/g,"");
			if(!FormValidate.isNumber(answer)){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].number);
				$("#q4_d_2_others").focus();
				isError = true;
			}
			answer = parseInt(answer);
		}

		/*
		if(qid == "q4_g"){
			other = $("#q4_g_others").val();
			if(answer.indexOf("4") >= 0 && other == ""){
				$("#"+qid+ " .error").text(ReviewPageLocale['data'].q4_g_others);
				$("#q4_g_others").focus();
				isError = true;
			}
		}
		*/

		if(answer == null || answer == ""){
			$("#"+qid+ " .error").text(ReviewPageLocale['data'][qid+"_empty"]);
			isError = true;
		}

		if(!isError){
			$("#"+qid+ " .error").text("");
			try{
				fnaData[qid] = answer;
				fnaData[qid+"_others"] = other;
				fnaData[qid+"_amount"] = amount;
			}catch(e){

			}
			return true;
		}else{
			return false;
		}
	},

	editClicked:function(evt){
		evt.preventDefault();
		var that = Review;
		var id = $(this).attr("rel");
		var target = $("#"+id);
		
		if(target.hasClass("display")){
			$(this).addClass("selected");
			target.removeClass("display");
			target.find("input[type='checkbox']").removeAttr("disabled");
			target.find("input[type='text']").removeAttr("readonly");
			target.find(".btn-action").show();
		}
		
		var offset = $(this).offset();
		var h = offset.top;
		that.scroll2(h);
		$("#btn_save").prop("disabled", true);
	},

	okClicked:function(evt){
		evt.preventDefault();
		var that = Review;
		var id = $(this).attr("rel");
		var target = $("#"+id);
		

		var isOK = that.saveAnswer(id);
		if(isOK){
			target.addClass("display")
			target.find(".btn_edit").removeClass("selected")
			target.find("input[type='checkbox']").attr("disabled", "disabled");	
			target.find("input[type='text']").attr("readonly", "readonly");
			target.find(".btn-action").hide();
		}


		//enable "BTN_SAVE" when all review box ok
		var allOk = true;
		$(".review-box").each(function(){
			if(!$(this).hasClass("display")){
				allOk = false;
			}
		});
		if(allOk){
			$("#btn_save").prop("disabled", false);
		}
	},

	cancelClicked:function(evt){
		evt.preventDefault();
		var that = Review;
		var id = $(this).attr("rel");
		that.constructAnswer(id);

		var target = $("#"+id);
		target.find(".error").text("");
		target.addClass("display")
		target.find(".btn_edit").removeClass("selected")
		target.find("input[type='checkbox']").attr("disabled", "disabled");	
		target.find("input[type='text']").attr("readonly", "readonly");
		target.find(".btn-action").hide();
		
		//enable "BTN_SAVE" when all review box ok
		var allOk = true;
		$(".review-box").each(function(){
			if(!$(this).hasClass("display")){
				allOk = false;
			}
		});
		if(allOk){
			$("#btn_save").prop("disabled", false);
		}
	},

	checkboxChanged:function(evt){
		var that = Review;
		var id = $(this).attr("id");
		var checked = $('#'+id).prop('checked');
		var row = id.replace("c", "r");
		var other = $(this).attr("data-id");
		var popup = $(this).attr("data-popup");
		var qid = $(this).attr("class");

		if(checked){
			if(popup != undefined){
				//alert("Please contact our customer service 3123 3123");
				//$('body').append('<div id="overlay"> </div>');
				
				$('#fnaPopupEnquiry').modal({
				   keyboard: false
				});

				$(this).removeAttr("checked");
				return;
			}

			//if have related "Others fleids"
			$("#"+row).addClass("selected");
			if(other != undefined) {
				$("#"+other).removeAttr("readonly").focus();
			}

			switch(qid){
				case "q3":
				that.radioEffect(this);
				break;

				case "q4":
				that.radioEffect(this);
				break;

				case "q4_a":
				that.radioEffect(this);
				break;

				case "q4_e":
				that.radioEffect(this);
				break;

				case "q4_f":
				that.radioEffect(this);
				break;
			}

		}else{
			$("#"+row).removeClass("selected");
			if(other != undefined) {
				$("#"+other).attr("readonly","readonly").val("");
			}
		}
	},

	submitFNA:function(){
		var txt = JSON.stringify(fnaData);
		console.log("Handle API post with below data:\n" + txt);

		//Get review result
		var url = url_update;
		var postData = fnaData;
		AjaxManager.fire(url, postData, function(result){
			if(result.status == 0){
				//window.location.href = "recommendation.html";
				window.location.href = contextPath + "/" + language + "/FNA/product-recommendation";
			}else if(result.status == 2){
				//alert("Please login first");
				$('.login-btn').click();
			}else{
				alert("Some error happened, please try again later.");
			}
		}, null, null);

		
	},

	scroll2:function(h){
		var body = $("html, body");
		body.stop().animate({scrollTop:h}, '500', 'swing', function() { 
		   //
		});
	}
}

function showFnaPopupClear() {
	$(".fna-popup-clear").modal({
		   keyboard: false
		});
	
}

function clearFna() {
	$.ajax({     
	    url:contextPath+'/ajax/clearFna',     
	    type:'get',     
	    error:function(){       
	    },     
	    success:function(data){
	    	if(data != null && data.errMsgs == null){
	    		window.location = contextPath + "/" + language + "/FNA/financial-needs-analysis";
	    	}
	    }  
	});
}

function hideFnaPopupClear() {
	$(".fna-popup-clear").modal("hide");
}

