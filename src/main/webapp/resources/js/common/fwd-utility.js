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