$(function() {
	$('#teaserSurvery').on('hidden.bs.modal', function (e) {
		window.location.href = 'email-submitted';
	})
	
	$('#teaser-mmodal-submit').click(function(e){
		e.preventDefault();
		window.location.href = 'email-submitted';
	});
	
	$('#teaser-sign-up-btn').click(function(e){
		e.preventDefault();
		
		var checkPics = $("#pics-check").is(":checked");
		var checkTc = $("#tc-check").is(":checked");		
		var email = $.trim($('#teaserEmail').val());
		var phone = $('#teaserPhoneNo').val().length;
		var isErrorFlag = false;
		
		// Email is required
		if (email == "") {
			$('#emailAddrsMessage').html("Please input email.").removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#emailAddrsMessage').addClass('hideSpan');
			
			// Email is not valid
			if (email != "" && !validateEmail(email)) {
				$('#emailAddrsMessage').html("Invalid email address").removeClass('hideSpan');
				isErrorFlag = true;
			} else {
				$('#emailAddrsMessage').addClass('hideSpan');
				
				// Email is duplicate
				if (email != "" && duplicateEmail(email)) {
					$('#emailAddrsMessage').html("This e-mail address is already in use. Try another?").removeClass('hideSpan');
					isErrorFlag = true;
				} else {
					$('#emailAddrsMessage').addClass('hideSpan');
				}
			}
		}
		
		// Phone is not empty and has 8 characters
		if (phone > 0 && phone < 8) {
			$('#phoneErrMsg').html("This phone number is invalid. Try another?").removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#phoneErrMsg').addClass('hideSpan');
		}
		
		// Agreed terms and condition
		if (!checkTc || !checkPics) {
			$('#checkboxErrorMessage').html("In order to continue, you must agree to the Terms and Conditions.").removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#checkboxErrorMessage').addClass('hideSpan');
		}

		if (!isErrorFlag) {
			$('#teaserSurvery').modal('show');
			$('#emailAddrsMessage').addClass('hideSpan');
			$('#checkboxErrorMessage').addClass('hideSpan');
			$('#phoneErrMsg').addClass('hideSpan');
		}

	});

	$("#teaserPhoneNo").keypress(function(event) {
        return /\d/.test(String.fromCharCode(event.keyCode));
    });


});

function maxLengthReview(object) {
	if (object.value.length > object.maxLength)
	      object.value = object.value.slice(0, object.maxLength)
}

function duplicateEmail(){
	var email = $('#teaserEmail').val();
	if(email == "dup@gmail.com"){
		return true;
	}else{
		return false;
	}
	return false;
	
}

function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}

