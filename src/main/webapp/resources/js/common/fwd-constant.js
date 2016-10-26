/*
 * FWD Constant variables
 */
 var fwdConstant = (function(){

	var _regex_general = {
		englishOnly : '^[a-zA-Z\Ss]*$',
		chineseOnly : '^[\s\u4e00-\u9fa5]*%',
		englishAndChinese : '^[a-zA-Z\s\u4e00-\u9eff]*$',
		email: '^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$',
		mobileNo: '^1[0-9]{10}$|^[5689][0-9]{7}$',
		residentialTelNo: '[0-9]{10}$|^[235689][0-9]{7}$',
		hkid : '^[a-zA-Z0-9\-]*$',
		passport: '^[a-zA-Z0-9\-]{5-15}$',
		address : '^[a-zA-Z0-9\s,-\/]*$',
		password : '^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$',
		mobileDevice: '/Andriod|webOS|iPhone|iPad|'
	}

	var _regex_general = {
		username: '',
		password: ''
	}

	var _regex = {
		general : _regex_general,
		user : _regex_user
	}

	return {
		regex = _regex
	};

})();
