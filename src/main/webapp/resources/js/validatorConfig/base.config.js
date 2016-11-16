var bsvConfig = {
    "row": {
        "valid": 'has-success',
        "invalid": 'has-error'
    },
    "fields": {
        "fullName": {
            "container": '#fullnameinvalid',
            "validators": {
                "notEmpty": {
                    "message": getBundle(getBundleLanguage, "error.contact.person.name.empty")
                }
            }
        },
        "hkid": {
            "container": '#errAppHkid',
            "validators": {
                "notEmpty": {
                    "message": getBundle(getBundleLanguage, "applicant.hkId.notNull.message")
                }
            }
        },
        "applicantDob": {
            "container": '#dobInvalid',
            "validators": {
                "notEmpty": {
                    "message": getBundle(getBundleLanguage, "applicant.dob.notNull.message")
                }
            }
        },
        "mobileNo": {
            "container": '#mobileNoInvalid',
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
        "emailAddress": {
            "container": '#emailid',
            "validators": {
                "notEmpty": {
                    "message": getBundle(getBundleLanguage, "applicant.email.notNull.message")
                },
                "emailAddress": {
                    "message": getBundle(getBundleLanguage, "applicant.email.notValid.message")
                }
            }
        }
    }
};

bsvConfig['flightCare'] = {
    "personalName": {
        "container": '#errtxtPersonalFullName1',
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.name.notNull.message")
            },
            "onSucces": function(e, data) {
                if (!data.fv.isValidField('fullName')) {
                    // Revalidate it
                    data.fv.revalidateField('fullName');
                }
            }
        }
    },
    "personalHKID": {
        "container": '#errtxtInsuHkid1',
        "validators": {
            "notEmpty": {
                "message": getBundle(getBundleLanguage, "insured.hkId.notNull.message")
            }
        }
    }
};
