$(document).ready(function () {
    $('#content-datepicker').datepicker({
        format: "dd-mm-yyyy",
        startView: "decade",
        autoclose: true,
        startView: 2
    }).change(function(e){
        $('label[for="content-datepicker"]').addClass('hidden');
    });
    $('#content-datepicker').focus(function () {
        $(this).parent().find('.custom-made-label').css({color: '#ff8200'});
    }).focusout(function (){
        $(this).parent().find('.custom-made-label').css({color: '#000000'});
    });
    if($('.driverDob-datepicker').length){
        // 18 year ago date
        var dob_end_date = new Date();
        dob_end_date.setFullYear(dob_end_date.getFullYear()-25);
        // 60 year ago date
        var dob_start_date = new Date();
        dob_start_date.setFullYear(dob_start_date.getFullYear()-70);
        dob_start_date.setDate(dob_start_date.getDate()+1);
        //alert(dob_end_date);
        $('.driverDob-datepicker').val(dob_end_date.getDate() + '-' + (dob_end_date.getMonth() + 1) + '-' + dob_end_date.getFullYear());
        $('.driverDob-datepicker').mobiscroll().calendar({
            controls: ['date'],
            minDate: dob_start_date,
            maxDate: dob_end_date,
            showLabel: true,
            dateOrder: 'ddmmyy',
            dateFormat: 'dd-mm-yyyy',
            theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
            mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
            display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
            //	onClosed:onClosed,
            lang: UILANGUAGE  == "EN" ? "en_fwd" : "zh_fwd"
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
        // $('.driverDob-datepicker').datepicker({
        //     format: "dd-mm-yyyy",
        //     startView: "decade",
        //     autoclose: true,
        //     startView: 2
        // }).change(function(e){
        //     $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        // });
    }
    
    if($('.driverDob-dp').length){
        // 18 year ago date
        var dob_end_date = new Date();
        dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
        // 60 year ago date
        var dob_start_date = new Date();
        dob_start_date.setFullYear(dob_start_date.getFullYear()-100);
        dob_start_date.setDate(dob_start_date.getDate()+1);
        //alert(dob_end_date);
        $('.driverDob-dp').val(dob_end_date.getDate() + '-' + (dob_end_date.getMonth() + 1) + '-' + dob_end_date.getFullYear());
        $('.driverDob-dp').mobiscroll().calendar({
            controls: ['date'],
            minDate: dob_start_date,
            maxDate: dob_end_date,
            showLabel: true,
            dateOrder: 'ddmmyy',
            dateFormat: 'dd-mm-yyyy',
            theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
            mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
            display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
            //	onClosed:onClosed,
            lang: UILANGUAGE  == "EN" ? "en_fwd" : "zh_fwd"
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
    }

    if($('#expiry-datepicker').length){
    	var qdate = quote.policyStartDate,
    	dsplit = qdate.split("-"),
    	startDate = new Date(dsplit[2],dsplit[1]-1,dsplit[0]),
        min = new Date(startDate.getFullYear()-1, startDate.getMonth(), startDate.getDate()),
        max = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate());

        var dob_end_date = new Date();

        $('#expiry-datepicker').val(max.getDate() + '-' + (max.getMonth() + 1) + '-' + max.getFullYear());

        $('#expiry-datepicker').mobiscroll().calendar({
            controls: ['date'],
            minDate: min,
            maxDate: max,
            showLabel: true,
            dateOrder: 'ddmmyy',
            dateFormat: 'dd-mm-yyyy',
            theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
            mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
            display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
            lang: UILANGUAGE  == "EN" ? "en_fwd" : "zh_fwd"
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
    }
	

    if($('#policy-datepicker').length){
        var now = new Date(),
        dob_end_date = now,
        max = new Date(now.getFullYear(), now.getMonth() + 3, now.getDate());
        
        $('#policy-datepicker').val(dob_end_date.getDate() + '-' + (dob_end_date.getMonth() + 1) + '-' + dob_end_date.getFullYear());

        var _policyEndDate = getPolicyEndDate(now);
        var _policyEndDateDisplay = getPolicyDateDisplay(_policyEndDate);
        $('.policy-end-date').text(_policyEndDateDisplay);
		
        $('#policy-datepicker').mobiscroll().calendar({
            controls: ['date'],
             minDate:dob_end_date,
             maxDate: max,
            showLabel: true,
            dateOrder: 'ddmmyy',
            dateFormat: 'dd-mm-yyyy',
            onSelect: function (dateText, inst) {
                // Update start date and start label
                var policyDate = inst.getDate();
                var _policyEndDate = getPolicyEndDate(policyDate);
                var _policyEndDateDisplay = getPolicyDateDisplay(_policyEndDate);
                $('.policy-end-date').text(_policyEndDateDisplay);
            },
            theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
            mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
            display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
            //	onClosed:onClosed,
            lang: UILANGUAGE  == "EN" ? "en_fwd" : "zh_fwd"
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
            });
            // $('#policy-datepicker').datepicker({
            //     format: "dd-mm-yyyy",
            //     startView: "decade",
            //     autoclose: true,
            //     startView: 2
            // }).change(function(e){
            //     var date = new Date($(this).datepicker('getDate'));
            //     var day = date.getDate()-1,
            //         month = date.getMonth()+1,
            //         year = date.getFullYear()+1;
            //     var oneYear = day + "-" + month + "-" + year; 
            //    $('.policy-end-date').html(oneYear);

            //     $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
            // });
        }

    });

function getPolicyEndDate(startDate){

    //One year less one day
    var day = startDate.getDate()-1,
        month = startDate.getMonth(),
        year = startDate.getFullYear()+1;

    return new Date(year, month, day);    
}

function getPolicyDateDisplay(dateToDisplay){
    return dateToDisplay.getDate() + "-" + (dateToDisplay.getMonth()+1) + "-" + dateToDisplay.getFullYear(); 
}
