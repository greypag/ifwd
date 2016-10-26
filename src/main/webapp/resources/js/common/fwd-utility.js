/*
 * Format Currency
 *
 * @method formatCurreny
 * @param {String/Integer/Float} a number value
 * @param {Integer} n number of decimal no. Default to be 2.
 * @return {Float} Returns the comma seperated currency amount
 */
function formatCurrency(a, n){
	var _decimal = (typeof(n)==='number')?n:2;
	return parseFloat(a).toFixed(_decimal).replace(/\B(?=(\d{3})+(?!\d))/g, ",");;

}

/*
 * Format Float
 *
 * @method formatFloat
 * @param {String/Integer/Float} a number value
 * @param {Integer} n number of decimal no. Default to be 2.
 * @return {Float} Returns the comma seperated float amount
 */
function formatFloat(a, n){
	var _decimal = (typeof(n)==='number')?n:2;
	return (isNaN(parseFloat(a)))?0:parseFloat(a).toFixed(_decimal);
}

/*
 * Process each element in an object with callback function
 *
 * @method forEachObject
 * @param {Object} obj Object to be loop through
 * @param {Function} cb Callback function for each object key pairs
 * @return {Object} Return a processed object
 */
function forEachObject(obj, cb){
	// To Be
}

/*
 * Process each item in an array with callback function
 *
 * @method forEachArry
 * @param {Array} Array to be loop through
 * @param {Function} cb Callback function for each array item 
 * @return {Array} Return a processed array
 */
function forEachArray(arr, cb){
	// To Be
}
