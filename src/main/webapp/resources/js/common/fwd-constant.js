/*
 * FWD Constant variables
 * ALL REGEX characters should be double escaped here
 */
 var fwdConstant = (function(){

	var _regex_general = {
        'text': {
            'enOnly': '^[a-zA-Z\\Ss]*$'                 // englishOnly
            , 'enSpace': '^[A-Za-z ]+$'                 // for fwd-validator, found in fwd.js, function allLetter(inputtxt)
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
            , 'hkidPattern1': '^([A-Z]{1,2})([0-9]{6})([A0-9])$'                // for fwd-validator
            , 'hkidPattern2': '^([A-Z]{1,2})([0-9]{6})([(])([A0-9])([)])$'      // for fwd-validator
            , 'passport': '^[a-zA-Z0-9\\-]{5-15}$'                              // passport
        }
    };

    var _text = {
        'allEngChar': {
            'uppercase': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'                           // for fwd-validator
            , 'lowercase': 'abcdefghijklmnopqrstuvwxyz'                         // for fwd-validator
        }
    };

    var _date = {

        // 35 day
        'dob_42_date': function() {
            var temp = new Date();
            temp.setDate(temp.getDate()-43);
            return temp;
        }()
        // 18 year ago date
        , 'dob_end_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear()-18);
            return temp;
        }()
        // this year
        , 'dob_end_date_this_year': function() {
            return new Date();
        }()
        // this year - 90 days
        , 'dob_end_date_this_year_plus_90': function() {
            var temp = new Date();
            temp.setDate(temp.getDate() + 90);
            return temp;
        }()
        // 65 year ago date
        , 'dob_65_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear() - 65);
            temp.setDate(temp.getDate() + 1);
            return temp;
        }()
        // 12 year ago date
        , 'dob_12_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear() - 12);
            temp.setDate(temp.getDate() + 90)
            return temp;
        }()
        // 10 year and 9 month ago date
        , 'dob_10_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear() - 11);
            temp.setDate(temp.getDate() + 90)
            return temp;
        }()
        // 86 year ago date
        , 'dob_start_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear()-86);
            temp.setDate(temp.getDate()+1);
            return temp;
        }()
        // 71 year ago date
        , 'dob_70_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear()-71);
            temp.setDate(temp.getDate());
            return temp;
        }()
        // 70 year ago date for Annual Travel
        , 'dob_69_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear()-70);
            temp.setDate(temp.getDate());
            return temp;
        }()
        //one day before 69 year old date
        , 'dob_70_99_date': function() {
            var temp = new Date();
            temp.setFullYear(temp.getFullYear()-69);
            temp.setDate(temp.getDate() + 1);
            return temp;
        }()
        //Start at 1900
        /*var dob_1900_date = new Date(); dob_1900_date.setFullYear(1900,0,1);*/
    };

	return {
		'regex': {
    		'general':      _regex_general
            , 'person':     _regex_person
    	}
        , 'text':         _text
        // Based on current date, to create page-level constants
        , 'date':         _date
	};

})();
