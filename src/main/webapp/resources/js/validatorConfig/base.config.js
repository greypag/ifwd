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
function generate_insuredPersonCfgGrp(insuredPersonCount, insuredPersonCfg){
	var insuredPersonCfgGrp;
	for (i = 1; i <= insuredPersonCount; i++) {
		var abc =i;
		var KeyMap = {
			personalName : "personalName"+i,
			personalHKID : "personalHKID"+i,
			personalAgeRange : "personalAgeRange"+i,
			personalBeneficiary : "personalBeneficiary"+i
		};
		var valueMap = {
			"#errtxtPersonalFullName" : "#errtxtPersonalFullName"+i,
			"#errtxtInsuHkid" : "#errtxtInsuHkid"+i,
			"#errselectAgeRange" : "#errselectAgeRange"+i,
			"#errpersonalselectBenificiary" : "#errpersonalselectBenificiary"+i			
		};
		var newKeyMap = _.reduce(insuredPersonCfg, function(result, value, key) {
			key = KeyMap[key] || key;
			/*_.update(value, "container", function(){
				return value.container+i;
			});*/
				var a = value;
				_.reduce(a, function(result, value, key){
					if(key=="container"){
						console.log(key);
						containerValue = valueMap[value] || value;
						console.log(containerValue);
						_.set(a, "container", containerValue);
					}
				}, {});
				//console.log(result);
		    result[key] = value;
		    return result;
		}, {});
		
		insuredPersonCfgGrp = _.merge(insuredPersonCfgGrp, newKeyMap);
	}
	//console.log(insuredPersonCfgGrp);
	return insuredPersonCfgGrp;
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