'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check "fvConfig"
    if ( typeof fvConfig === "undefined" && fvConfig === null ) { var fvConfig = {}; }

    // MUST - Check FV customed-made helpers
    if ( _.has(fvConfig, 'helpers') ) {
        var helpers = fvConfig.helpers;
    } else {
        throw new Error('No Helpers is loaded [ helpers.js ] . Please check');
    }

    // MUST - Check fwdConstant : RegExp etc.
    if ( typeof fwdConstant === "object" || fwdConstant === null ) {
        var regexp = fwdConstant.regex;
    } else {
        throw ('No fwd-constant "RegExp" are loaded. Please check again.');
    }

} catch (e) {
    console.error(e.name.toString() + ' >>> ' + e.message);
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
                    "regexp": new RegExp(regexp.person.hkTel.mob),
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
                	"regexp": new RegExp(regexp.person.email),
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
