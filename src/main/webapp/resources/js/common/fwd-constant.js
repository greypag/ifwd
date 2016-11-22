/*
 * FWD Constant variables
 * ALL REGEX characters should be double escaped
 */
 var fwdConstant = (function(){

	var _regex_general = {
        'text': {
            'enOnly': '^[a-zA-Z\\Ss]*$'                  // englishOnly
            , 'tcOnly': '^[\s\u4e00-\u9fa5]*%'          // chineseOnly
            , 'enTcBoth': '^[a-zA-Z\s\u4e00-\u9eff]*$'  // englishAndChinese
        }
        , 'devices': {
            'mob': '\/Andriod|webOS|iPhone|iPad|'        // mobileDevice
        }
	};

    var _regex_person = {
        'email': '^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$'
        , 'hkTel': {
            'mob': '^1[0-9]{10}$|^[5689][0-9]{7}$'      // mobileNo
            , 'res': '[0-9]{10}$|^[235689][0-9]{7}$'    // residentialTelNo
        }
        , 'address': '^[a-zA-Z0-9\s,-\/]*$'             // address
        , 'login': {
            password: '^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$'
            , username: ''
        }
        , 'ssn': {
            'hkid': '^[a-zA-Z0-9\\-]*$'                                         // hkid
            , 'hkidPattern1': '^([A-Z]{1,2})([0-9]{6})([A0-9])$'            // for fwd-validator
            , 'hkidPattern2': '^([A-Z]{1,2})([0-9]{6})([(])([A0-9])([)])$'  // for fwd-validator
            , 'passport': '^[a-zA-Z0-9\\-]{5-15}$'                              // passport
        }
    }

    var _text = {
        'allEngChar': {
            'uppercase': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'                           // for fwd-validator
            , 'lowercase': 'abcdefghijklmnopqrstuvwxyz'                         // for fwd-validator
        }
    }

	return {
		'regex': {
    		'general':      _regex_general
            , 'person':     _regex_person
    	},
        'constant': {
            'text':         _text
        }
	};

})();
