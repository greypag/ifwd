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
	var stripPattern = {
		fullname : /^[A-Za-z\s]*$/,
		hkid : /^[A-Za-z0-9]*$/,
		mobile : /^[0-9]*$/,
		address : /^[A-Za-z0-9-,\s\/]*$/
	};
	
	var isEnabled = target.is('[class^="js-field"]') == true ? true : false;
	console.log();
	if(isEnabled){
		if( target.hasClass('chinese-input') ){
		// use following if case when backend ready for deploy on Chinese Address of Personal-Details
		//if( $(this).hasClass('chinese-input') || $(this).hasClass('residential-chinese-input') ){
			e.stopPropagation();
			return false;
		}

	    var inputVal = target.val();
	    var newVal = inputVal.replace(/[^A-Za-z0-9()@.,-_\/\s]/g,'');
	    if(inputVal != newVal){
	    	$('#'+target.attr('id')).val(newVal);
	    }		
	}
}
$(document).ready(function(){
	$(':text').on("keyup", formatStripBasic);
});