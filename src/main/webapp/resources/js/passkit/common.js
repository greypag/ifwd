
var validator = {
	required: function(val){
		var re = /([^\s])/;
		//var re = /^\s*$/gi;
		//return !(re.test(val));
		return re.test(val);
	},
	script: function(val){
		var re = /<script[\s\S]*?>[\s\S]*?<\/script>/gi;
		return !(re.test(val));
	},
	symbol: function(val){
		var re = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/;
		return !(re.test(val));
	},
	email: function(val){
		//var re = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))(\.|))+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
		var re = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
		return re.test(val); 
	},
	name: function(val){ // 6 - 50 characters
		var re = /^[a-zA-Z\s]*$/;
		return re.test(val);
	},
	phone: function(val){ // 8 digits only
		//var re = /^\d{8}$/;
		var re = /^1[0-9]{10}$|^[5689][0-9]{7}$/;
		return re.test(val);
	},
	password: function(val){ // at least 8 character - at least 1 digit, 1 lower case, 1 upper case
		var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
		return re.test(val);
	},
	confirm_password: function(val){ // exact match
		var pw = $('#password').val();
		//var re = new RegExp('\^' + pw + '\$', "gi");
		//return re.test(val);
		if(val==pw){
			return true;
		}else{
			return false;
		}
	},
	whitespace: function(val){ // no white space
		var re = /\s/g;
		return !(re.test(val));
	},
	alphanumeric: function(val){ // digits or letters only
		var re = /^\d|[a-zA-Z]$/;
		return !(re.test(val));
	},
	checkbox: function(ele){
		if($(ele).prop('checked')){
			return true;
		}else{
			return false;
		}
		//return $('#agreement').prop("checked");
	},
	hkid: function(val){
		//var regex = /^[A-Z]{1}[0-9]{7}$/;
		var regex = /^[^()]*$/;
		return regex.test(val);
	},
	hkid_formula: function(val){
		return isValidHKID(val);
	},
	passport: function(val){
		var regex = /^[0-9a-zA-Z]{5,15}$/;
		return regex.test(val);
	},
	imei: function(val){
		var imeiList = ["35218907","35418707","35509807","35608607","35243007","35432107","35809607","35809907","35812907","35606007"];
		if(val == null){
			return false;
		}else if(val.length != 15){
			return false;
		}else{
			var rs = false;
			for(var i=0; i<imeiList.length; i++ ){
				if(imeiList[i] == val.substring(0,8)){
					rs = true;
					break;
				}
			}
			return rs;
		}
	},
	username:function(val){
		//var regex = /^[a-zA-Z0-9_-]{6,50}$/;
		//return regex.test(val);
		if(val.length < 6 || val.length > 50) {
			return false;
		}else{
			return true;
		}
	},
	username_special:function(val){
		//var regex = /^[a-zA-Z0-9!??@%&??)*\+,.\/;\[\\\]\^_`{|}~-]+$/;
		var regex = /^[a-zA-Z0-9@._-]+$/;
		return regex.test(val);
	},
	price:function(val){
		var regex = /^[0-9]*$/;
		return regex.test(val);
	},
	cert:function(val){
		var regex = /^(10SP)[0-9]{7}$/;
		return regex.test(val);
	},
	no_chin:function(val){
		var regex = /^[^\u4e00-\u9fa5]*$/;
		return regex.test(val);
	},
	eng_num:function(val){
		var regex = /^[a-zA-Z0-9]*$/;
		return regex.test(val);
	}
},

digitInput = function (evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|[\b]|[\t]|[+-]/;
	if( !regex.test(key)) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault){
			theEvent.preventDefault();
		}
	}
},
emailInput = function (evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}\[\]~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|@|[\b]|[\t]|\./;
	if( !regex.test(key)) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault){
			theEvent.preventDefault();
		}
	}
},
flightNumberInput = function (evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|[a-zA-Z]/;
	if( !regex.test(key)) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault){
			theEvent.preventDefault();
		}
	}
},
usernameInput = function (evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[a-zA-Z]/;
	if( regex.test(key)) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault){
			theEvent.preventDefault();
		}
	}
}

var form = function() {
	var $form, $submit, $fields;

	function init() {
		$form = $('form').not('.form-modal');
		
		if($form.length >= 1){
			$form.get(0).reset();
		}

		$fields = $form.find("input, select, textarea");
		$error = $form.find(".error-message");
		$empty_error = $form.find(".empty-error-message");
		$hkid_error = $form.find(".hkid-error-message");
		$submit = $form.find("#submit");

		$fields.blur(function() {
			validate($(this));
		});
		
		$fields.change(function() {
			if($(this).hasClass('agreement')){
				validate($(this));
			}
		});

		$("input:text, input:password, textarea").focus(function() {
			$(this).parent().addClass("expand focus");
		}).blur(function() {
			if($(this).val().length < 1){
				$(this).parent().removeClass("expand focus");
			}else{
				$(this).parent().removeClass("focus");
			}
		});
		
		$("select").focus(function() {
			$(this).parent().addClass("expand focus");
		}).blur(function() {
			if($(this).val() == null){
				$(this).parent().removeClass("expand focus");
			}else{
				$(this).parent().removeClass("focus");
			}
		});

		$submit.click(submit);

	}

	function validate($fields) {
		var valid = true;
		
		if (!validator){
			return valid;
		}

		$fields.each(function(idx, ele) {
			var $ele = $(ele);
			hideError($ele,'error');
			hideError($ele,'empty-error');
			hideError($ele,'hkid-error');
			hideError($ele,'specialChar-error');
			
			if(!$(this).hasClass('agreement')){ //if is not the declaration
				if ($ele.data("validate")) {
					var val = $ele.val(),
					to_validate = $ele.data("validate").split(" "),
					l = to_validate.length;

					//if is select and val is null
					if($(this).is('select') && val==null){
						val = '';
					}
					
					for (var i = 0; i < l; i++) {
						var result = true;
						var hasInput = true;
						var isValidHkid = true;
						var isSpecialChar = true;
						switch (to_validate[i]) {
							case 'required':
								hasInput = eval('validator.' + to_validate[i] + '(val)');
								break;
							case 'hkid_formula':
								isValidHkid = eval('validator.' + to_validate[i] + '(val)');
								break;
							case 'username_special':
								isSpecialChar = eval('validator.' + to_validate[i] + '(val)');
								break;
							default:
								result = eval('validator.' + to_validate[i] + '(val)');
								break;
						}
						console.log('1. Result' + result);
						console.log('2. has input? :' + hasInput);
						console.log('3. isValidHkid? :' + isValidHkid);
						console.log('3. isSpecialChar? :' + isSpecialChar);
						if (!result || !hasInput || !isValidHkid || !isSpecialChar){
							break;
						}
					}
					
					if(!hasInput){
						console.log('hasInput');
						showError($ele,'empty-error');
						valid = false;
					}else{
						hideError($ele,'empty-error');
					}
					if(!result) {
						console.log('result');
						showError($ele,'error');
						valid = false;
					}else{
						hideError($ele,'error');
					}
					if(!isValidHkid) {
						console.log('isValidHkid');
						showError($ele,'hkid-error');
						valid = false;
					}else{
						hideError($ele,'hkid-error');
					}
					if(!isSpecialChar) {
						console.log('isSpecialChar');
						showError($ele,'specialChar-error');
						valid = false;
					}else{
						hideError($ele,'specialChar-error');
					}
				}
			}else{
				if ($ele.data("validate")) {
					var val = $ele.val(),
					to_validate = $ele.data("validate").split(" "),
					l = to_validate.length;

					for (var i = 0; i < l; i++) {
						var result = true;
						
						switch (to_validate[i]) {
							default:
								result = eval('validator.' + to_validate[i] + '($ele)');
								break;
						}
						console.log('1. Result' + result);
						if (!result){
							break;
						}
					}
					
					if(!result) {
						console.log('result');
						showError($ele,'error');
						valid = false;
					}else{
						hideError($ele,'error');
					}
				}
			}
		});
		return valid;
	}

	function showError($ele,errorType) {
		$fields.filter("[id='" + $ele.attr("id") + "']").parents('div').addClass(errorType).removeClass("ok");
	}
	function hideError($ele,errorType) {
		$fields.filter("[id='" + $ele.attr("id") + "']").parents('div').removeClass(errorType).addClass("ok");
	}
	
	function submit() {
		if( !$submit.hasClass('disabled') ){
			//if(($(location).attr('pathname')) == '/C:/Users/Peter%20Mekkelholt/Desktop/Screenprotector_html/web/en/t4_claim.html'){
			if($('#div_upload_purchase').length && $('#div_upload_repair').length && $('#div_upload_maintenance').length){
				if(validate($fields) && $('#div_upload_purchase').has('div.dz-preview').length > 0 && $('#div_upload_repair').has('div.dz-preview').length > 0 && $('#div_upload_maintenance').has('div.dz-preview').length > 0) {
						$submit.addClass('disabled');
						$form.submit();
				}else{
					if($('#div_upload_purchase').has('div.dz-preview').length <= 0){
						$('#div_upload_purchase').parents('div').addClass("error").removeClass("ok");
						$('#div_upload_purchase').parent(".error").animatescroll();
					}else{
						$('#div_upload_purchase').parents('div').addClass("ok").removeClass("error");
					}
					if($('#div_upload_repair').has('div.dz-preview').length <= 0){
						$('#div_upload_repair').parents('div').addClass("error").removeClass("ok");
						$('#div_upload_repair').parent(".error").animatescroll();
					}else{
						$('#div_upload_repair').parents('div').addClass("ok").removeClass("error");
					}
					if($('#div_upload_maintenance').has('div.dz-preview').length <= 0){
						$('#div_upload_maintenance').parents('div').addClass("error").removeClass("ok");
						$('#div_upload_maintenance').parent(".error").animatescroll();
					}else{
						$('#div_upload_maintenance').parents('div').addClass("ok").removeClass("error");
					}

					$fields.parent(".error").animatescroll();
				}
			}else{
				if (validate($fields)) {
						$submit.addClass('disabled');
						$form.submit();
				} else {
					$fields.parent(".error").animatescroll();
				}
			}
		}
	}

	return {
		init: init
	}
}();

$('document').ready(function(){
	console.log($(location).attr('pathname'));
	//if(($(location).attr('pathname')) == '/C:/Users/Peter%20Mekkelholt/Desktop/Screenprotector_html/web/en/t4_claim.html'){
	if($('#div_upload_purchase')!=null && $('#div_upload_repair')!=null && $('#div_upload_maintenance')!=null){
		Dropzone.autoDiscover = false;
		var url = '../ajax/file/post';
		$('div#div_upload_purchase').dropzone({
			url: url,
			headers: {"fileNo": "purchaseFile"},
			maxFiles: 1,
			maxFilesize: 2,
			addRemoveLinks: true,
			acceptedFiles: 'image/jpeg,image/png'
		});
		$('div#div_upload_repair').dropzone({
			url: url,
			headers: {"fileNo": "repairFile"},
			maxFiles: 1,
			maxFilesize: 2,
			addRemoveLinks: true,
			acceptedFiles: 'image/jpeg,image/png'
		});
		$('div#div_upload_maintenance').dropzone({
			url: url,
			headers: {"fileNo": "maintenanceFile"},
			maxFiles: 1,
			maxFilesize: 2,
			addRemoveLinks: true,
			acceptedFiles: 'image/jpeg,image/png'
		});
	}
	
	form.init();
	
//get language by trick
$('.language a').each(function(){
	if($(this).hasClass('active')){
		language = $(this).data('lang');
		console.log($(this).data('lang'));
	}
});

	var dateTo = new Date();
	var dateFrom = new Date();
	dateFrom.setDate(dateTo.getDate() - 10);
	$('#purchase_date').mobiscroll().calendar({
		//dateOrder: 'ddMyy',
		display: 'bubble',
		showLabel: true,
		mode: 'scroller',
		controls: ['date'],
		//layout: 'liquid',
		//minWidth: 40,
		minDate: dateFrom,
		maxDate: dateTo,
		//dateFormat: 'dd-mm-yyyy',
		lang: language == "en" ? "en_fwd" : "zh_fwd",
		showOnFocus: true,
		focusOnClose: false
		//lang: "en_fwd"
	});
	$('#incident_date').mobiscroll().calendar({
		display: 'bubble',
		showLabel: true,
		mode: 'scroller',
		controls: ['datetime'],
		maxDate: dateTo,
		lang: language == "en" ? "en_fwd" : "zh_fwd",
		showOnFocus: true,
		focusOnClose: false
		//lang: "en_fwd"
	});
	
	$("#purchase_date,#incident_date").change(function(){
	if($(this).val() == ""){
		$(this).parent().removeClass("expand");
	}else{
		$(this).parent().addClass("expand");
	}});
	
	var $body = $('body'); 
	
	$('.agreement').unbind('blur');
	
	// $( "form input" ).keypress(function(event) {
		// if( $(this).attr('id') == 'tel' )
			// digitInput(event);
		// else if( $(this).attr('id') == 'email' )
			// emailInput(event);
		// else if( $(this).attr('id') == 'name' )
			// usernameInput(event);
	// });


	
	$('#hkid_passport').on('change',function(event){
		if ($(this).val() =='hkid'){
				$('#hkid').parent().removeClass('hidden');
				$('#hkid').data('validate', 'required hkid hkid_formula');
				$('#passport').parent().addClass('hidden');
				$('#passport').data('validate', '');
		}else{
			$('#hkid').parent().addClass('hidden');
			$('#hkid').data('validate', '');
			$('#passport').parent().removeClass('hidden');
			$('#passport').data('validate', 'required passport');
		};
	}).change();
/*
	$("#other_insurances").change(function(){
		$(this).parent().removeClass('on off');
		if($(this).is(':checked')) {
			$(this).parent().addClass('on');
			$('#insurer').data('validate', '');
			$('#insurer_policy').data('validate', '');
		}else{
			$(this).parent().addClass('off');
			$('#insurer').data('validate', 'required eng_num');
			$('#insurer_policy').data('validate', 'required eng_num');
		}
	});
*/
	$("#dealer").change(function(){
		if($(this).val()=='SPD23') {
			$('#dealer_desc').parent().removeClass('hidden');
			$('#dealer_desc').data('validate', 'required');
		}else{
			$('#dealer_desc').parent().addClass('hidden');
			$('#dealer_desc').data('validate', '');
		}
	});

	$('[data-toggle="tooltip"]').tooltip({
		html: true,
		placement: 'top'
	});
	$("#other_insurances").change(function(){
		if(!$(this).prop('checked')) {
			$('#insurer').parent().removeClass('hidden');
			$('#insurer').data('validate', 'required eng_num');
			
			$('#insurer_policy').parent().removeClass('hidden');
			$('#insurer_policy').data('validate', 'required eng_num');
		}else{
			$('#insurer').parent().addClass('hidden');
			$('#insurer').data('validate', '');
			
			$('#insurer_policy').parent().addClass('hidden');
			$('#insurer_policy').data('validate', '');
		}
	});

	$('[data-toggle="popover"]').popover();
	
	$('#hkid, #policy_num').on('change',function(){
		var str = $(this).val();
		$(this).val(str.toUpperCase());
	}).change();
	
//	$('#password').change(function(){
//		$form.valiate($(''))
//	});

	$('.error-msg-overall').hide();
	$('#forgotusername-success-message').hide();
	$('#forgotusername-error-message').hide();
	$('#forgotpassword-success-message').hide();
	$('#forgotpassword-error-message').hide();
	
	//$('#name').val('hahaha');
	//$('#mobile').val('hahaha');
	//$('#email').val('hahaha');
	($('#name').val()!='')?$('#name').parent().addClass("expand"):'';
	($('#mobile').val()!='')?$('#mobile').parent().addClass("expand"):'';
	($('#email').val()!='')?$('#email').parent().addClass("expand"):'';
});



//Get server side response of message(both error and success)
function response2div(message, id_class, class_id_name){
	if(id_class=='class'){
		$('.'+class_id_name).show();
		$('.'+class_id_name).text(message);
	}else if(id_class=='id'){
		$('#'+class_id_name).show();
		$('#'+class_id_name).text(message);
	}
}

//Checking HKID is valid
function isValidHKID(hkid) {
	var isValid = false;
	
	if (hkid && (hkid.length > 7)) {
		//to upper case if type in lower case
		if(hkid.charCodeAt(0) >= 97 && hkid.charCodeAt(0) <= 122){
			var string = hkid.charCodeAt(0)-32;
			hkid = String.fromCharCode(string)+hkid.slice(1);
		}
		//separate hkid and checksum
		if(hkid.indexOf('(') > -1){
			var message = hkid.slice(0, hkid.indexOf('('));
			var checksum = hkid.slice((hkid.indexOf('(') + 1), hkid.lastIndexOf(')'));
			if(hkid.length > 10) {
				 return false;
			}
		}else{
			var message = hkid.slice(0, 7);
			var checksum = hkid.slice(7, 8)
			if(hkid.length > 8) {
				 return false;
			}
		}
		console.log('message: '+message);
		console.log('checksum: '+checksum);
		checksum = isNaN(checksum) ? 10 : parseInt(checksum, 10);
		var checkCtr = message.length + 1
		var checksumTotal = 0;
		
		for (var i=0; i<message.length; i++){
			var digit = isNaN(message[i]) ? equivalentInteger(message[i]) : parseInt(message[i], 10);
			checksumTotal += (digit * checkCtr--);
		}
		//isValid = (checksum === (11 - (checksumTotal) % 11));
		var remainder = checksumTotal % 11;
		var checkDigit = (remainder==0)?0:11-remainder;
		isValid = checksum == checkDigit || checksum == 'A' && checkDigit == 10;
	}
	return isValid;
}

// HKID Characters
function equivalentInteger(hkidChar){
	var digit;
	switch(hkidChar.toUpperCase()){
		case 'A':
		case 'L':
		case 'W':
			digit = 1;
			break;
		case 'B':
		case 'M':
		case 'X':
			digit = 2;
			break;
		case 'C':
		case 'N':
		case 'Y':
			digit = 3;
			break;
		case 'D':
		case 'O':
		case 'Z':
			digit = 4;
			break;
		case 'E':
		case 'P':
			digit = 5;
			break;
		case 'F':
		case 'Q':
			digit = 6;
			break;
		case 'G':
		case 'R':
			digit = 7;
			break;
		case 'H':
		case 'S':
			digit = 8;
			break;
		case 'I':
		case 'T':
			digit = 9;
			break;
		case 'J':
		case 'U':
			digit = 10;
			break;
		case 'K':
		case 'V':
			digit = 11;
			break;
			
	}
	return digit;
}
