$(document).ready(function(){
    $('#mortgageBank').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#mortgageBank-selectized').data('required-error', $('#mortgageBank').data('required-error'));
            $.ajax({
                url: '/api/iMotor/carDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('.occupation').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $.ajax({
                url: '/api/iMotor/driverDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('#district').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#district-selectized').data('required-error', $('#district').data('required-error'));
            $.ajax({
                url: '/api/iMotor/carDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('#area').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#area-selectized').data('required-error', $('#area').data('required-error'));
            $.ajax({
                url: '/api/iMotor/carDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('[name="bankMortgage"]').bootstrapSwitch({
        onText: '',
        offText: '',
        labelWidth: '20',
        handleWidth: '20',
        onSwitchChange: function(e, state){
            if(state)
                $('.mortgageBank').addClass('hidden');
            else
                $('.mortgageBank').removeClass('hidden');
        }
    });
    var totalDriver = $('.added-driver').length;
    var current = 0;
    $('#addDriver').on('click', function(e){
        e.preventDefault();
        if(current < totalDriver){
            $('.added-driver').eq(current).removeClass('hidden');
            if(current > 0){
            $('.added-driver').eq(current-1).find('.removeDriver').addClass('hidden');
            }
            current += 1;
            if (current == totalDriver) {
                $(this).addClass('hidden');
            }
        }
        console.log(current);
    });
    $('.removeDriver').on('click', function(e){
        e.preventDefault();
        $(this).parents('.added-driver').find('input').val('');
        $(this).parents('.added-driver').find('input:checkbox').removeAttr('checked');
        $(this).parents('.added-driver').find('option').removeAttr('selected');
        $(this).parents('.added-driver').addClass('hidden');
        $(this).parents('.added-driver').prev().find('.removeDriver').removeClass('hidden');
        if(current == totalDriver){
            $('#addDriver').removeClass('hidden');
        }
        current -= 1;
    });
});
