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
        dob_start_date.setFullYear(dob_start_date.getFullYear()-75);
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
    	var now = new Date(),
        min = new Date(now.getFullYear()-1, now.getMonth(), now.getDate()),
        max = new Date(now.getFullYear(), now.getMonth(), now.getDate()-1);

        var dob_end_date = new Date();

        $('#expiry-datepicker').val(dob_end_date.getDate()-1 + '-' + (dob_end_date.getMonth() + 1) + '-' + dob_end_date.getFullYear());
       // var maxdate = new Date();
      //  var mindate = new Date();
      //  mindate.setDate(mindate.getDate()-180);

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
            //	onClosed:onClosed,
            // onShow: function (html, valueText, inst) {
            // $('#expiry-datepicker-group').removeClass('has-error has-danger');
            // $('#expiry-datepicker-error').html('');
            // },
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

        $('.policy-end-date').html((dob_end_date.getDate()-1) + '-' + (dob_end_date.getMonth() + 1) + '-' + (dob_end_date.getFullYear()+1));
		
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
                var day = policyDate.getDate()-1,
                    month = policyDate.getMonth()+1,
                    year = policyDate.getFullYear()+1;
                var oneYear = day + "-" + month + "-" + year; 
                $('.policy-end-date').html(oneYear);
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
