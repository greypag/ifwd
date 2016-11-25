'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check 'fvConfig'
    if ( typeof fvConfig === 'undefined' && fvConfig === null ) { var fvConfig = {}; }

    // COULD - Check FV customed-made helpers, calling example: fvConfig.helpers.xxxx
    if ( !_.has(fvConfig, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }

    // MUST - Check fwdConstant : RegExp etc. , calling example: fvConfig.regex.xxxx
    if ( typeof fwdConstant !== 'object' && fwdConstant !== null ) { throw ('No fwd-constant.js are loaded. Please check again.'); }

} catch (e) {
    console.log('This file will not be executed.');
    console.error( e.toString() );
}
// VALIDATION - prerequistite << end >>



// MUST - Schema pass to FormValidation main object - 'fvConfig'
fvConfig['schema'] = {
    'row': {
        'valid': 'has-success'
        , 'invalid': 'has-error'
        // , 'validating': 'glyphicon glyphicon-resh'
    },
    'fields': {}
};

// MUST
fvConfig['applicant'] = function() {
    return {
        'fullName': {
            'container': '#fullnameinvalid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'error.contact.person.name.empty')
                }
                , 'stringLength': {
                    'max': 50
                    , 'message': ''
                }
            }
        },
        'hkid': {
            'container': '#errAppHkid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'applicant.hkId.notNull.message')
                },
        		'isHkid': {
        			'message': getBundle(getBundleLanguage, 'applicant.hkId.notValid.message')
        		}
            }
        },
        'applicantDob': {
            'container': '#dobInvalid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'applicant.dob.notNull.message')
                }
            }
        },
        'mobileNo': {
            'container': '#mobileNoInvalid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'applicant.mobileNo.notNull.message')
                }
                , 'regexp': {
                    'regexp': new RegExp(fwdConstant.regex.person.hkTel.mob)
                    , 'message': getBundle(getBundleLanguage, 'applicant.mobileNo.notValid.message')
                }
            }
        },
        'emailAddress': {
            'container': '#emailid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'applicant.email.notNull.message')
                }
                , 'emailAddress': {
                	'regexp': new RegExp(fwdConstant.regex.person.email)
                    , 'message': getBundle(getBundleLanguage, 'applicant.email.notValid.message')
                }
            }
        }
    };
}();

// MUST
fvConfig['insuredPerson'] = function() {
    return {
        'personalName': {
            'container': '#errtxtPersonalFullName'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.name.notNull.message')
                }
                , 'stringLength': {
                    'max': 100
                    , 'message': ''
                }
            }
        },
        'personalHKID': {
            'container': '#errtxtInsuHkid'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }// - new testing code - start -
                , 'identical': {
                // , 'different': {
                	'enabled': false,
                    'field': 'fullName',
                    'message': 'Name is not same'
                }
                // - new testing code - end -
            }
        },
        'personalAgeRange': {
            'container': '#errselectAgeRange'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        },
        'personalBeneficiary': {
            'container': '#errpersonalselectBenificiary'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        }
    };
}();
