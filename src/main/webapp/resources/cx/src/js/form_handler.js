(function ($) {
var validator = { 
    required: function(val){
		var re = /^\s*$/gi;
        return !(re.test(val));
	},
    script: function(val){
		var re = /<script[\s\S]*?>[\s\S]*?<\/script>/gi;
        return !(re.test(val));
	}, 
    symbol: function(val){
		var re = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/;
        return !(re.test(val));
	}, 
    email: function(val){
        var re = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))(\.|))+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
        return re.test(val); 
	},
    username: function(val){ // 6 - 50 characters
		var re = /^[\.\-\_0-9a-zA-Z]{6,50}$/;
        return re.test(val);
	},
    phone: function(val){ // 8 digits only
		var re = /^\d{8}$/;
        return re.test(val);
	},
    password: function(val){ // at least 8 character - at least 1 digit, 1 lower case, 1 upper case
		var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
        return re.test(val);
	},
    confirm_password: function(val){ // exact match
        var pw = $('#password').val();
		var re = new RegExp('\^' + pw + '\$', "gi");
        return re.test(val);
	},
    whitespace: function(val){ // no white space
		var re = /\s/g;
        return !(re.test(val));
	},
    alphanumeric: function(val){ // digits or letters only
		var re = /^\d|[a-zA-Z]$/;
        return !(re.test(val));
	},
    checkbox: function(){ 
        return $('#agreement').prop("checked");
	}       
}, digitInput = function (evt) {
    var theEvent = evt || window.event;    
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode( key );
    var regex = /[0-9]|[\b]|[\t]|[+-]/;
    if( !regex.test(key)) {
        theEvent.returnValue = false;
        if(theEvent.preventDefault) 
            theEvent.preventDefault();
    }
}, emailInput = function (evt) {
    var theEvent = evt || window.event;    
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode( key );
    var regex = /[a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}\[\]~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|@|[\b]|[\t]|\./;
    if( !regex.test(key)) {
        theEvent.returnValue = false;
        if(theEvent.preventDefault) 
            theEvent.preventDefault();
    }
}, flightNumberInput = function (evt) {
    var theEvent = evt || window.event;    
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode( key );
    var regex = /[0-9]|[a-zA-Z]/;
    if( !regex.test(key)) {
        theEvent.returnValue = false;
        if(theEvent.preventDefault) 
            theEvent.preventDefault();
    }
}, usernameInput = function (evt) {
    var theEvent = evt || window.event;    
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode( key );
    var regex = /[\.\-\_0-9a-zA-Z]/;
    if( !regex.test(key)) {
        theEvent.returnValue = false;
        if(theEvent.preventDefault) 
            theEvent.preventDefault();
    }
}

var form = function() {

    var $form, $submit, $fields, $labels, $submit;

    function init() {

        $form = $("form");       
        if($form.length >= 1)
            $form.get(0).reset();
        
        $fields = $form.find("input");
        $error = $form.find(".error-message");

        $submit = $form.find("#submit");
        if(!$('body').hasClass('t2'))
            $submit.removeClass('disabled');
        
        $fields.blur(function() {
            validate($(this));
        });
                
        $('input[type=checkbox]').click(function() {
            validate($(this));
        });
        
        $('input[type=tel]').keypress(function() {
            if($(this).val().length >= 8)
                return false;
        });
        
        $("input").focus(function() {
            $(this).parent().addClass("expand focus");
        }).blur(function() {
            if($(this).val().length < 1)
                $(this).parent().removeClass("expand focus");
            else
                $(this).parent().removeClass("focus");
        });
        
        $('input[name=discount]').change(function() {
            var $discount_val = $('input[name=discount]:checked').val();
            if( typeof($discount_val) != undefined && $discount_val != null)
                $('.next').removeClass('disabled');
        });

        $submit.click(submit);
    }

    function validate($fields) {
        var valid = true;

        if (!validator)
            return valid;

        $fields.each(function(idx, ele) {

            var $ele = $(ele);
            hideError($ele);
            
            if ($ele.data("validate")) {
                var val = $ele.val(),
                    to_validate = $ele.data("validate").split(" "),
                    l = to_validate.length;

                for (var i = 0; i < l; i++) {
                    var result = false;

                    switch (to_validate[i]) {
                        default:
                            result = eval('validator.' + to_validate[i] + '(val)');
                            break;
                    }                    
                    if (!result)
                        break;                    
                }
                if (!result) {
                    showError($ele);
                    valid = false;
                }else
                    hideError($ele);
            }
        });

        return valid;
    }

    function showError($ele) {
        $fields.filter("[id='" + $ele.attr("id") + "']").parents('li').addClass("error").removeClass("ok");
    }

    function hideError($ele) {
        $fields.filter("[id='" + $ele.attr("id") + "']").parents('li').removeClass("error").addClass("ok");
    }

    function submit() {
        if( !$submit.hasClass('disabled') ){
            if (validate($fields)) {
                $submit.addClass('disabled');
//                alert('submit');
                
                $form.submit();                          
            } else {
                animateScroll($('.error:eq(0)').offset().top, 100);
            }
        }      
    }

    return {
        init: init
    }
}();

$('document').ready(function(){   
    form.init(); 
    
    var $body = $('body'); 
   
    $( "form input" ).keypress(function(event) {           
        if( $(this).attr('type') == 'tel' )
            digitInput(event);
        else if( $(this).attr('type') == 'email' )
            emailInput(event);
        else if( $(this).attr('name') == 'flight' )
            flightNumberInput(event);
        else if( $(this).attr('name') == 'username' )
            usernameInput(event);
    });                   
});
    
$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        $("#submit").removeClass("disabled");
    }
});

})(jQuery);

