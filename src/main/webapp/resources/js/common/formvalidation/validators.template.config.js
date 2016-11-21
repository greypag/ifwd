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

// Descripe "properties" under validator
fvConfig['validators'] = function() {
    var buffer = {};



    // return helpers.genConfig(buffer);
    return null;
}();
