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
		
		var email = $('#teaserEmail').val();

		var phone = $('#teaserPhoneNo').val().length;

		if(email!=""){
			$('#noEmailMessage').addClass('hideSpan');
			$('#phoneErrMsg').addClass('hideSpan');
			if((!duplicateEmail()) &&  checkPics && checkTc && (phone == 0 || phone == 11)){
				$('#teaserSurvery').modal('show');
				$('#emailAddrsMessage').addClass('hideSpan');
				$('#checkboxErrorMessage').addClass('hideSpan');
				$('#phoneErrMsg').addClass('hideSpan');
			}else if((!duplicateEmail()) &&  checkPics && checkTc && (phone != 11)){
				$('#teaserSurvery').modal('hide');
				$('#emailAddrsMessage').addClass('hideSpan');
				$('#checkboxErrorMessage').addClass('hideSpan');
				$('#phoneErrMsg').removeClass('hideSpan');
			}else{
				if(duplicateEmail()){
					console.log('Dup ang email');
					if($('#emailAddrsMessage').hasClass('hideSpan')){
						$('#emailAddrsMessage').removeClass('hideSpan');
						$('#phoneErrMsg').addClass('hideSpan');
					}

				}else{
					$('#emailAddrsMessage').addClass('hideSpan');
				}
				
				if(!checkPics || !checkTc){
					console.log('Error sa checkbox');
					if($('#checkboxErrorMessage').hasClass('hideSpan')){
						$('#checkboxErrorMessage').removeClass('hideSpan');
						$('#phoneErrMsg').addClass('hideSpan');
					}

					if (phone != 11) {
						if($('#phoneErrMsg').hasClass('hideSpan')){
							$('#phoneErrMsg').removeClass('hideSpan');
						}
						if(phone == 0){
							$('#phoneErrMsg').addClass('hideSpan');
						}
					}else{
						$('#phoneErrMsg').addClass('hideSpan');
					}

				}else{
					$('#checkboxErrorMessage').addClass('hideSpan');			
				}

			}
		}else{
			if($('#noEmailMessage').hasClass('hideSpan')){
				$('#noEmailMessage').removeClass('hideSpan');
				$('#phoneErrMsg').addClass('hideSpan');
			}

			if (phone != 11) {
				if($('#phoneErrMsg').hasClass('hideSpan')){
					$('#phoneErrMsg').removeClass('hideSpan');
				}
				if(phone == 0){
					$('#phoneErrMsg').addClass('hideSpan');
				}
			}else{
				$('#phoneErrMsg').addClass('hideSpan');
			}
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

