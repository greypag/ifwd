/*var reg = /^[a-zA-Z]+$/;
var emailreg = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regex_malasia = /\+60[-]\d{2,4}[-]?\d{6,9}\b/;
var mobile_pattern = /^\d{8}$/;
var password_full_pattern = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[&%$!]).{8,}$/;
var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
 datepicker script

 hkid validation script 
function IsHKID(str) {
    var strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    // basic check length
    if (str.length < 8)
        return false;

    // handling bracket
    if (str.charAt(str.length - 3) == '(' && str.charAt(str.length - 1) == ')')
        str = str.substring(0, str.length - 3) + str.charAt(str.length - 2);

    // convert to upper case
    str = str.toUpperCase();

    // regular expression to check pattern and split
    var hkidPat = /^([A-Z]{1,2})([0-9]{6})([A0-9])$/;
    var matchArray = str.match(hkidPat);

    // not match, return false
    if (matchArray == null)
        return false;

    // the character part, numeric part and check digit part
    var charPart = matchArray[1];
    var numPart = matchArray[2];
    var checkDigit = matchArray[3];

    // calculate the checksum for character part
    var checkSum = 0;
    if (charPart.length == 2) {
        checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
        checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
    } else {
        checkSum += 9 * 36;
        checkSum += 8 * (10 + strValidChars.indexOf(charPart));
    }

    // calculate the checksum for numeric part
    for (var i = 0, j = 7; i < numPart.length; i++, j--)
        checkSum += j * numPart.charAt(i);

    // verify the check digit
    var remaining = checkSum % 11;
    var verify = remaining == 0 ? 0 : 11 - remaining;

    return verify == checkDigit || (verify == 10 && checkDigit == 'A');
}

$(function () {
    get now date
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    


     desktoip datepicker
        var checkin = $('#dp1').datepicker({
        beforeShowDay: function (date) {
            return date.valueOf() >= now.valueOf();
        },
        autoclose: true,
        todayHighlight: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) {
        if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
            var newDate = new Date(ev.date);
            newDate.setDate(newDate.getDate());
            checkout.datepicker("update", newDate);
        }
        $('#dp2')[0].focus();
    });
    var checkout = $('#dp2').datepicker({
        beforeShowDay: function (date) {
            if (!checkin.datepicker("getDate").valueOf()) {

                return date.valueOf() >= new Date().valueOf();
            } else {
                return date.valueOf() >= checkin.datepicker("getDate").valueOf();
            }
        },
        autoclose: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) { });



     mobile datepicker 
    var checkin2 = $('#dp3').datepicker({
        beforeShowDay: function (date) {
            return date.valueOf() >= now.valueOf();
        },
        autoclose: true,
        todayHighlight: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) {
        if (ev.date.valueOf() > checkout2.datepicker("getDate").valueOf() || !checkout2.datepicker("getDate").valueOf()) {
            var newDate = new Date(ev.date);
            newDate.setDate(newDate.getDate());
            checkout2.datepicker("update", newDate);
        }
        $('#dp4')[0].focus();
    });
    var checkout2 = $('#dp4').datepicker({
        beforeShowDay: function (date) {
            if (!checkin2.datepicker("getDate").valueOf()) {

                return date.valueOf() >= new Date().valueOf();
            } else {
                return date.valueOf() >= checkin2.datepicker("getDate").valueOf();
            }
        },
        autoclose: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) { });



     bottom datepicker 
    var checkin3 = $('#dp5').datepicker({
        beforeShowDay: function (date) {
            return date.valueOf() >= now.valueOf();
        },
        autoclose: true,
        todayHighlight: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) {
        if (ev.date.valueOf() > checkout3.datepicker("getDate").valueOf() || !checkout3.datepicker("getDate").valueOf()) {
            var newDate = new Date(ev.date);
            newDate.setDate(newDate.getDate());
            checkout3.datepicker("update", newDate);
        }
        $('#dp6')[0].focus();
    });
    var checkout3 = $('#dp6').datepicker({
        beforeShowDay: function (date) {
            if (!checkin3.datepicker("getDate").valueOf()) {

                return date.valueOf() >= new Date().valueOf();
            } else {
                return date.valueOf() >= checkin3.datepicker("getDate").valueOf();
            }
        },
        autoclose: true,
        format: "dd MM yyyy"

    }).on('changeDate', function (ev) { });

});//]]>  

 No spinner 




function dateDiffInDays(a, b) {
    // Discard the time and time-zone information.
    var diffDays = (b - a) / 1000 / 60 / 60 / 24;
    return diffDays + 1;
}


 login popup and overlay scirpt 


$("#fwd-login").on('click', function (e) {
    if (!$('#overlay').length) {
        $('body').append('<div id="overlay"> </div>')
    }
})
$('body').click(function (e) {
    if (!$(e.target).is('#fwd-login')) {
        $('#overlay').remove();
    }
})

$('#myDropdown .dropdown-menu').on({
"click": function (e) {
    e.stopPropagation();
}
});
$('#myFWDropdown .dropdown-menu').on({
"click": function (e) {
    e.stopPropagation();
}
});


 flieght plan your details validation 

function pageValidate() {
	console.log("validation");
    document.getElementById("fullname").style.display = "none";
    document.getElementById("emailid").style.display = "none";
    document.getElementById("mobileNo").style.display = "none";
    document.getElementById("emailidinvalid").style.display = "none";
    document.getElementById("fullname1").style.display = "none";
    document.getElementById("benificiary").style.display = "none";
    document.getElementById("chk1").style.display = "none";
    document.getElementById("chk2").style.display = "none";
    document.getElementById("ageRange").style.display = "none";
    document.getElementById("mobilenoinvalid").style.display = "none";
  console.log(455);
    document.getElementById("errAppHkid").innerHTML = "";
    document.getElementById("errBenName").style.display = "none";
    document.getElementById("errInsuHkid").innerHTML = "";
    document.getElementById("errSpouseHkid").innerHTML = "";
    document.getElementById("errChildHkid").innerHTML = "";
    var flag = true;
    var fullname = document.getElementById("inputFullName").value;
    var emailId = document.getElementById("inputEmailId").value;
    var mobileNo = document.getElementById("inputMobileNo").value;
    var fullname1 = document.getElementById("inputFullName1").value;
    var ageRange = document.getElementById("selectAgeRange").value;
    
    var appHkid = document.getElementById("txtAppHkid").value;
    var insuHkid = document.getElementById("txtInsuHkid").value;
    var spouseHkid = document.getElementById("txtSpouseHkid").value;
    var childHkid = document.getElementById("txtChildHkid").value;
    console.log(455);
    var selectBenificiary = document.getElementById("selectBenificiary").value;
    
    if (appHkid.trim() == "") {  console.log(455);
        document.getElementById("errAppHkid").innerHTML = "Please enter HKID No. in English";
        flag = false;
    }
	else
	{
		var tr=IsHKID(appHkid.trim());
		if(tr==false)
		{
			document.getElementById("errAppHkid").innerHTML = "Please enter valid HKID No. in English";
        	flag = false;
		}
	}
    if (insuHkid.trim() == "") {
        document.getElementById("errInsuHkid").innerHTML = "Please enter HKID No. in English";
        flag = false;
    }
	else
	{
		var tr=IsHKID(insuHkid.trim());
		if(tr==false)
		{
			document.getElementById("errInsuHkid").innerHTML = "Please enter valid HKID No. in English";
        	flag = false;
		}
	}
    if (spouseHkid.trim() == "") {
        document.getElementById("errSpouseHkid").innerHTML = "Please enter Beneficiary HKID No. in English";
        flag = false;
    }
    else
	{
		var tr=IsHKID(spouseHkid.trim());
		if(tr==false)
		{
			document.getElementById("errSpouseHkid").innerHTML = "Please enter valid HKID No. in English";
        	flag = false;
		}
	}

    if (fullname.trim() == "") {
        document.getElementById("fullname").style.display = "block";
        flag = false;
    }
    if (mobileNo.trim() == "") {
        document.getElementById("mobileNo").style.display = "block";
        flag = false;
    }
    else {        
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("mobilenoinvalid").style.display = "block";
            flag = false;
        }
    }

    if (emailId.trim() == "") {
        document.getElementById("emailid").style.display = "block";
        flag = false;
    }
    else {
        if (emailreg.test(emailId) == false) {

            document.getElementById("emailidinvalid").style.display = "block";
            flag = false;
        }
    }
    if (fullname1.trim() == "") {
        document.getElementById("fullname1").style.display = "block";
        flag = false;
    }
    if (ageRange.trim() == "") {
        document.getElementById("ageRange").style.display = "block";
        flag = false;
    }
    if (selectBenificiary.trim() == "") {
        document.getElementById("benificiary").style.display = "block";
        flag = false;
    }
    if (document.getElementById("checkbox1").checked == false) {
        document.getElementById("chk1").style.display = "block";
        flag = false;
    }
    if (document.getElementById("checkbox2").checked == false) {
        document.getElementById("chk2").style.display = "block";
        flag = false;
    }


    return flag;
}
function isAlphaNumeric(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 47 || charCode > 57)) {
        return false;
    }
    return true;
}
function replaceAlphaNumeric(id) {
    var string = id.value;
    string = string.replace(/[^a-zA-Z0-9 ]/g, '');
    id.value = string;
}
function isNumeric(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function replaceNumeric(id) {
    var string = id.value;
    string = string.replace(/[^0-9]/g, '');
    id.value = string;
}
function alphaOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
        return false;
    }
    return true;
}
function replaceAlpha(id) {
    var string = id.value;
    string = string.replace(/[^a-zA-Z0-9 ]/g, '');
    id.value = string;
}

 flight page apply for no button validation 


 Apply for now Top 
function flightValidateDesk()
{
	console.log("Validation");
    var flag = true;
    
    document.getElementById("startDateDeskIn").innerHTML = "";
    document.getElementById("endDateDeskIn").innerHTML = "";
    document.getElementById("travelCountDeskIn").style.display = "none";
    var startDate = document.getElementById("txtStartDateDesk").value;    
    var endDate = document.getElementById("txtEndDateDesk").value;
    var travellers = document.getElementById("txtTravellersDesk").value;
    var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);
    if(startDate.trim()=="")
    {
        document.getElementById("startDateDeskIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    }
    else {
        if (startdays > 30) {
            document.getElementById("startDateDeskIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if(endDate.trim()=="")
    {
        document.getElementById("endDateDeskIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    }
    else {
        if (enddays > 30) {
            document.getElementById("endDateDeskIn").innerHTML = "The end date cannot be more than 30 days from the start date";
            flag = false;
        }
    }
    if(travellers.trim()=="")
    {
        document.getElementById("travelCountDeskIn").style.display = "block";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountDeskIn").style.display = "block";
        flag = false;
    }
    return flag;
    
}

function flightValidateMob() {
    var flag = true;

    document.getElementById("startDateMobIn").innerHTML = "";
    document.getElementById("endDateMobIn").innerHTML = "";
    document.getElementById("travelCountMobIn").style.display = "none";
    var startDate = document.getElementById("txtStartDateMob").value;
    var endDate = document.getElementById("txtEndDateMob").value;
    var travellers = document.getElementById("txtTravellersMob").value;
    var peopleCount = document.getElementById("lblPeopleMob").innerHTML;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);

    if (startDate.trim() == "") {
        document.getElementById("startDateMobIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    } else {
        if (startdays > 30) {
            document.getElementById("startDateMobIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if (endDate.trim() == "") {
        document.getElementById("endDateMobIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    } else {
        if (enddays > 30) {
            document.getElementById("endDateMobIn").innerHTML = "The end date cannot be more than 30 days from the start date";
            flag = false;
        }
    }
    if (travellers.trim() == "") {
        document.getElementById("travelCountMobIn").style.display = "block";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountMobIn").style.display = "block";
        flag = false;
    }
    return flag;

}
function flightValidateBtm() {
    var flag = true;
    
    document.getElementById("startDateBtmIn").innerHTML = "";
    document.getElementById("endDateBtmIn").innerHTML = "";
    document.getElementById("travelCountBtmIn").style.visibility = "hidden";
    var startDate = document.getElementById("txtStartDateBtm").value;
    var endDate = document.getElementById("txtEndDateBtm").value;
    var travellers = document.getElementById("txtTravellersBtm").value;
    var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);

    if (startDate.trim() == "") {
        document.getElementById("startDateBtmIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    }
    else
    {
        if(startdays>30)
        {
            document.getElementById("startDateBtmIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if (endDate.trim() == "") {
        document.getElementById("endDateBtmIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    }
    else
    {
        if (enddays > 30) {
            document.getElementById("endDateBtmIn").innerHTML = "The end date cannot be more than 30 days from the start date";
            flag = false;
        }
    }
    if (travellers.trim() == "") {
        document.getElementById("travelCountBtmIn").style.visibility = "visible";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountBtmIn").style.visibility = "visible";
        flag = false;
    }
    return flag;

}
function flightValidateDeskTravel()
{
    var flag = true;
    
    document.getElementById("startDateDeskIn").innerHTML = "";
    document.getElementById("endDateDeskIn").innerHTML = "";
    document.getElementById("travelCountDeskIn").style.display = "none";
    var startDate = document.getElementById("txtStartDateDesk").value;    
    var endDate = document.getElementById("txtEndDateDesk").value;
    var travellers = document.getElementById("txtTravellersDesk").value;
    var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);
    if(startDate.trim()=="")
    {
        document.getElementById("startDateDeskIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    }
    else {
        if (startdays > 30) {
            document.getElementById("startDateDeskIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if(endDate.trim()=="")
    {
        document.getElementById("endDateDeskIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    }
    else {
        if (enddays > 180) {
            document.getElementById("endDateDeskIn").innerHTML = "The end date cannot be more than 180 days from the start date";
            flag = false;
        }
    }
    if(travellers.trim()=="")
    {
        document.getElementById("travelCountDeskIn").style.display = "block";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountDeskIn").style.display = "block";
        flag = false;
    }
    return flag;
    
}

function flightValidateMobTravel() {
    var flag = true;

    document.getElementById("startDateMobIn").innerHTML = "";
    document.getElementById("endDateMobIn").innerHTML = "";
    document.getElementById("travelCountMobIn").style.display = "none";
    var startDate = document.getElementById("txtStartDateMob").value;
    var endDate = document.getElementById("txtEndDateMob").value;
    var travellers = document.getElementById("txtTravellersMob").value;
    var peopleCount = document.getElementById("lblPeopleMob").innerHTML;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);

    if (startDate.trim() == "") {
        document.getElementById("startDateMobIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    } else {
        if (startdays > 30) {
            document.getElementById("startDateMobIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if (endDate.trim() == "") {
        document.getElementById("endDateMobIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    } else {
        if (enddays > 180) {
            document.getElementById("endDateMobIn").innerHTML = "The end date cannot be more than 180 days from the start date";
            flag = false;
        }
    }
    if (travellers.trim() == "") {
        document.getElementById("travelCountMobIn").style.display = "block";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountMobIn").style.display = "block";
        flag = false;
    }
    return flag;

}
function flightValidateBtmTravel() {
    var flag = true;
    
    document.getElementById("startDateBtmIn").innerHTML = "";
    document.getElementById("endDateBtmIn").innerHTML = "";
    document.getElementById("travelCountBtmIn").style.visibility = "hidden";
    var startDate = document.getElementById("txtStartDateBtm").value;
    var endDate = document.getElementById("txtEndDateBtm").value;
    var travellers = document.getElementById("txtTravellersBtm").value;
    var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(startDate);
    var new_end = new Date(endDate);
    var startdays = dateDiffInDays(now, new_start);
    var enddays = dateDiffInDays(new_start, new_end);

    if (startDate.trim() == "") {
        document.getElementById("startDateBtmIn").innerHTML = "The Start date is not a valid date for period of insurance.";
        flag = false;
    }
    else
    {
        if(startdays>30)
        {
            document.getElementById("startDateBtmIn").innerHTML = "The Start date cannot be more than 30 days from the application date";
            flag = false;
        }
    }
    if (endDate.trim() == "") {
        document.getElementById("endDateBtmIn").innerHTML = "The End date is not a valid date for period of insurance";
        flag = false;
    }
    else
    {
        if (enddays > 180) {
            document.getElementById("endDateBtmIn").innerHTML = "The end date cannot be more than 180 days from the start date";
            flag = false;
        }
    }
    if (travellers.trim() == "") {
        document.getElementById("travelCountBtmIn").style.visibility = "visible";
        flag = false;
    }
    if(peopleCount.trim()==""||peopleCount=="0")
    {
        document.getElementById("travelCountBtmIn").style.visibility = "visible";
        flag = false;
    }
    return flag;

}



 join us page validation 
function validateJoinUsForm() {
   
    
    var valid = true;
   

    var fullName = $("#txtFullName").val();
    var mobileNo = $("#txtMobileNo").val();
    var emailId = $("#txtEmailId").val();
    var userName = $("#txtUserName").val();
    var password = $("#txtPass").val();
    var confirmPassword = $("#txtConfPass").val();
   
    
    document.getElementById("errorEmptyName").style.display = "none";
    document.getElementById("errorEmptyMob").style.display = "none";
    document.getElementById("errorInvalidMob").style.display = "none";
    document.getElementById("errorEmptyEmailId").style.display = "none";
    document.getElementById("errorInvalidEmailId").style.display = "none";
    document.getElementById("errorEmptyUName").style.display = "none";
    document.getElementById("errorInvalidUName").style.display = "none";
    document.getElementById("errorEmptyPass").style.display = "none";
    document.getElementById("errorEmptyConfPass").style.display = "none";
    document.getElementById("chk1").style.display = "none";
    document.getElementById("chk2").style.display = "none";

    
    // FULL NAME VALIDATION
    if (fullName.trim() == "") {
        document.getElementById("errorEmptyName").style.display = "block";
        
        valid = false;

    } 
    // Mobile Number Validation
    if (mobileNo.trim() == "") {
        document.getElementById("errorEmptyMob").style.display = "block";
        
        valid = false;

    } else {
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("errorInvalidMob").style.display = "block";
            
            valid = false;
        }
    }

    // Email Address Validation
    if (emailId.trim() == "") {
        document.getElementById("errorEmptyEmailId").style.display = "block";
        
        valid = false;
    } else {
        if (emailreg.test(emailId) == false) {
            document.getElementById("errorInvalidEmailId").style.display = "block";
            
            valid = false;
        }
    }

    // UserName Validation
    if (userName.trim() == "") {
        document.getElementById("errorEmptyUName").style.display = "block";
        
        valid = false;

    } else {
        if (reg.test(userName) == false) {
            document.getElementById("errorInvalidUName").style.display = "block";
            valid = false;
        }
    }

    // validation for Passsword
    if (password.trim() == "") {
        document.getElementById("errorEmptyPass").style.display = "block";
        
        valid = false;

    } else {
        if (password_pattern.test(password) == false) {
            document.getElementById("errorValidPass").style.display = "block";
            valid = false;
        }
    }

    if (confirmPassword.trim() == "") {
        document.getElementById("errorEmptyConfPass").style.display = "block";
        valid = false;
    } else {
        if (confirmPassword !== password) {
            document.getElementById("errorValidConfPass").style.display = "block";
            valid = false;
        }
    }
    if (document.getElementById("checkbox1").checked == false)
    {
        document.getElementById("chk1").style.display = "block";
        valid = false;
    }
    if (document.getElementById("checkbox2").checked == false)
    {
        document.getElementById("chk2").style.display = "block";
        valid = false;
    }


    return valid;

}


  forgot password validation 
function forgotPassword()
{
    
    var valid = true;

    
    var mobileNo = document.getElementById("mobileNo").value;
    
    var emailId = document.getElementById("emailAddress").value; 
    var userName = document.getElementById("userName").value; 

    
    document.getElementById("errorEmptyMob").style.display = "none";
    document.getElementById("errorInvalidMob").style.display = "none";
    document.getElementById("errorEmptyEmailId").style.display = "none";
    document.getElementById("errorInvalidEmailId").style.display = "none";
    document.getElementById("errorEmptyUName").style.display = "none";    
    document.getElementById("errorInvalidUName").style.display = "none";

    // Mobile Number Validation
    if (mobileNo.trim() == "") {
        document.getElementById("errorEmptyMob").style.display = "block";

        valid = false;

    } else {
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("errorInvalidMob").style.display = "block";

            valid = false;
        }
    }

    // Email Address Validation
    if (emailId.trim() == "") {
        document.getElementById("errorEmptyEmailId").style.display = "block";

        valid = false;
    } else {
        if (emailreg.test(emailId) == false) {
            document.getElementById("errorInvalidEmailId").style.display = "block";

            valid = false;
        }
    }

    // UserName Validation
    if (userName.trim() == "") {
        document.getElementById("errorEmptyUName").style.display = "block";

        valid = false;

    } else {
        if (reg.test(userName) == false) {
            document.getElementById("errorInvalidUName").style.display = "block";
            valid = false;
        }
    }
       return valid;
}
function forgotUserName() {

    
    var valid = true;


    var mobileNo = document.getElementById("mobileNo").value;
    var emailId = document.getElementById("emailAddress").value;


    document.getElementById("errorEmptyMob").style.display = "none";
    document.getElementById("errorInvalidMob").style.display = "none";
    document.getElementById("errorEmptyEmailId").style.display = "none";
    document.getElementById("errorInvalidEmailId").style.display = "none";
   

    // Mobile Number Validation
    if (mobileNo.trim() == "") {
        document.getElementById("errorEmptyMob").style.display = "block";

        valid = false;

    } else {
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("errorInvalidMob").style.display = "block";

            valid = false;
        }
    }

    // Email Address Validation
    if (emailId.trim() == "") {
        document.getElementById("errorEmptyEmailId").style.display = "block";

        valid = false;
    } else {
        if (emailreg.test(emailId) == false) {
            document.getElementById("errorInvalidEmailId").style.display = "block";

            valid = false;
        }
    }

    return valid;
}
function resetPassword() {

    var flag = true;

    var pass = document.getElementById("password").value;
    var confpass = document.getElementById("confirmPassword").value;
    document.getElementById("errconfpass").innerHTML = "";
    document.getElementById("errpass").innerHTML = "";

    if (pass.trim() == "") {
        
        flag = false;
        document.getElementById("errpass").innerHTML = "Please enter a Password";
    }
    else {
        if (password_pattern.test(pass) == false) {
            document.getElementById("errpass").innerHTML = "Please enter a Valid Password";
            flag = false;
        }
    }

    if (confpass.trim() == "") {
        document.getElementById("errconfpass").innerHTML = "Please enter a Confirm Password";
        flag = false;
    } else {
        if (confpass !== pass) {
            document.getElementById("errconfpass").innerHTML = "Please enter a Valid Confirm Password";
            flag = false;
        }
    }
    return flag;
}

function validUser()
{
    var flag = true;
    var userName = document.getElementById("txtUserName").value;
    var password = document.getElementById("txtPass").value;
    document.getElementById("errUserName").innerHTML = "";
    document.getElementById("errPass").innerHTML = "";


    if (userName.trim() == "")
    {
        document.getElementById("errUserName").innerHTML = "Please enter an Username";
        flag = false;
    }
    if (password.trim() == "") {
        document.getElementById("errPass").innerHTML = "Please enter a Password";
        flag = false;
    } 
    return flag;
}


//Chat API Calling

window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=

d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.

_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');

$.src='//v2.zopim.com/?2pI3lESBRhfLdMU5ejqFoP9dTStJUfhE';z.t=+new Date;$.

type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');


//travel Payment Summary Payment details//

function validatecardnumber(cardnumber) {
  // Strip spaces and dashes
  
  
  cardnumber = cardnumber.replace(/[ -]/g, '');
  // See if the card is valid
  // The regex will capture the number in one of the capturing groups
  //var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
  var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
  if (match) {
    // List of card types, in the same order as the regex capturing groups
    var types = ['Visa', 'MasterCard', 'Discover', 'American Express',
                 'Diners Club', 'JCB'];
    // Find the capturing group that matched
    // Skip the zeroth element of the match array (the overall match)
    for (var i = 1; i < match.length; i++) {
      if (match[i]) {
        // Display the card type for that group
        document.getElementById('errcardno').innerHTML = types[i - 1];
        break;
      }
    }
  } else {
    document.getElementById('errcardno').innerHTML = '(invalid card number)';
  }
  
}

function payValid()
{
	
	var flag=true;
	var cardno=document.getElementById("cardnumber").value;
	
	var month=document.getElementById("month").value;
	
	
	var year=document.getElementById("year").value;
	var seccode=document.getElementById("seccode").value;
	var holdername=document.getElementById("holdername").value;

	document.getElementById('errcardno').innerHTML="";
	document.getElementById('errmonth').innerHTML="";
	document.getElementById('erryear').innerHTML="";
	document.getElementById('errname').innerHTML="";	
	document.getElementById('errcode').innerHTML="";
	document.getElementById('errchk1').innerHTML="";
	document.getElementById('errchk2').innerHTML="";
	
	if(cardno.length<16)
  	{
		flag=false;
		document.getElementById('errcardno').innerHTML="Please enter a complete credit card number";
  	}
	if(month=="Month")
	{
		flag=false;
		document.getElementById('errmonth').innerHTML="Please select month of your credit card expiry date.";
	}
	if(year=="Year")
	{
		flag=false;
		document.getElementById('erryear').innerHTML="Please select year of your credit card expiry date.";
	}
	if(holdername.trim()=="")
	{
		flag=false;
		document.getElementById('errname').innerHTML="Please enter Name On Card in English";
	}
	if(seccode.trim()=="")
	{
		flag=false;
		document.getElementById('errcode').innerHTML="Please enter the credit card Security Code.";
	}
	if (document.getElementById("checkbox3").checked == false)
    {
        document.getElementById("errchk1").innerHTML = "Please read and accept Payment Authorization";
        flag = false;
    }
    if (document.getElementById("checkbox2").checked == false)
    {
        document.getElementById("errchk2").innerHTML = "Please read and accept Payment Authorization";
        flag = false;
    }
	return flag;
}


//Side Menu

//<![CDATA[ 
$(window).load(function(){
 $('.navmenu-fixed-left').offcanvas({
     placement: 'left',
     autohide: 'true',
     recalc: 'true'
 });
});//]]> 



*/