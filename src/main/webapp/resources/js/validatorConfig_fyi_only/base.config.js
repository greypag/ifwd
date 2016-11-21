var validatorCfgSkeleton = {
    "row": {
        "valid": "has-success",
        "invalid": "has-error"
    },
    "fields": {
    }
};

var applicantCfg = {
    fullName: {
        "container": "#fullnameinvalid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "error.contact.person.name.empty")
            }
        }
    },
    hkid: {
        "container": "#errAppHkid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "applicant.hkId.notNull.message")
            },
    		"isHkid": {
    			"message": getBundle(getBundleLanguage, "applicant.hkId.notValid.message")
    		}
        }
    },
    applicantDob: {
        "container": "#dobInvalid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "applicant.dob.notNull.message")
            }
        }
    },
    mobileNo: {
        "container": "#mobileNoInvalid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message")
            },
            "regexp": {
                "regexp": /^1[0-9]{10}$|^[5689][0-9]{7}$/,
                "message": getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message")
            }
        }
    },
    emailAddress: {
        "container": "#emailid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "applicant.email.notNull.message")
            },
            "emailAddress": {
            	"regexp": /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/,
                "message": getBundle(getBundleLanguage, "applicant.email.notValid.message")
            }
        }
    }
};
var insuredPersonCfg = {
    "personalName": {
        "container": "#errtxtPersonalFullName",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.name.notNull.message")
            }
        }
    },
    "personalHKID": {
        "container": "#errtxtInsuHkid",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.hkId.notNull.message")
            }
        }
    },
    "personalAgeRange": {
        "container": "#errselectAgeRange",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.hkId.notNull.message")
            }
        }
    },
    "personalBeneficiary": {
        "container": "#errpersonalselectBenificiary",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.hkId.notNull.message")
            }
        }
    }
};

function generate_insuredPersonCfgGrp(personCount, personCfg) {
	var personCfgGrp = {};
    var newKeyMap = {};

    var plugIdIntoKeyMap = function(index7, configs) {
        var keysInConfigs = _.keys(configs);
        var temp = {};

        for (var i = 0; i < keysInConfigs.length; i++) {
            temp[keysInConfigs[i]] = keysInConfigs[i] + index7;
        }
        return temp;
    };
    // {
    // 	personalName : "personalName"+i,
    // 	personalHKID : "personalHKID"+i,
    // 	personalAgeRange : "personalAgeRange"+i,
    // 	personalBeneficiary : "personalBeneficiary"+i
    // };

	for (i = 1; i <= personCount; i++) {

		var keyMap = plugIdIntoKeyMap(i, personCfg);
        newKeyMap = {};
        _.each( personCfg, function(vv, ii) {
            var sub = {};
            var targetKey = 'container';

            sub[targetKey] = vv[targetKey] + i;
            _.each(vv, function(vvv, iii) {
                if (iii !== targetKey) { sub[iii] = vv[iii]; }
            });
            newKeyMap[ keyMap[ii] ] = _.merge({}, sub);
        });
        personCfgGrp = _.merge(personCfgGrp, newKeyMap);
	}

	return personCfgGrp;
}

var declarationCfg  = {
		"checkbox1": {
        "container": "#chk1",
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.name.notNull.message")
            },
            "onSucces": function(e, data) {
                if (!data.fv.isValidField("fullName")) {
                    // Revalidate it
                    data.fv.revalidateField("fullName");
                }
            }
        }
    }
};
validatorCfgSkeleton.fields = $.extend(validatorCfgSkeleton.fields, applicantCfg, generate_insuredPersonCfgGrp(totalTraveller, insuredPersonCfg));
