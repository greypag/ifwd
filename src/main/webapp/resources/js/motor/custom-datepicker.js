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
        $('.driverDob-datepicker').datepicker({
            format: "dd-mm-yyyy",
            startView: "decade",
            autoclose: true,
            startView: 2
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
    }
    if($('#expiry-datepicker').length){
        $('.driverDob-datepicker').datepicker({
            format: "dd-mm-yyyy",
            startView: "decade",
            autoclose: true,
            startView: 2
        }).change(function(e){
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
    }
    if($('#policy-datepicker').length){
        $('#policy-datepicker').datepicker({
            format: "dd-mm-yyyy",
            startView: "decade",
            autoclose: true,
            startView: 2
        }).change(function(e){
            var date = new Date($(this).datepicker('getDate'));
            var day = date.getDate()-1,
                month = date.getMonth()+1,
                year = date.getFullYear()+1;
            var oneYear = day + "-" + month + "-" + year; 
           $('.policy-end-date').html(oneYear);
            
            $(this).parents('.mdl-textfield--floating-label').removeClass('is-invalid').addClass('is-dirty');
        });
    }
});
