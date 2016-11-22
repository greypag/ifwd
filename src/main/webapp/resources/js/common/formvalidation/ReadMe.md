**2016-11-22

    Irvine  - Testing on different fields validation.

    Gary    - start to DEV the "js/common/fwd-validator.js"
            - Aim to obsolete the "js/fwd.js", most of the validation-oriented function will be migrated to "js/common/fwd-validator.js"

                ! --- IMPORTANT --- !
                1) REMARKED the migrated function in "js/fwd.js" as below
                For Example,

                /**
                *
                * For function IsHKID() -- ALREADY MIGRATED
                *
                * Caution to Developers:
                * If any updated, suggested to do in "resources/js/common/fwd-validator.js".
                *
                **/
                function IsHKID(str) {
                	var strValidChars ......
                }
                2) REMARKED the orginal location migrated from, remarked in "js/common/fwd-validator.js",
                For Example,

                /* Migrated from "js/fwd.js", orginal function name < function IsHKID() > */

**2016-11-21
    Irvine  - create FV custom-rule

    .... (drafting)

    Gary    - Developing in MoSCoW Principle, code-reused.
            - start to DEV the "js/common/fwd-constant.js"
            - merged the FV custom-rule, and created the "common/formvalidation/validators.custom-rule.config.js"
            - Suggestion on loading external JS file
                1st >> helpers.js
                2nd >> validators js files: validators.custom-rule.config.js, validators.flightCare.config.js etc...
                3rd >> init.js

                Examples,
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/helpers.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/validators.flightCare.config.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/validators.custom-rule.config.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/init.js" charset="utf-8"></script>

    .... (drafting)

**2016-11-14
    Irvine  - re-confirmed the client requirement on validators variables declaration format.
    .... (drafting)


**2016-11-11
    Gary    - added error handling for displaying browser console, if ...
                e.g. 'helpers.js' malfunction or 'helpers' / 'schema' modules missing
            - added comments for each functions created
            - modulized the 'helpers.js'
            - refined the validators.config.js by experience in "js/common/bootstrapvalidator_backup_20161109/base.config.js"
            - refined the 'js/common/fwd-constant.js'


**2016-11-10 & 2016-11-09
    Gary    - test & apply [FormValidation library, or called 'FV' below] to the "jsp/merged/flight/flight-plan-details.jsp"
            - @js/common, migrated and rebuild the code from "js/common/bootstrapvalidator" folder
                & created 'helpers.js', 'init.js', 'validators.config.js'
                & renamed "js/common/bootstrapvalidator" to "js/common/bootstrapvalidator_backup_20161109"
            - 'helpers.js' is dedicated for FV internal use ( still considering the availability & migration to fwd-utility.js
                with stream-library in the future )
            - 'validators.config.js' contains 'schema' & 'vrProperties'.
            - 'init.js' is a kick-start js file.
            - In DEV environment HTML, despite of dependencies, the order of external files are suggested to be loaded like below
                <link href="<%=request.getContextPath()%>/resources/css/vendor/formvalidation/dist/css/formValidation.css" rel="stylesheet" type="text/css" />
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/lodash.min.js"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-constant.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/formvalidation/dist/js/formValidation.js"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/formvalidation/dist/js/framework/bootstrap.min.js"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/helpers.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/validators.config.js" charset="utf-8"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/init.js" charset="utf-8"></script>
            - confirmed & recognized the client requirement on "array list for validators" in 'init.js'
            - confirmed & recognized the client requirement on "properties in validators" in 'validators.config.js'
