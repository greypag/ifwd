/*
 * Format Currency
 * Params a: number value
 * Params n: number of decimal no. Default to be 2.
 */
function formatCurrency(a, n){
	var _decimal = (typeof(n)==='number')?n:2;
	return parseFloat(a).toFixed(_decimal).replace(/\B(?=(\d{3})+(?!\d))/g, ",");;

}

function formatFloat(a, n){
	var _decimal = (typeof(n)==='number')?n:2;
	return (isNaN(parseFloat(a)))?0:parseFloat(a).toFixed(_decimal);
}

function formatStripBasic(e){
	var target = $(e.target);
	var isEnabled;
	var stripRule;
	var stripPattern = {
		fullname : /[^A-Za-z\s]*$/g,
		hkid : /[^A-Za-z0-9]*$/g,
		mobile : /[^0-9]*$/g,
		address : /[^A-Za-z0-9-,\s\/]*$/g,
		creditCard : /[^0-9\s]*$/g,
		email: /[^A-Za-z0-9_.@\-\s]*$/g,
		chineseInput: /[^a-zA-Z\s\u4e00-\u9fa5]*$/
	};
	
	for(var i=0; i<Object.keys(stripPattern).length; i++){
		if(target.hasClass("js-field-"+Object.keys(stripPattern)[i]+"")){
			isEnabled = true;
			stripRule = stripPattern[Object.keys(stripPattern)[i]];
			break;
		}else{
			isEnable = false;
		}
		
	}
	
	//var isEnabled = target.is('[class^="js-field-"]') == true ? true : false;
	if(isEnabled){
		if( target.hasClass('chinese-input') ){
			stripRule = stripPattern["chineseInput"];
			//e.stopPropagation();
			//return false;
		}

	    var inputVal = target.val();
	    var newVal = inputVal.replace(stripRule,'');
	    if(inputVal != newVal){
	    	$('#'+target.attr('id')).val(newVal);
	    }		
	}
}

function formatDate(thisDate){
	
	 var monthNames = [
	                      "January", "February", "March",
	                      "April", "May", "June", "July",
	                      "August", "September", "October",
	                      "November", "December"
	                  ];

	  var date = new Date(thisDate);
	  var day = date.getDate();
	 if(day<10){		                	 
		 day = '0' + day;
	 }
	 
	  var monthIndex = date.getMonth();		                  
	  var year = date.getFullYear();
	  var formateDate = day + " " + monthNames[monthIndex] +" " + year;
	  return formateDate;
	
}

/* hkid validation script */
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
	
	var hkidPat2 = /^([A-Z]{1,2})([0-9]{6})([(])([A0-9])([)])$/;
	var matchArray2 = str.match(hkidPat2);

	// not match, return false
	if (matchArray == null && matchArray2 == null)
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
$(document).ready(function(){
	$(':text,[type=tel]').on("keyup blur", formatStripBasic);
});