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
            $('.occupation').find('input[type="text"]').data('required-error', $('.occupation').data('required-error'));
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
        preload: true,
        load: function(query, callback) {
            $('#area-selectized').data('required-error', $('#area').data('required-error'));
        }
    });
    $('[name="bankMortgage"]').bootstrapSwitch({
        onText: '',
        offText: '',
        //        labelWidth: '10',
        //      handleWidth: '10',
		inverse: true,
        onSwitchChange: function(e, state){
            if(state)
                $('.mortgageBank').removeClass('hidden');
            else
				$('.mortgageBank').addClass('hidden');
               
        }
    });
    var totalDriver = $('.added-driver').length;
    var current = 0;
    $('#addDriver').on('click', function(e){
        e.preventDefault();
        if(current < totalDriver){
            $('.added-driver').eq(current).removeClass('hidden');
			$('.added-driver').eq(current).find('input').prop('required',true);
			$('.added-driver').eq(current).find('select').prop('required',true);
            if(current > 0){
                $('.added-driver').eq(current-1).find('.removeDriver').addClass('hidden');
            }
            current += 1;
            if (current == totalDriver) {
                $(this).addClass('hidden');
            }
        }
        // console.log(current);
    });
    $('.removeDriver').on('click', function(e){
        e.preventDefault();
        $(this).parents('.added-driver').find('input').prop('required',false);
		$(this).parents('.added-driver').find('input').prop('select',false);
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
    $('#sendDriverDetail').on('click', function(e){
        e.preventDefault();
		$('#policyDetails').validator('validate');
      //  $('#motor_registerForm').validator('validate');
        // if($('#expiry-datepicker').val() == ""){
        //     $('#expiry-datepicker-group').addClass('has-error has-danger');
        //     $('#expiry-datepicker-error').html($('#expiry-datepicker').data('required-error'));
        // }
    });
    // $('#sendDriverDetail').on('click', function(e){
    //     e.preventDefault();
    //     $('#motor_registerForm').validator('validate');
    // });

	$('#declarations').validator().on('submit', function (e) {
  if (e.isDefaultPrevented()) {
    // handle the invalid form...
  alert('1');
  } else {
    // everything looks good!
  alert('2');
  }
})
	
    $('#closeUserName').on('click', function(e){
    $('#forgotUserNamePopup').addClass('hidden');
    });
    $('#closeUserPass').on('click', function(e){
    $('#forgotUserPassPopup').addClass('hidden');
    $('.loginPanel').css({'height':'auto'});
    });
    $('#forgotUserName').on('click', function(e){
         e.preventDefault();
    $('#forgotUserNamePopup').removeClass('hidden');
    });
    $('#link-forgotPassword').on('click', function(e){
         e.preventDefault();
    $('#forgotUserPassPopup').removeClass('hidden');
    $('.loginPanel').css({'height':'400'});
    
    });

});
