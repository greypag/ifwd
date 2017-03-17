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
$(document).ready(function(){
	$(':text,[type=tel]').on("keyup blur", formatStripBasic);
});