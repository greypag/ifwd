'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check "fvConfig"
    if ( typeof fvConfig === "undefined" && fvConfig === null ) { var fvConfig = {}; }

    // COULD - Check FV customed-made helpers, calling example: fvConfig.helpers.xxxx
    if ( !_.has(fvConfig, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }

    // MUST - Check fwdConstant : RegExp etc. , calling example: fvConfig.regex.xxxx
    if ( typeof fwdConstant !== "object" && fwdConstant !== null ) { throw ('No fwd-constant.js are loaded. Please check again.'); }

} catch (e) {
    console.error( e.toString() );
}
// VALIDATION - prerequistite << end >>



// MUST - Schema pass to FormValidation main object - "fvConfig"
fvConfig['schema'] = {
    "row": {
        "valid": 'has-success',
        "invalid": 'has-error'
    },
    "fields": {}
};

// MUST
fvConfig['applicant'] = function() {
    return {
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
                    "regexp": new RegExp(fwdConstant.regex.person.hkTel.mob),
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
                	"regexp": new RegExp(fwdConstant.regex.person.email),
                    "message": getBundle(getBundleLanguage, "applicant.email.notValid.message")
                }
            }
        }
    };
}();

// MUST
fvConfig['insuredPerson'] = function() {
    return {
        "personalName": {
            "container": "#errtxtPersonalFullName",
            "validators": {
                "notEmpty": {
                    "message": getBundle(getBundleLanguage, "insured.name.notNull.message")
                }
                // - new testing code - start -
                , "identical": {
                	"enabled": false,
                    "field": "fullName",
                    "message": "Name is not same"
                }
                // - new testing code - end -
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
}();
