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
    framework: 'bootstrap',
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
                }
                , 'isHkid': {
        			'message': getBundle(getBundleLanguage, 'applicant.hkId.notValid.message')
        		}
                // - new testing code - start -
                // , 'identical': {
                // // , 'different': {
                // 	'enabled': false,
                //     'field': 'fullName',
                //     'message': 'Name is not same'
                // }
                , 'callback': {
                    'callback': function(value, validator, $field) {
                        // console.log( validator );
                        // console.log('**********************************');
                        // console.log('*** just ran the callback script ~!! ***');
                        // console.log( validator.getFieldElements('hkid') );
                        // console.log( validator.getFieldElements('personalHKID').length );
                        // console.log( validator.getFieldElements('hkid').length );
                        // console.log('**********************************');
                        // console.log( $('.js__input_hkid') );
                        // console.log( $('.js__input_hkid').length );
                        // var $hkidDoc          = validator.getFieldElements('personalHKID[]');
                        var $hkidDoc          = $('.js__input_hkid');
                        var notEmptyCount    = 0;
                        var obj              = {};
                        var duplicateRemoved = [];

                        for (var i = 0; i < $hkidDoc.length; i++) {
                            var v = $hkidDoc.eq(i).val();
                            if (v !== '') {
                                obj[v] = 0;
                                notEmptyCount++;
                            }
                        }

                        for (i in obj) {
                            duplicateRemoved.push(obj[i]);
                        }

                        // if (duplicateRemoved.length === 0) {
                        //     return {
                        //         valid: false,
                        //         message: 'You must fill at least one email address'
                        //     };
                        // } else
                        if (duplicateRemoved.length !== notEmptyCount) {
                            return {
                                valid: false,
                                // message: getBundle(getBundleLanguage, 'insured.hkId.duplicate.message')
                                message: getBundle(getBundleLanguage, 'duplicate_hkid_no.message')
                            };
                        }

                        validator.updateStatus('personalHKID', validator.STATUS_VALID, 'callback');
                        return true;
                    }
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

fvConfig['insuredAdult'] = function() {
    return {
        'adultName': {
            'container': '#errtxtAdFullName'
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
        'adultHKID': {
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
        'adultAgeRange': {
            'container': '#errselectAgeRange'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        },
        'adultBeneficiary': {
            'container': '#erradultsselectBenificiary'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        }
    };
}();

fvConfig['insuredChild'] = function() {
    return {
        'childName': {
            'container': '#errtxtChldFullName'
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
        'childHKID': {
            'container': '#txtChldInsuHkid'
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
        'childAgeRange': {
            'container': '#errchildRange'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        },
        'childBeneficiary': {
            'container': '#errselectChildbenificiary'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        }
    };
}();

fvConfig['insuredOther'] = function() {
    return {
        'otherName': {
            'container': '#errtxtOtherFullName'
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
        'otherHKID': {
            'container': '#errtxtOtherInsuHkid'
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
        'otherAgeRange': {
            'container': '#errselectOtherAgeRange'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        },
        'otherBeneficiary': {
            'container': '#benificiary'
            , 'trigger': 'blur'
            , 'validators': {
                'notEmpty': {
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
            }
        }
    };
}();
