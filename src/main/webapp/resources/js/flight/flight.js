/* flight plan details your details validation */

function fPlanValid()
{
	var flag=true;
	$('#chk1').html('');
	$('#chk2').html('');
	
	$('#dobInvalid').html('');
	
	if($("#inputFullName").val().trim()==namePlaceholder.trim()){
    	$("#inputFullName").val('');
    }
	if($("#inputTxtAppHkid").val().trim()==hkidPlaceholder.trim()){
    	$("#inputTxtAppHkid").val('');
    }
	
	
	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;

	
	//first error element
	var firstErrorElementId="";
	
	

	


    if (fullname.trim() == "") {
    	document.getElementById("fullnameinvalid").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");
    	$("#inputFullName").addClass("invalid-field");
    	if(firstErrorElementId==""){
			firstErrorElementId="inputFullName";
		}
        flag = false;
    }
    
    if (appHkid.trim() == "") {
    	document.getElementById("errAppHkid").innerHTML = getBundle(getBundleLanguage, "applicant.hkId.notNull.message");
    	$("#inputTxtAppHkid").addClass("invalid-field");
    	if(firstErrorElementId==""){
			firstErrorElementId="inputTxtAppHkid";
		}
        flag = false;
    }
	else
	{
		var tr=IsHKID(appHkid.trim());
		if(tr==false)
		{
				
			document.getElementById("errAppHkid").innerHTML = getBundle(getBundleLanguage, "applicant.hkId.notValid.message");
			$("#inputTxtAppHkid").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputTxtAppHkid";
			}
        	flag = false;
		}
	}
    
    if (applicantDob.trim() == "") {
        document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
        $("#input_dob").addClass("invalid-field");
        if(firstErrorElementId==""){
			firstErrorElementId="input_dob";
		}
        flag = false;
    } else {
		 var age = document.getElementById("selectAgeRange1").value;
		 var applicantDobs = new Array();
		 applicantDobs = applicantDob.split("-");
		 var applicantDob1 = new Date(applicantDobs[2],applicantDobs[1] - 1,applicantDobs[0], 0, 0, 0, 0);
		 var applicantDobDate = new Date(applicantDob1);
		 var today = new Date();

		 var insured1Hkid = document.getElementById("txtInsuHkid1").value;
		 
		 var difference = Math.abs(today - applicantDobDate);
		 difference = Math.floor((difference + 1000 * 3600 * 24) / (1000 * 3600 * 24 * 365.25)); 
         // check only when same "id" found
		 if (age == 1) {
			 if ( difference > 18) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }  
		 } else if (age == 2) {
			 if ( difference < 18 || difference > 70) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }
		 } else if (age == 3) {
			 if ( difference < 71 || difference > 85) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }
		 }
	 }
    
    if (mobileNo.trim() == "") {
        document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
        $("#inputMobileNo").addClass("invalid-field");
        if(firstErrorElementId==""){
			firstErrorElementId="inputMobileNo";
		}
        flag = false;
    }
    else {        
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
            $("#inputMobileNo").addClass("invalid-field");
            if(firstErrorElementId==""){
    			firstErrorElementId="inputMobileNo";
    		}
            flag = false;
        }
    }

    if (emailId.trim() == "") {
        document.getElementById("emailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notNull.message");
        $("#inputEmailId").addClass("invalid-field");
        if(firstErrorElementId==""){
			firstErrorElementId="inputEmailId";
		}
        flag = false;
    }
    else {
        if (emailreg.test(emailId) == false) {
            document.getElementById("emailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notValid.message");
            $("#inputEmailId").addClass("invalid-field");
            if(firstErrorElementId==""){
    			firstErrorElementId="inputEmailId";
    		}
            flag = false;
        }
    }
    
   
// bug fix - avoid unnecessary validation if the user already login
	var isLogin = document.getElementById("isLogin").value;
	if (!isLogin)
	{
	   if( verifyUserBookingRegistration() === false)
		   flag = false;
	}
	


	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	var rowCountOther=document.getElementById("totalCountOther").value;
	var rowCountPersonal=document.getElementById("totalPersonalTraveller").value;

	for (var i = 1; i <= parseInt(rowCountPersonal) ; i++)
	{
		if($("#txtInsuFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtInsuFullName" + i).val('');
	    }
		if($("#txtInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtInsuHkid" + i).val('');
	    }
		
		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#txtInsuFullName"+i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtInsuFullName"+i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = "";
		}
		
		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			$("#selectAgeRange"+i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="selectAgeRange"+i;
			}
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}
		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message"); // "Please enter Insured Person's HKID No.";
			$("#txtInsuHkid" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtInsuHkid"+i;
			}
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				$("#txtInsuHkid" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="txtInsuHkid"+i;
				}
				flag = false;
			}
		}
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid"+j;
					}
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtChldInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid"+j;
					}
					flag = false;
				}
			}

			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtOtherInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherInsuHkid"+j;
					}
					flag = false;
				}
			}
		}
		var selectedValue = document.getElementById("personalselectBenificiary" + i).value;
		var HkidPass = document.getElementById("personalBenefitiaryHKId"+i).value;
		var selectPersonalBenefitiaryHkidPass = document.getElementById("selectPersonalBenefitiaryHkidPass" + i).value;
		
		if($("#personalBenefitiaryId" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#personalBenefitiaryId" + i).val('');
	    }
		if($("#personalBenefitiaryHKId" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#personalBenefitiaryHKId" + i).val('');
	    }
		
		
		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(HkidPass.trim());
//				if(tr==false)
//				{
//					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
//			
			
			if (document.getElementById("personalBenefitiaryId" + i).value.trim() == "")
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#personalBenefitiaryId" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="personalBenefitiaryId"+i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("personalBenefitiaryHKId" + i).value;
			
			if (selectPersonalBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="personalBenefitiaryHKId"+i;
					}
			    	flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId"+i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId"+i;
						}
						flag = false;
					}	
			    }
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="personalBenefitiaryHKId"+i;
					}
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId"+i;
						}
						flag = false;
					}
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#personalBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId"+i;
						}
			        	flag = false;
					}
				}

				
				
			}

		}
	}
	
	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{
		if($("#txtInsuFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtInsuFullName" + i).val('');
	    }
		if($("#txtInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtInsuHkid" + i).val('');
	    }
		

		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#txtInsuFullName" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtInsuFullName"+i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			$("#selectAgeRange" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="selectAgeRange"+i;
			}
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}



		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		
		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
			$("#txtInsuHkid" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtInsuHkid"+i;
			}
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				$("#txtInsuHkid" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="txtInsuHkid"+i;
				}
				flag = false;
			}
		}
		
		
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid"+j;
					}
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtChldInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid"+j;
					}
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtOtherInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherInsuHkid"+j;
					}
					flag = false;
				}
			}
		}
		
		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;
		var HkidPass = document.getElementById("adultBenefitiaryHKId"+i).value;

		
		var selectAdBenefitiaryHkidPass = document.getElementById("selectAdBenefitiaryHkidPass" + i).value;
		
		if($("#adultBenefitiaryId" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#adultBenefitiaryId" + i).val('');
	    }
		if($("#adultBenefitiaryHKId" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#adultBenefitiaryHKId" + i).val('');
	    }
		
		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(hkid.trim());
//				if(tr==false)
//				{
//					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
			
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#adultBenefitiaryId" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="adultBenefitiaryId"+i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("adultBenefitiaryHKId" + i).value;

			if (selectAdBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {				
				if (hkida.trim() == "") {
			    	$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="adultBenefitiaryHKId"+i;
					}
			    	flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId"+i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#erradultBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId"+i;
						}
						flag = false;
					}	
			    }
				
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="adultBenefitiaryHKId"+i;
					}
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId"+i;
						}
			        	flag = false;
					}
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#adultBenefitiaryHKId" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId"+i;
						}
			        	flag = false;
					}
				}

				
				
			}
			
			
		} 
			


	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		
		if($("#txtChldFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtChldFullName" + i).val('');
	    }
		if($("#txtChldInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtChldInsuHkid" + i).val('');
	    }
		
		var fullname = document.getElementById("txtChldFullName" + i).value;
		var age = document.getElementById("selectchildAgeRange" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			$("#txtChldFullName" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtChldFullName"+i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errchildRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message"); // getBundle(getBundleLanguage, "insured.age.notValid.message");;
			$("#selectchildAgeRange" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="selectchildAgeRange"+i;
			}
			flag = false;
		}else{
			document.getElementById("errchildRange" + i).innerHTML = "";
		}
		
		
		
		
		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		
		
		
		if (hkid.trim() == "") {
			document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
			$("#txtChldInsuHkid" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtChldInsuHkid"+i;
			}
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				$("#txtChldInsuHkid" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="txtChldInsuHkid"+i;
				}
				flag = false;
			}
		}
		
		if (hkid.trim() != "") {
			
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtChldInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid"+j;
					}
					flag = false;
				}
			}
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtOtherInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherInsuHkid"+j;
					}
					flag = false;
				}
			}
		}
		
		
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		var HkidPass = document.getElementById("txtchildInsuHkid"+i).value;
		var selectedChldBenefitiaryHkidPass = document.getElementById("selectChldBenefitiaryHkidPass" + i).value;

		
		if($("#childBenefitiaryName" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#childBenefitiaryName" + i).val('');
	    }
		if($("#txtchildInsuHkid" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#txtchildInsuHkid" + i).val('');
	    }
		
		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(HkidPass.trim());
//				if(tr==false)
//				{
//					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
//			
			
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#childBenefitiaryName" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="childBenefitiaryName"+i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("txtchildInsuHkid" + i).value;
			if (selectedChldBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#txtchildInsuHkid" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtchildInsuHkid"+i;
					}
			    	flag = false;
			    } else {
					if(IsHKID(hkida.trim())==false)
					{	
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#txtchildInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid"+i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errtxtchildInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#txtchildInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid"+i;
						}
						flag = false;
					}	
			    }
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#txtchildInsuHkid" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtchildInsuHkid"+i;
					}
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#txtchildInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid"+i;
						}
						flag = false;
					}
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#txtchildInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid"+i;
						}
			        	flag = false;
					}
				}
			}
		}

	}

	/* Other Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountOther) ; i++)
	{
		if($("#txtOtherFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtOtherFullName" + i).val('');
	    }
		if($("#txtOtherInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtOtherInsuHkid" + i).val('');
	    }
		
		var hkid = document.getElementById("txtOtherInsuHkid" + i).value;
		var fullname = document.getElementById("txtOtherFullName" + i).value;
		var age = document.getElementById("selectOtherAgeRange" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtOtherFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			$("#txtOtherFullName" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtOtherFullName"+i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "";
		}


		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			$("#selectOtherAgeRange" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="selectOtherAgeRange"+i;
			}
			flag = false;
		}else{
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "";
		}

		if (hkid.trim() == "") {
			document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
			$("#txtOtherInsuHkid" + i).addClass("invalid-field");
	        if(firstErrorElementId==""){
				firstErrorElementId="txtOtherInsuHkid"+i;
			}
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				$("#txtOtherInsuHkid" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="txtOtherInsuHkid"+i;
				}
				flag = false;
			}
		}

		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1 ; j++)
			{
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{
					document.getElementById("errtxtOtherInsuHkid" + j).innerHTML = getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage");
					$("#txtOtherInsuHkid" + j).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherInsuHkid"+j;
					}
					flag = false;
				}
			}
		}

		if($("#otherBenefitiaryName" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#otherBenefitiaryName" + i).val('');
	    }
		if($("#txtOtherBenInsuHkid" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#txtOtherBenInsuHkid" + i).val('');
	    }
		
		var selectedValue = document.getElementById("otherSelectBenificiary" + i).value;
		if(selectedValue != "SE"){
//			if (hkid.trim() == "") {
//				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(hkid.trim());
//				if(tr==false)
//				{
//					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
			
			
			if (document.getElementById("otherBenefitiaryName" + i).value == "")
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML=getBundle(getBundleLanguage, "beneficiary.name.notNull.message");
				$("#otherBenefitiaryName" + i).addClass("invalid-field");
		        if(firstErrorElementId==""){
					firstErrorElementId="otherBenefitiaryName"+i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML = "";
				
			}

			var hkidc = document.getElementById("txtOtherBenInsuHkid" + i).value;
			$("#errtxtOtherBenInsuHkid" + i).html("");
			var selectOtherBenefitiaryHkidPass = document.getElementById("selectOtherBenefitiaryHkidPass" + i).value;
			
			if (selectOtherBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkidc.trim() == "") {
			    	$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherBenInsuHkid"+i;
					}
			    	flag = false;
			    } else {
					if(IsHKID(hkidc.trim())==false)
					{	
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtOtherBenInsuHkid"+i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == hkidc.toUpperCase()){
						$('#errtxtOtherBenInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtOtherBenInsuHkid"+i;
						}
						flag = false;
					}	
			    }
				
			} else {
				if (hkidc.trim() == "") {
					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="txtOtherBenInsuHkid"+i;
					}
					flag = false;
				} else {
					if(chkTravelHKPass(hkidc.trim()) == false) {
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtOtherBenInsuHkid"+i;
						}
						flag = false;
					}
					if(chkTravelHKPassLen(hkidc.trim()) == false) {
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#txtOtherBenInsuHkid" + i).addClass("invalid-field");
				        if(firstErrorElementId==""){
							firstErrorElementId="txtOtherBenInsuHkid"+i;
						}
			        	flag = false;
					}
				}
			}
		}
	}
	
	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message");
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox1";
		}
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox2";
		}
		flag = false;
	}
	
	if(firstErrorElementId!=""){
		scrollToElement(firstErrorElementId);
	}

	if(!flag){
		$('#loading-overlay').modal('hide');
	}

	return flag;

}