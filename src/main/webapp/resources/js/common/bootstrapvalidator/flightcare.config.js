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
