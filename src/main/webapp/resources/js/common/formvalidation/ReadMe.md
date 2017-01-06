**2017-01-06
    Rex     Suggested simplification:

            Philosophy behind 
            - Creating a library by abstracting another library induces unnecessary complexity

            1. Dynamic fields - Use Formvalidator's Addfield and templating approach
               http://formvalidation.io/examples/adding-dynamic-field/
            2. UX behavior / Field value binding should be done as independent as possible
               Trigger FV revalidate if necessary
            3. HKID uniqueness checking can be simplified
            4. Join Us form should be a reusable component, i.e. a seperate form instead of embedded. (This can be onhold until future revamp)
            5. Variable and function names are too long


**2016-12-05
    Gary    - 1) helpers.js "cb_hkidUniqueValidation()" bug is fixed, allow to  check HKID invalid, and tested on personal plan
            - 2) argCfg.helpers.attr.modifiedDOM() amended
            - 3) replace JSP code by JS, in "init.js", Line#101 - 116 >> if ( argCfg.flightJSPcbInfo.authenticate.equalDirect || argCfg.flightJSPcbInfo.authenticate.equalFalse )
            - 4) add event_returnValidUsernameChar(), event_returnValidEmailChar(), event_hideMembershipError()

**2016-12-02
    Gary    -   Testing & coding on
                // Under-development - Member Account Form - Opinion #A / #B

**2016-12-01
    Gary    - tooltip helper have 3 opinions, we choosed and using the option #1
                refer to [init.js] argCfg.helpers.attr.onchange.checkBox_tooltipFadeInOut()
                option #3 could be the task in JS revamp Phase #2
            - the var (as below) which date correlated with are migrated from "fwd.js" to "fwd-constant.js"
                dob_42_date
                dob_end_date
                dob_end_date_this_year
                dob_end_date_this_year_plus_90
                dob_65_date
                dob_12_date
                dob_10_date
                dob_start_date
                dob_70_date
                dob_69_date
                dob_70_99_date
            - Tooltip hide/show by checkBox have 3 opinions to do (refer to init.js)
                Opinion #1: Use currently
                Opinion #2: Code stacked in "helpers.userfulBackup.js", but not suggested to use
                Opinion #3: This is a good object structure to pass into the helper, but have to put more time checking any FV config can handle this behaviour.
                Opinion #4: FV callback solution (refer to validators.flightCare.config.js, around Line #114-128)
                (this part may solve in phase 2 revamp)
            - ... etc

**2016-11-30
    Gary    - moved the JS codes inside the flight-plan-details.jsp to fwd-utility.js.
            - ... etc

**2016-11-29
    Gary    - Applied FV "revalidate" for the binding fields.
            - Built / Migrated some functions and objects as below.
                {Object} fvConfig.helpers.fvCallback.hkidUniqueValidation
            - ... etc

**2016-11-28
    Gary    - start to build the fwd-utility.js
            - Adjusting the header.jsp & flight-plan-details.jsp external JS loading script
            - testing validating the unique value among multi-fields
            - Built / Migrated functions as below.
                {Function} fwdValidator.currentDevice.isMobile(),
                {Function} fwdUtility.ux.floatingBox()
                {Function} fwdUtility.counter.dateDiffInDaysFromNow(dat)
                {Function} fwdUtility.counter.dateDiffInDays(dat)
            - ... etc

**2016-11-23
    Irvine  - ... etc

    Gary    - Built / Migrated functions as below.
                fwdValidator.eventHandler.returnEngSpaceOnly()
                fwdValidator.eventHandler.returnHkidLegalCharOnly()
            - ... etc

**2016-11-22

    Irvine  - Testing on different fields validation.

    Gary    - start to DEV the "js/common/fwd-validator.js"
            - Aim to obsolete the "js/fwd.js", most of the validation-oriented function will be migrated to
            a) "js/common/fwd-validator.js",
            b) "js/common/fwd-utility.js",
            c) "js/common/fwd-payment.js",
            d) "js/common/fwd-constant" OR
            e) "js/common/formvalidation/helpers.js"

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
                2) REMARKED the orginal location migrated from,
                For Example (in "js/common/fwd-validator.js"),

                /* Migrated from "js/fwd.js", orginal function name < function IsHKID() > */

**2016-11-21
    Irvine  - create FV custom-rule

    .... (drafting)

    Gary    - Developing in MoSCoW Principle (better classification what global / external value should be included) and code-reused.
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
