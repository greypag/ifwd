'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check "fvConfig"
    if ( typeof fvConfig === "undefined" && fvConfig === null ) { var fvConfig = {}; }

    // MUST - Check FV customed-made helpers, calling example: fvConfig.helpers.xxxx
    if ( !_.has(fvConfig, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }

    // MUST - Check fwdConstant : RegExp etc. , calling example: fvConfig.regex.xxxx
    if ( typeof fwdConstant === "object" || fwdConstant === null ) { throw ('No fwd-constant.js are loaded. Please check again.'); }

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
fvConfig['role/group/anyThingYouWanna'] = function() {
    var buffer = {};

    
    // return helpers.genConfig(buffer);
    return null;
}();
