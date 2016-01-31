var beneficiarySelection1 = $( "#beneficiaryHkidPassport\\[0\\] option:selected" ).text();

$(function() {
	//Header Orange Top Menu
	//by: RMN
	
	//Payment
	$('#payment-header-btn').click(function(){
		$('html, body').animate({
			scrollTop: $('#payment').offset().top -  ($('.navbar-fixed-top').height() + $('.application-page-header').height())
		}, 1000);
	});
	
	//Beneficiary 
	$('#beneficiary-header-btn').click(function(){
		$('html, body').animate({
			scrollTop: $('#beneficiary-info').offset().top - ($('.navbar-fixed-top').height() + $('.application-page-header').height())
		}, 1000);
	});
	
	//Employment
	$('#employment-header-btn').click(function(){
		$('html, body').animate({
			scrollTop: $('#employment-info').offset().top - ($('.navbar-fixed-top').height() + $('.application-page-header').height())
		}, 1000);
	});
	
	//Applicant
	$('#applicant-header-btn').click(function(){
		$('html, body').animate({
			scrollTop: $('#personal-info').offset().top - ($('.navbar-fixed-top').height() + $('.application-page-header').height())
		}, 1000);
	});
	
	
	//Date Picker for Application Page
	//by: RMN
	// 18 year ago date
	var dob_end_date = new Date();
	dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
	
	// 86 year ago date
	var dob_start_date = new Date();
	dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
	dob_start_date.setDate(dob_start_date.getDate()+1);
	
	
	if($("#personal-info-datePicker").length > 0) {
		$('#personal-info-datePicker').datepicker({
			startView: "decade",
			startDate: dob_start_date,
			endDate: dob_end_date,
			autoclose: true,
		});
	}
	
	
	$('#checkHKValidID').click(function(){
		var hkid=$('#sampleValidHKID').val();	
		console.log('Answer:'+isValidHKID(hkid));

	});
	
	$("#savieApplicantBean\\.addressIsSame").change(function() {
		if(this.checked) {
			//console.log('Check');
			if($('#correspondence-address').hasClass('hidden')){
				$('#correspondence-address').removeClass('hidden');
			}
			
			$('#personal-info-next').addClass('correspondence');
		}
		else{
			$('#correspondence-address').addClass('hidden');
			
			if($('#personal-info-next').hasClass('correspondence')){
				$('#personal-info-next').removeClass('correspondence');
			}
		}
	});
	
	//hide or show HKID / Passport text box on dropdown change for Form 1
	
	$( "#beneficiaryHkidPassport\\[0\\]" ).on('change', function() {
		var str = "";
		$( "#beneficiaryHkidPassport\\[0\\] option:selected" ).each(function() {
			
			str = $( this ).val();
			if(str == 'HKID'){
				//textbox
				$('#savieBeneficiaryBean\\[0\\]\\.passportNo').addClass('hidden');
				if($('#savieBeneficiaryBean\\[0\\]\\.hkId').hasClass('hidden')){
					$('#savieBeneficiaryBean\\[0\\]\\.hkId').removeClass('hidden');
				}
				
				
				if($('#hkidOrPassportMessage\\[0\\]').hasClass('hidden')){
					$('#hkidOrPassportMessage\\[0\\]').removeClass('hidden');
				}
				
				$('#bnfPassportMessage\\[0\\]').addClass('hidden');
				$('#duplicate-beneficiariesPAssport\\[0\\]').addClass('hidden');
				

			}else{
				//textbox
				$('#savieBeneficiaryBean\\[0\\]\\.hkId').addClass('hidden');
				if($('#savieBeneficiaryBean\\[0\\]\\.passportNo').hasClass('hidden')){
					$('#savieBeneficiaryBean\\[0\\]\\.passportNo').removeClass('hidden');
				}
				
				if($('#bnfPassportMessage\\[0\\]').hasClass('hidden')){
					$('#bnfPassportMessage\\[0\\]').removeClass('hidden');
				}
				
				$('#hkidOrPassportMessage\\[0\\]').addClass('hidden');
				$('#duplicate-beneficiaries\\[0\\]').addClass('hidden');
			}
			
			
		});
		
	}).change();
	
	


	function isValidHKID(hkid){
		if(hkid!=''){
			var checkSumRegex = /(.{1})\s*$/;
			var checkSum = checkSumRegex.exec(hkid);
			
			console.log('CheckSum'+checkSum);
			
			var hkidCheckBit = hkid.replace(/^(.*).{1} /,'');
			var hkidCheckBitArr = hkidCheckBit.split("");
			
			var isValid='';
			var i , n , alphaEquivalentInt, hkidSum;
			for(i=hkidCheckBitArr.length,n=0 ;n>=hkidCheckBitArr.length,i>=2;i--,n++){
				
				console.log(hkidCheckBitArr[n]+":"+i);
				var sum;
				if (/[A-Z]/i.test(hkidCheckBitArr[n])) {
					alphaEquivalentInt = equivalentInteger(hkidCheckBitArr[n]);
					sum = alphaEquivalentInt*i;
					hkidSum = sum;
				}else{
					sum = hkidCheckBitArr[n]*i;
					hkidSum+=sum;
				}
				
			}
			
			console.log('Sum'+hkidSum);
			
			var hkidSumMod11 = 11- (hkidSum % 11);
			
			if(hkidSumMod11 == checkSum[1]){
				isValid= 'Valid';
				console.log('Valid');
			}else{
				isValid = 'Invalid';
				console.log('Invalid');
			}
		}
		else{
			//isValid = 'Invalid';
		}
		return isValid;
	}
	
	function equivalentInteger(hkidChar){
		var digit;
		switch(hkidChar){
			case 'A':
			case 'L':
			case 'M':
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
	
	
	
	$('#beneficiary-info-next').click(function(){
		var bootstrapValidator1 = $('#beneficiaryInfoForm\\[0\\]').data('bootstrapValidator');
		bootstrapValidator1.enableFieldValidators('savieBeneficiaryBean[0].passportNo',true, $(this).val() == 'Passport');
		bootstrapValidator1.enableFieldValidators('savieBeneficiaryBean[0].hkId',true, $(this).val() == 'HKID');
		
		
		$('#beneficiaryInfoForm\\[0\\]').submit();
		
		if(isBeneficiaryPerson2Hidden() != "hidden"){
			var bootstrapValidator2 = $('#beneficiaryInfoForm\\[1\\]').data('bootstrapValidator');
			bootstrapValidator2.enableFieldValidators('savieBeneficiaryBean[1].passportNo',true, $(this).val() == 'Passport');
			bootstrapValidator2.enableFieldValidators('savieBeneficiaryBean[1].hkId',true, $(this).val() == 'HKID');
			$('#beneficiaryInfoForm\\[1\\]').submit();
			
		}
	
		if(isBeneficiaryPerson3Hidden() != "hidden"){
			var bootstrapValidator3 = $('#beneficiaryInfoForm\\[2\\]').data('bootstrapValidator');
			bootstrapValidator3.enableFieldValidators('savieBeneficiaryBean[2].passportNo',true, $(this).val() == 'Passport');
			bootstrapValidator3.enableFieldValidators('savieBeneficiaryBean[2].hkId',true, $(this).val() == 'HKID');
			$('#beneficiaryInfoForm\\[2\\]').submit();
		}
		
		
		if(  (($('#beneficiaryInfoForm\\[1\\] div').hasClass('has-error')) && (isBeneficiaryPerson2Hidden()!="hidden"))	||
			 (($('#beneficiaryInfoForm\\[0\\] div').hasClass('has-error'))) ||
			 (($('#beneficiaryInfoForm\\[2\\] div').hasClass('has-error')) && (isBeneficiaryPerson3Hidden()!="hidden"))  ){
			//has error do nothing
			console.log('Form has error');
		}else{
			console.log('Form 1 has no error');
			$('html, body').animate({
				scrollTop: $('#payment').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
		}
		
		if($('#own-estate-now').is(':checked')) { 
			$('html, body').animate({
				scrollTop: $('#payment').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
		}else{
			//do nothing
		}
		

		//check for Duplicate HKID in Beneficiaries 
		applicantDuplicateBeneficiaries();
		
		//check for Duplicate Passport in Beneficiaries
		applicantDuplicateBeneficiariesPassport();
		
		//check for Beneficiaries Duplicate Chinese Name
		applicantDuplicateBeneficicaryChineseName();
		
		//check for Beneficiaries English Name
		applicantDuplicateBeneficiaryEnglishName();
		
	});
	
	
	function totalBeneficiaryEntitlement(){
		var doesExceed ='';
		var beneficiaryEntitlement1 =  $('#savieBeneficiaryBean\\[0\\]\\.entitlement').val() != "" ? $('#savieBeneficiaryBean\\[0\\]\\.entitlement').val(): '0';
		var beneficiaryEntitlement2 =  (($('#savieBeneficiaryBean\\[1\\]\\.entitlement').val() != "") && 
										(typeof $('#savieBeneficiaryBean\\[1\\]\\.entitlement').val()!='undefined')) ? $('#savieBeneficiaryBean\\[1\\]\\.entitlement').val(): '0';
		var beneficiaryEntitlement3 =  (($('#savieBeneficiaryBean\\[2\\]\\.entitlement').val() != "") &&
										(typeof $('#savieBeneficiaryBean\\[2\\]\\.entitlement').val()!='undefined')) ? $('#savieBeneficiaryBean\\[2\\]\\.entitlement').val(): '0';
		
		var beneficiaryEntitlementSum = parseInt(beneficiaryEntitlement1) + parseInt(beneficiaryEntitlement2) + parseInt(beneficiaryEntitlement3);
		
		if(beneficiaryEntitlementSum>100){
			doesExceed = "Exceed";
		}else{
			doesExceed = "Does not exceed";
		}
		return doesExceed;
	}

	//Validate Form On Button 2 Click
	$("#add-beneficiary-button-3").click(function(){
		$( "#beneficiaryHkidPassport\\[2\\]" ).on('change', function() {
			console.log('Form 1 on change');
			var str = "";
			$( "#beneficiaryHkidPassport\\[2\\] option:selected" ).each(function() {
				str = $( this ).text();
				if(str == 'HKID'){
					//textbox
					$('#savieBeneficiaryBean\\[2\\]\\.passportNo').addClass('hidden');
					if($('#savieBeneficiaryBean\\[2\\]\\.hkId').hasClass('hidden')){
						$('#savieBeneficiaryBean\\[2\\]\\.hkId').removeClass('hidden');
					}
					if($('#hkidOrPassportMessage\\[2\\]').hasClass('hidden')){
						$('#hkidOrPassportMessage\\[2\\]').removeClass('hidden');
					}
					$('#bnfPassportMessage\\[2\\]').addClass('hidden');	
					$('#duplicate-beneficiariesPAssport\\[2\\]').addClass('hidden');		
				}else{
					$('#savieBeneficiaryBean\\[2\\]\\.hkId').addClass('hidden');
					if($('#savieBeneficiaryBean\\[2\\]\\.passportNo').hasClass('hidden')){
						$('#savieBeneficiaryBean\\[2\\]\\.passportNo').removeClass('hidden');
					}
					
					if($('#bnfPassportMessage\\[2\\]').hasClass('hidden')){
						$('#bnfPassportMessage\\[2\\]').removeClass('hidden');
					}
					
					$('#hkidOrPassportMessage\\[2\\]').addClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').addClass('hidden');
				}
			});
		}).change();
		
		//Beneficiary Info Form [2]
		//by: RMN
		$('#beneficiaryInfoForm\\[2\\]').bootstrapValidator({
			fields: {
				'savieBeneficiaryBean[2].firstName':{
					container: '#beneficiaryFnameMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please input your given name.'
						},
						stringLength: {
							min: 1,
							max: 25,
							message: 'Cannot exceed 25 characters'
						},
						regexp: {
							regexp: /^[a-zA-Z0-9]*$/,
							message: 'Please input your given name.'
						}
					}
				},
				'savieBeneficiaryBean[2].lastName':{
					container: '#beneficiaryLnameMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please input your last name.'
						},
						stringLength: {
							min: 1,
							max: 25,
							message: 'Cannot exceed 25 characters'
						},
						regexp: {
							regexp: /^[a-zA-Z0-9]*$/,
							message: 'Please input your last name.'
						}
					}
				},
				'savieBeneficiaryBean[2].chineseName':{
					container: '#beneficiaryChineseNameMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please input your Chinese name.'
						},
						stringLength: {
							min: 1,
							max: 6,
							message: 'Cannot exceed 6 characters.'
						},
						regexp: {
							regexp: /^[^a-zA-Z0-9]*$/,
							message: 'Please input your Chinese name.'
						}
					}
				},
				'savieBeneficiaryBean[2].passportNo':{
					container: '#bnfPassportMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please input beneficiary Passport Number.'
						}
					}
				},
				'savieBeneficiaryBean[2].hkId':{
					container: '#hkidOrPassportMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please enter Beneficiary HKID No.'
						},
						regexp: {
							regexp: /^[A-Z0-9]*$/,
							message: 'The HKID No. is invalid.'
						},
						callback: {
							message: 'The HKID No. is invalid.',
							callback: function (value, validator, $field) {
								var res = value.match(/^[A-Z0-9]*$/);
								
								if( (res == null) || (res == '')){
									return {
										valid: false,
										message: ''
									};
								}else{
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}
								
								
								if(value!=""){
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}else{
									return {
										valid: false,
										message: ''
									};
								}
							
							}
						}
					}
				},
				'savieBeneficiaryBean[2].relationship':{
					container: '#relationshipMessage\\[2\\]',
					validators: {
						notEmpty: {
							message: 'Please select the Beneficiary Relationship with You.'
						}
					}
				},
				'savieBeneficiaryBean[2].entitlement':{
					container: '#entitlementMessage\\[2\\]',
					validators: {
						regexp: {
							regexp: /^(?:[1-9]\d?|100)$/,
							message: 'Please enter the Entitlement in integer.'
						},
						callback: {
							message: 'Total Beneficiary Entitlement exceeds 100%.',
							callback: function (value, validator, $field) {
								if(totalBeneficiaryEntitlement() == "Exceed"){
									return false;
								}else{
									return true;
								}
							}
						}
					}
				}
			}
		});
	});
	
	
	
	//Validate Form On Button 2 Click
	$("#add-beneficiary-button-2").click(function(){
		//Beneficiary Info Form [1]
		//by: RMN
		$( "#beneficiaryHkidPassport\\[1\\]" ).on('change', function() {
			console.log('Form 1 on change');
			var str = "";
			$( "#beneficiaryHkidPassport\\[1\\] option:selected" ).each(function() {
				
				str = $( this ).text();
				if(str == 'HKID'){
					console.log('HKID');
					//textbox
					$('#savieBeneficiaryBean\\[1\\]\\.passportNo').addClass('hidden');
					if($('#savieBeneficiaryBean\\[1\\]\\.hkId').hasClass('hidden')){
						$('#savieBeneficiaryBean\\[1\\]\\.hkId').removeClass('hidden');
					}
					
					
					if($('#hkidOrPassportMessage\\[1\\]').hasClass('hidden')){
						$('#hkidOrPassportMessage\\[1\\]').removeClass('hidden');
					}
					
					$('#bnfPassportMessage\\[1\\]').addClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[1\\]').addClass('hidden');	
					
				}else{
					//textbox
					console.log('PAssport');
					$('#savieBeneficiaryBean\\[1\\]\\.hkId').addClass('hidden');
					if($('#savieBeneficiaryBean\\[1\\]\\.passportNo').hasClass('hidden')){
						$('#savieBeneficiaryBean\\[1\\]\\.passportNo').removeClass('hidden');
					}
					
					if($('#bnfPassportMessage\\[1\\]').hasClass('hidden')){
						$('#bnfPassportMessage\\[1\\]').removeClass('hidden');
					}
					
					$('#hkidOrPassportMessage\\[1\\]').addClass('hidden');
					$('#duplicate-beneficiaries\\[1\\]').addClass('hidden');
				}
				
				
			});
			
		}).change();		
		
		$('#beneficiaryInfoForm\\[1\\]').bootstrapValidator({
			fields: {
				'savieBeneficiaryBean[1].firstName':{
					container: '#beneficiaryFnameMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please input your given name.'
						},
						stringLength: {
							min: 1,
							max: 25,
							message: 'Cannot exceed 25 characters'
						},
						regexp: {
							regexp: /^[a-zA-Z0-9]*$/,
							message: 'Please input your given name.'
						}
					}
				},
				'savieBeneficiaryBean[1].lastName':{
					container: '#beneficiaryLnameMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please input your last name.'
						},
						stringLength: {
							min: 1,
							max: 25,
							message: 'Cannot exceed 25 characters'
						},
						regexp: {
							regexp: /^[a-zA-Z0-9]*$/,
							message: 'Please input your last name.'
						}
					}
				},
				'savieBeneficiaryBean[1].chineseName':{
					container: '#beneficiaryChineseNameMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please input your Chinese name.'
						},
						stringLength: {
							min: 1,
							max: 6,
							message: 'Cannot exceed 6 characters.'
						},
						regexp: {
							regexp: /^[^a-zA-Z0-9]*$/,
							message: 'Please input your Chinese name.'
						}
					}
				},
				'savieBeneficiaryBean[1].passportNo':{
					container: '#bnfPassportMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please input beneficiary Passport Number.'
						}
					}
				},
				'savieBeneficiaryBean[1].hkId':{
					container: '#hkidOrPassportMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please enter Beneficiary HKID No.'
						},
						regexp: {
							regexp: /^[A-Z0-9]*$/,
							message: 'The HKID No. is invalid.'
						},
						callback: {
							message: 'The HKID No. is invalid.',
							callback: function (value, validator, $field) {
								var res = value.match(/^[A-Z0-9]*$/);
								
								if( (res == null) || (res == '')){
									return {
										valid: false,
										message: ''
									};
								}else{
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}
								
								if(value!=""){
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}else{
									return {
										valid: false,
										message: ''
									};
								}
							
							}
						}
					}
				},
				'savieBeneficiaryBean[1].relationship':{
					container: '#relationshipMessage\\[1\\]',
					validators: {
						notEmpty: {
							message: 'Please select the Beneficiary Relationship with You.'
						}
					}
				},
				'savieBeneficiaryBean[1].entitlement':{
					container: '#entitlementMessage\\[1\\]',
					validators: {
						regexp: {
							regexp: /^(?:[1-9]\d?|100)$/,
							message: 'Please enter the Entitlement in integer.'
						},
						callback: {
							message: 'Total Beneficiary Entitlement exceeds 100%.',
							callback: function (value, validator, $field) {
								if(totalBeneficiaryEntitlement() == "Exceed"){
									return false;
								}else{
									return true;
								}
							}
						}
					}
				}
			}
		});		
	});

	
	//Beneficiary Info Form [0]
	//by: RMN
	var counter = 0;
				
	$('#beneficiaryInfoForm\\[0\\]').bootstrapValidator({
		fields: {
			'savieBeneficiaryBean[0].firstName':{
				container: '#beneficiaryFnameMessage\\[0\\]',
				validators: {
					notEmpty: {
						message: 'Please input your given name.'
                    },
					stringLength: {
                        min: 1,
                        max: 25,
                        message: 'Cannot exceed 25 characters'
                    },
					regexp: {
						regexp: /^[a-zA-Z0-9]*$/,
						message: 'Please input your given name.'
					}
				}
			},
			'savieBeneficiaryBean[0].lastName':{
				container: '#beneficiaryLnameMessage\\[0\\]',
				validators: {
					notEmpty: {
						message: 'Please input your last name.'
                    },
					stringLength: {
                        min: 1,
                        max: 25,
                        message: 'Cannot exceed 25 characters'
                    },
					regexp: {
						regexp: /^[a-zA-Z0-9]*$/,
						message: 'Please input your last name.'
					}
				}
			},
			'savieBeneficiaryBean[0].chineseName':{
				container: '#beneficiaryChineseNameMessage\\[0\\]',
				validators: {
					notEmpty: {
						message: 'Please input your Chinese name.'
                    },
					stringLength: {
                        min: 1,
                        max: 6,
                        message: 'Cannot exceed 6 characters.'
                    },
					regexp: {
						regexp: /^[^a-zA-Z0-9]*$/,
						message: 'Please input your Chinese name.'
					}
				}
			},
			'savieBeneficiaryBean[0].passportNo':{
				container: '#bnfPassportMessage\\[0\\]',
			//	enabled: true,
				validators: {
					notEmpty: {
						message: 'Please input beneficiary Passport Number.'
                    }
				}
			},
			'savieBeneficiaryBean[0].hkId':{
				container: '#hkidOrPassportMessage\\[0\\]',
			//	enabled: true,
				validators: {
					notEmpty: {
						message: 'Please enter Beneficiary HKID No.'
					},
					regexp: {
						regexp: /^[A-Z0-9]*$/,
						message: 'The HKID No. is invalid.'
					},
					callback: {
                        message: 'Your HKID No. is invalid.',
                        callback: function (value, validator, $field) {
							var res = value.match(/^[A-Z0-9]*$/);
								
							if( (res == null) || (res == '')){
								return {
									valid: false,
									message: ''
								};
							}else{
								if(isValidHKID(value) == 'Valid'){
									return true;
								}
								else{
									return false;
								}
							}
								
								
							if(value!=""){
								if(isValidHKID(value) == 'Valid'){
									return true;
								}
								else{
									return false;
								}
							}else{
								return {
									valid: false,
									message: ''
								};
							}
                           
                        }
                    }
				}
			},
			'savieBeneficiaryBean[0].relationship':{
				container: '#relationshipMessage\\[0\\]',
				validators: {
					notEmpty: {
						message: 'Please select the Beneficiary Relationship with You.'
					}
				}
			},
			'savieBeneficiaryBean[0].entitlement':{
				container: '#entitlementMessage\\[0\\]',
				validators: {
					regexp: {
						regexp: /^(?:[1-9]\d?|100)$/,
						message: 'Please enter the Entitlement in integer.'
					},
					callback: {
						message: 'Total Beneficiary Entitlement exceeds 100%.',
						callback: function (value, validator, $field) {
							if(totalBeneficiaryEntitlement() == "Exceed"){
								return false;
							}else{
								return true;
							}
						}
					}
				}
			}
		}
	});
	
	
	$('#employment-info-next').click(function(){
		//Employment Info Form
		//by: RMN
		$('#employmentInfoForm').bootstrapValidator({
			fields:{
				'savieEmploymentBean.employmentStatus':{
					container: '#employmentStatusMessage',
					validators: {
						notEmpty: {
							message: 'Please select your Employment Status.'
						}
					}
				},
				'savieEmploymentBean.occupation':{
					container: '#occupationMessage',
					validators: {
						notEmpty: {
							message: 'Please select an Occupation.'
						}
					}
				},
				'savieEmploymentBean.natureOfBusiness':{
					container: '#natureOfBusinessMessage',
					validators: {
						notEmpty: {
							message: 'Please select a Nature of Business.'
						}
					}
				},
				'savieEmploymentBean.monthlyPersonalIncome':{
					container: '#monthlyIncomeMessage',
					validators: {
						notEmpty: {
							message: 'Please select your Monthly Personal Income (HK$).'
						}
					}
				}
			}
		});
		
		
		if($('#employmentInfoForm div').hasClass('has-error')){
		
		}else{
			$('html, body').animate({
				scrollTop: $('#beneficiary-info').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
		}
	});
	
	
	
	
	//on button click
	//Insured Info Form
	//by: RMN
	
	$('#personal-info-next').click(function(){
		
		$('#insuredInfoForm').bootstrapValidator({
			fields: {
				//if checkbox is unticked
				'savieApplicantBean.residentialAdress1': {
					container: '#resLine1Message',
					validators: {
						notEmpty: {
							message: 'Please enter your Address.'
						},
						stringLength: {
							min: 4,
							max: 100,
							message: 'Please enter your Address.'
						}
					}
				},
				//if checkbox is unticked
				'savieApplicantBean.residentialDistrict': {
					container: '#resDistrictMessage',
					validators: {
						notEmpty: {
							message: 'Please select a district.'
						}
					}
				},
				'savieApplicantBean.mobileNo': {
					container: '#applicantMobNum',
					validators: {
						stringLength: {
							min: 11,
							max: 11,
							message: 'Mobile No. should be in 8 digit.'
						}
					}
				},
				'savieApplicantBean.hkId': {
					container: '#hkidMessage',
					validators: {
						notEmpty: {
							message: 'Please enter your HKID No.'
						},
						regexp: {
							regexp: /^[A-Z0-9]*$/,
							message: 'Your HKID No. is invalid.'
						},
						callback: {
							message: 'Your HKID No. is invalid.',
							callback: function (value, validator, $field) {
								
								var res = value.match(/^[A-Z0-9]*$/);
								
								if( (res == null) || (res == '')){
									return {
										valid: false,
										message: ''
									};
								}else{
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}
							
								
								if((value!="")){
									if(isValidHKID(value) == 'Valid'){
										return true;
									}
									else{
										return false;
									}
								}else{
									return {
										valid: false,
										message: ''
									};
								}
								
								
							}
						}
					}
				},
				'savieApplicantBean.maritalStatus':{
					container: '#maritalStatusMessage',
					validators: {
						notEmpty: {
							message: 'Please select your Marital Status.'
						}
					}
				},
				'savieApplicantBean.emailAddress':{
					container: '#emailMessage',
					validators: {
						notEmpty: {
							message: 'Please enter your Email Address.'
						},
						regexp:{
							regexp:/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
							message: 'Your Email Address is invalid.'
						}
					}
				},
				'savieApplicantBean[0].mobileNo':{
					container: '#mobilePrefixMessage',
					validators: {
						regexp:{
							regexp: /^[5689][0-9]{2}$/,
							message: 'Your Mobile No. is invalid.'
						}
					}
				},
				'savieApplicantBean[1].mobileNo':{
					container: '#mobileSuffixMessage',
					validators: {
						regexp:{
							regexp: /^[0-9]{4}$/,
							message: 'Mobile No. should be in 8 digit.'
						}
					}
				},
				'savieApplicantBean[2].mobileNo':{
					container: '#mobileSuffixSecondMessage',
					validators: {
						regexp:{
							regexp: /^[0-9]{4}$/,
							message: 'Mobile No. should be in 8 digit.'
						}
					}
				},
				'savieApplicantBean[0].residentialTelNo':{
					container: '#resTelPrefixMessage',
					validators: {
						regexp:{
							regexp: /^[0-9]{4}$/,
							message: 'Your Telephone No. is invalid.'
						}
					}
				},
				'savieApplicantBean[1].residentialTelNo':{
					container: '#resTelSuffixMessage',
					validators: {
						regexp:{
							regexp: /^[0-9]{4}$/,
							message: 'Your Telephone No. is invalid.'
						}
					}
				},
				'savieApplicantBean[2].residentialTelNo':{
					container: '#resTelSuffixSecondMessage',
					validators: {
						regexp:{
							regexp: /^[0-9]{4}$/,
							message: 'Your Telephone No. is invalid.'
						}
					}
				},
				'savieApplicantBean.placeOfBirth':{
					container: '#placeOfBirthMessage',
					validators: {
						notEmpty: {
							message: 'Must select place of birth.'
						}
					}
				},
				'savieApplicantBean.nationality':{
					container: '#nationalityMessage',
					validators: {
						notEmpty: {
							message: 'Please select your Nationality.'
						}
					}
				},
				'savieApplicantBean.birthday':{
					container: '#dobMessage',
					validators: {
						notEmpty: {
							message: 'Please enter date of birth.'
						}
					}
				}
				
			}
		});
		
		if($("#insuredInfoForm div").hasClass('has-error')){
		
		}else{
			$('html, body').animate({
				scrollTop: $('#employment-info').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
		
		}
	
	});
	
	$('#dup-bnf-btn').click(function(){
		//Duplicate HK ID
		//applicantDuplicateBeneficiaries();
		
		//Duplicate Chinese Name
		//applicantDuplicateBeneficicaryChineseName();
		
		//Duplicate English Name
		applicantDuplicateBeneficiaryEnglishName();
	});
});


function maxLengthCheck(object){
	if (object.value.length > object.maxLength)
	object.value = object.value.slice(0, object.maxLength)
}



//Duplicate Beneficiaries
function applicantDuplicateBeneficiaries(){
	var dupStr = duplicateBeneficiaries(); 
		
		if(dupStr!= ''){
			var result = /\d+(?:\.\d+)?/.exec(dupStr);
			
			switch(result.toString()){
				case '01':
					$('#duplicate-beneficiaries\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').addClass('hidden');
					break;
				case '02':
					$('#duplicate-beneficiaries\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[1\\]').addClass('hidden');
					break;
				case '12':
					$('#duplicate-beneficiaries\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[0\\]').addClass('hidden');
					break;
				case '012':
					$('#duplicate-beneficiaries\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').removeClass('hidden');
					break;
				default:
					$('#duplicate-beneficiaries\\[0\\]').addClass('hidden');
					$('#duplicate-beneficiaries\\[1\\]').addClass('hidden');
					$('#duplicate-beneficiaries\\[2\\]').addClass('hidden');
			}
			
		}else{
			$('#duplicate-beneficiaries\\[0\\]').addClass('hidden');
			$('#duplicate-beneficiaries\\[1\\]').addClass('hidden');
			$('#duplicate-beneficiaries\\[2\\]').addClass('hidden');
		}
	
}


//Check for Duplicate Beneficiaries
function duplicateBeneficiaries(){
	var isDup = '';
	var beneficiary1 = (($('#savieBeneficiaryBean\\[0\\]\\.hkId').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[0\\]\\.hkId').val() != "undefined") &&
						($('#savieBeneficiaryBean\\[0\\]\\.hkId').hasClass('hidden')==false)) ? '1': '0';
	var beneficiary2 = (($('#savieBeneficiaryBean\\[1\\]\\.hkId').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[1\\]\\.hkId').val() != "undefined") &&
						($('#savieBeneficiaryBean\\[1\\]\\.hkId').hasClass('hidden')==false)) ? '1': '0';	
	var beneficiary3 = (($('#savieBeneficiaryBean\\[2\\]\\.hkId').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[2\\]\\.hkId').val() != "undefined") &&
						($('#savieBeneficiaryBean\\[2\\]\\.hkId').hasClass('hidden')==false)) ? '1': '0';		


	var beneficiary1Val = $('#savieBeneficiaryBean\\[0\\]\\.hkId').val();		
	var beneficiary2Val = $('#savieBeneficiaryBean\\[1\\]\\.hkId').val();	
	var beneficiary3Val = $('#savieBeneficiaryBean\\[2\\]\\.hkId').val();		
	
	var beneficiary1isHidden = $('#savieBeneficiaryBean\\[0\\]\\.hkId').hasClass('hidden'); 
	var beneficiary2isHidden = $('#savieBeneficiaryBean\\[1\\]\\.hkId').hasClass('hidden'); 
	var beneficiary3isHidden = $('#savieBeneficiaryBean\\[2\\]\\.hkId').hasClass('hidden'); 
	
	
	if(((beneficiary1 == '1') && (beneficiary2 == '1')) ||
	   ((beneficiary2 == '1') && (beneficiary3 == '1')) ||
	   ((beneficiary1 == '1') && (beneficiary3 == '1'))) {
		
		if((beneficiary1Val == beneficiary2Val) || (beneficiary1Val == beneficiary3Val) || (beneficiary2Val == beneficiary3Val)){
			isDup = 'Duplicate';
		}else{
			isDup = '';
		}
		
		if ((beneficiary1Val == beneficiary2Val) && (beneficiary2Val== beneficiary3Val) &&
		    (!beneficiary1isHidden && !beneficiary2isHidden && !beneficiary3isHidden)){
			isDup+='012';
		}else if((beneficiary1Val == beneficiary2Val) && (!beneficiary1isHidden && !beneficiary2isHidden)){
			isDup+='01';
		}else if ((beneficiary1Val == beneficiary3Val) && (!beneficiary1isHidden && !beneficiary3isHidden)){
			isDup+='02';
		}else if ((beneficiary2Val == beneficiary3Val) && (!beneficiary2isHidden && !beneficiary3isHidden)){
			isDup+='12';
		}else{
			//do nothing
		} 
		
	}else{
		//do nothing
		isDup = '';
	}
	return isDup;
	

}


//Duplicate Beneficiaries
function applicantDuplicateBeneficiariesPassport(){
	var dupStr = duplicateBeneficiariesPassport(); 
		
		if(dupStr!= ''){
			var result = /\d+(?:\.\d+)?/.exec(dupStr);
			
			switch(result.toString()){
				case '01':
					$('#duplicate-beneficiariesPAssport\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[2\\]').addClass('hidden');
					break;
				case '02':
					$('#duplicate-beneficiariesPAssport\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[2\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[1\\]').addClass('hidden');
					break;
				case '12':
					$('#duplicate-beneficiariesPAssport\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[2\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[0\\]').addClass('hidden');
					break;
				case '012':
					$('#duplicate-beneficiariesPAssport\\[0\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[1\\]').removeClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[2\\]').removeClass('hidden');
					break;
				default:
					$('#duplicate-beneficiariesPAssport\\[0\\]').addClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[1\\]').addClass('hidden');
					$('#duplicate-beneficiariesPAssport\\[2\\]').addClass('hidden');
			}
			
		}else{
			$('#duplicate-beneficiariesPAssport\\[0\\]').addClass('hidden');
			$('#duplicate-beneficiariesPAssport\\[1\\]').addClass('hidden');
			$('#duplicate-beneficiariesPAssport\\[2\\]').addClass('hidden');
		}
	
}


//Check for Duplicate Beneficiaries
function duplicateBeneficiariesPassport(){
	var isDup = '';
	var beneficiaryPassport1 = (($('#savieBeneficiaryBean\\[0\\]\\.passportNo').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[0\\]\\.passportNo').val() != "undefined") &&
								($('#savieBeneficiaryBean\\[0\\]\\.passportNo').hasClass('hidden') == false)) ? '1': '0';
	var beneficiaryPassport2 = (($('#savieBeneficiaryBean\\[1\\]\\.passportNo').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[1\\]\\.passportNo').val() != "undefined") &&
								($('#savieBeneficiaryBean\\[1\\]\\.passportNo').hasClass('hidden') == false)) ? '1': '0';	
	var beneficiaryPassport3 = (($('#savieBeneficiaryBean\\[2\\]\\.passportNo').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[2\\]\\.passportNo').val() != "undefined") &&
								($('#savieBeneficiaryBean\\[2\\]\\.passportNo').hasClass('hidden') == false)) ? '1': '0';			

	var beneficiary1PassportVal = $('#savieBeneficiaryBean\\[0\\]\\.passportNo').val();		
	var beneficiary2PassportVal = $('#savieBeneficiaryBean\\[1\\]\\.passportNo').val();	
	var beneficiary3PassportVal = $('#savieBeneficiaryBean\\[2\\]\\.passportNo').val();		
	
	var beneficiaryPassport1isHidden = $('#savieBeneficiaryBean\\[0\\]\\.passportNo').hasClass('hidden'); 
	var beneficiaryPassport2isHidden = $('#savieBeneficiaryBean\\[1\\]\\.passportNo').hasClass('hidden'); 
	var beneficiaryPassport3isHidden = $('#savieBeneficiaryBean\\[2\\]\\.passportNo').hasClass('hidden'); 
						
	
	if(((beneficiaryPassport1 == '1') && (beneficiaryPassport2 == '1')) ||
	   ((beneficiaryPassport2 == '1') && (beneficiaryPassport3 == '1')) ||
	   ((beneficiaryPassport1 == '1') && (beneficiaryPassport3 == '1'))) {
		
		if((beneficiary1PassportVal == beneficiary2PassportVal) || (beneficiary1PassportVal == beneficiary3PassportVal) || (beneficiary2PassportVal == beneficiary3PassportVal)){
			isDup = 'Duplicate';
		}else{
			isDup = '';
		}
		
		if ((beneficiary1PassportVal == beneficiary2PassportVal) && (beneficiary2PassportVal== beneficiary3PassportVal) &&
			(!beneficiaryPassport1isHidden && !beneficiaryPassport2isHidden && !beneficiaryPassport3isHidden)){
			isDup+='012';
		}else if((beneficiary1PassportVal == beneficiary2PassportVal) && 
				(!beneficiaryPassport1isHidden && !beneficiaryPassport2isHidden)){
			isDup+='01';
		}else if ((beneficiary1PassportVal == beneficiary3PassportVal) &&
				(!beneficiaryPassport1isHidden && !beneficiaryPassport3isHidden)){
			isDup+='02';
		}else if ((beneficiary2PassportVal == beneficiary3PassportVal) && 
				(!beneficiaryPassport2isHidden && !beneficiaryPassport3isHidden)){
			isDup+='12';
		}else{
			//do nothing
		} 
		
	}else{
		//do nothing
		isDup = '';
	}
	return isDup;
	

}





//Duplicate Chinese Name
function applicantDuplicateBeneficicaryChineseName(){
	var dupStr = duplicateChineseName(); 
	
	if(dupStr!= ''){
			var result = /\d+(?:\.\d+)?/.exec(dupStr);
			
			switch(result.toString()){
				case '01':
					$('#duplicate-chinese-name\\[0\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[1\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[2\\]').addClass('hidden');
					break;
				case '02':
					$('#duplicate-chinese-name\\[0\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[2\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[1\\]').addClass('hidden');
					break;
				case '12':
					$('#duplicate-chinese-name\\[1\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[2\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[0\\]').addClass('hidden');
					break;
				case '012':
					$('#duplicate-chinese-name\\[0\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[1\\]').removeClass('hidden');
					$('#duplicate-chinese-name\\[2\\]').removeClass('hidden');
					break;
				default:
					$('#duplicate-chinese-name\\[0\\]').addClass('hidden');
					$('#duplicate-chinese-name\\[1\\]').addClass('hidden');
					$('#duplicate-chinese-name\\[2\\]').addClass('hidden');
			}
			
		}else{
			$('#duplicate-chinese-name\\[0\\]').addClass('hidden');
			$('#duplicate-chinese-name\\[1\\]').addClass('hidden')
			$('#duplicate-chinese-name\\[2\\]').addClass('hidden')
		}
}


//Check for Duplicate Chinese Name
function duplicateChineseName(){
	var isDup = '';
	var chineseName1 = (($('#savieBeneficiaryBean\\[0\\]\\.chineseName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[0\\]\\.chineseName').val() != "undefined")) ? '1': '0';
	var chineseName2 = (($('#savieBeneficiaryBean\\[1\\]\\.chineseName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[1\\]\\.chineseName').val() != "undefined")) ? '1': '0';
	var chineseName3 = (($('#savieBeneficiaryBean\\[2\\]\\.chineseName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[2\\]\\.chineseName').val() != "undefined")) ? '1': '0';

	var chineseName1Val = $('#savieBeneficiaryBean\\[0\\]\\.chineseName').val();		
	var chineseName2Val = $('#savieBeneficiaryBean\\[1\\]\\.chineseName').val();	
	var chineseName3Val = $('#savieBeneficiaryBean\\[2\\]\\.chineseName').val();		
	
	
	if(((chineseName1 == '1') && (chineseName2 == '1')) ||
	   ((chineseName2 == '1') && (chineseName3 == '1')) ||
	   ((chineseName1 == '1') && (chineseName3 == '1'))) {
		
		if((chineseName1Val == chineseName2Val) || (chineseName1Val == chineseName3Val) || (chineseName2Val == chineseName3Val)){
			isDup = 'Duplicate';
		}else{
			isDup = '';
		}
		
		if ((chineseName1Val == chineseName2Val) && (chineseName2Val== chineseName3Val)){
			isDup+='012';
		}else if(chineseName1Val == chineseName2Val){
			isDup+='01';
		}else if (chineseName1Val == chineseName3Val){
			isDup+='02';
		}else if (chineseName2Val == chineseName3Val){
			isDup+='12';
		}else{
			//do nothing
		} 
		
	}else{
		//do nothing
		isDup = '';
	}
	return isDup;
}


//Getting the FullName for Beneficiary 
function getBeneficiaryFullName0(){
	var fName = document.getElementById("savieBeneficiaryBean[0].firstName").value;
	var lName = document.getElementById("savieBeneficiaryBean[0].lastName").value;
	document.getElementById("savieBeneficiaryBean[0].fullName").value = fName + lName;
	
}

function getBeneficiaryFullName1(){
	var fName = document.getElementById("savieBeneficiaryBean[1].firstName").value;
	var lName = document.getElementById("savieBeneficiaryBean[1].lastName").value;
	document.getElementById("savieBeneficiaryBean[1].fullName").value = fName + lName;
	
}

function getBeneficiaryFullName2(){
	var fName = document.getElementById("savieBeneficiaryBean[2].firstName").value;
	var lName = document.getElementById("savieBeneficiaryBean[2].lastName").value;
	document.getElementById("savieBeneficiaryBean[2].fullName").value = fName + lName;
	
}

//Duplicate English Name
function duplicateEnglishName(){
	var isDup = '';
	var fullName1 = (($('#savieBeneficiaryBean\\[0\\]\\.fullName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[0\\]\\.fullName').val() != "undefined")) ? '1': '0';
	var fullName2 = (($('#savieBeneficiaryBean\\[1\\]\\.fullName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[1\\]\\.fullName').val() != "undefined")) ? '1': '0';
	var fullName3 = (($('#savieBeneficiaryBean\\[2\\]\\.fullName').val() != "") &&
						(typeof $('#savieBeneficiaryBean\\[2\\]\\.fullName').val() != "undefined")) ? '1': '0';						
	var fullName1Val = $('#savieBeneficiaryBean\\[0\\]\\.fullName').val();
	var fullName2Val = $('#savieBeneficiaryBean\\[1\\]\\.fullName').val();
	var fullName3Val = $('#savieBeneficiaryBean\\[2\\]\\.fullName').val();
	
	if(((fullName1 == '1') && (fullName2 == '1')) ||
	   ((fullName2 == '1') && (fullName3 == '1')) ||
	   ((fullName1 == '1') && (fullName3 == '1'))) {
		
		if((fullName1Val == fullName2Val) || (fullName1Val == fullName3Val) || (fullName2Val == fullName3Val)){
			isDup = 'Duplicate';
		}else{
			isDup = '';
		}
		
		if ((fullName1Val == fullName2Val) && (fullName2Val== fullName3Val)){
			isDup+='012';
		}else if(fullName1Val == fullName2Val){
			isDup+='01';
		}else if (fullName1Val == fullName3Val){
			isDup+='02';
		}else if (fullName2Val == fullName3Val){
			isDup+='12';
		}else{
			//do nothing
		} 
		
	}else{
		//do nothing
		isDup = '';
	}
	return isDup;	
}

function applicantDuplicateBeneficiaryEnglishName(){
	var dupStr = duplicateEnglishName(); 
		
		if(dupStr!= ''){
			var result = /\d+(?:\.\d+)?/.exec(dupStr);
			
			switch(result.toString()){
				case '01':
					$('#duplicate-english-name\\[0\\]').removeClass('hidden');
					$('#duplicate-english-name\\[1\\]').removeClass('hidden');
					$('#duplicate-english-name\\[2\\]').addClass('hidden');
					break;
				case '02':
					$('#duplicate-english-name\\[0\\]').removeClass('hidden');
					$('#duplicate-english-name\\[2\\]').removeClass('hidden');
					$('#duplicate-english-name\\[1\\]').addClass('hidden');
					break;
				case '12':
					$('#duplicate-english-name\\[1\\]').removeClass('hidden');
					$('#duplicate-english-name\\[2\\]').removeClass('hidden');
					$('#duplicate-english-name\\[0\\]').addClass('hidden');
					break;
				case '012':
					$('#duplicate-english-name\\[0\\]').removeClass('hidden');
					$('#duplicate-english-name\\[1\\]').removeClass('hidden');
					$('#duplicate-english-name\\[2\\]').removeClass('hidden');
					break;
				default:
					$('#duplicate-english-name\\[0\\]').addClass('hidden');
					$('#duplicate-english-name\\[1\\]').addClass('hidden');
					$('#duplicate-english-name\\[2\\]').addClass('hidden');
			}
			
		}else{
			$('#duplicate-english-name\\[0\\]').addClass('hidden');
			$('#duplicate-english-name\\[1\\]').addClass('hidden')
			$('#duplicate-english-name\\[2\\]').addClass('hidden')
		}
		
}



//check if Beneficary 2 is not hidden
function isBeneficiaryPerson2Hidden(){
	var isHide = "";
	if($('#beneficiaryInfoForm\\[1\\]').length == 0){
		isHide = "hidden";
	}else{
		if($('#beneficiaryInfoForm\\[1\\]').hasClass('hidden')){
			isHide = "hidden";
		}else{
			isHide = "not hidden";
		}
	}
	
	return isHide;
}


//check if Beneficiary 3 is not hidden
function isBeneficiaryPerson3Hidden(){
	var isHide = "";
	if($('#beneficiaryInfoForm\\[2\\]').length == 0){
		isHide = "hidden";
	}else{
		if($('#beneficiaryInfoForm\\[2\\]').hasClass('hidden')){
			isHide = "hidden";
		}else{
			isHide = "not hidden";
		}
	}
	
	return isHide;
}

