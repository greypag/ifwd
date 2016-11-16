$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        //window.location.reload();
        $('#loading-overlay').modal('hide');
        $("#PaymentingDiv").hide();
        $("#button_confirm").show();
    }
});
function switchLoginWdiget(loginStatus){
	//console.log(loginStatus);
	$(".js-not-logged-in").remove();
	$(".js-logged-in").removeClass("hidden");
	$("#loginpopup").modal("hide");
	$(".js-myDropdown__userName").append(loginStatus.fullName);
	/*$.ajax({
		type : "GET",
		url : "<%=request.getContextPath()%>/api/member/session",
		async : false,
		success : function(data) {
			console.log(data);
		}
	});*/
}
function submitLoginForm(formID) {
    $('.login-ajax-loading').css({
        "left": "0px",
        "right": "0px"
    });
    $('.login-ajax-loading').show();
    $("#" + formID + ' #login-err-msg').html("");
    $("#" + formID + ' #login-err-msg').hide();
    setTimeout(function() {
        if (validUser(formID)) {
            $.ajax({
                type: "POST",
                url: context + "/userLogin",
                data: $("#" + formID).serialize(), //$("#headerLoginForm form").serialize(),
                async: false,
                success: function(data) {
                    if (data.loginResult == 'success') {
                    	//console.log(data);
                    	switchLoginWdiget(data);                    	
                        //$('.login-ajax-loading').hide();
                        //var Backlen = history.length;
                        //history.go(-Backlen);
                        if (((window.location.href.length - window.location.href.indexOf("tc") <= 3) ||
                                (window.location.href.length - window.location.href.indexOf("en") <= 3) ||
                                (window.location.href.length - window.location.href.indexOf("home") <= 4)) &&
                            $('#loginpopup #nav-bar-check').val() == 'false') {
                            getStarted();
                            $("#fullName").html(data.fullName);
                            $("#fullName1").html(data.fullName);
                        } else if (window.location.href.indexOf("savings-insurance/plan-details-") > 0) {
                            // && $('#loginpopup #nav-bar-check').val() == 'false'
                            $("#fullName").html(data.fullName);
                            $("#fullNames").html(data.fullName);
                            $("#fullName1").html(data.fullName);
                            saviePlanDetailsGoNext();
                        } else if (window.location.href.indexOf("medical-insurance/plan-option") > 0) {
                            $('#loginpopup').modal('hide');
                            $("#offline-online-modal").modal('show');
                        } else if (window.location.href.indexOf("term-life-insurance/select-plan") > 0) {
                            perventRedirect = false;
                            ga('send', 'event', 'Login', 'Click', 'Login success');
                            window.location.href = context + "/" + currentLang + "/term-life-insurance/select-plan?goApp=" + $('#goApp').val();
                        } else {
                            perventRedirect = false;
                            ga('send', 'event', 'Login',
                                'Click',
                                'Login success');
                            //location.reload();
                            //window.location.href = window.location.href;
                        }
                    } else if (data.loginResult == 'Provided User Account Details Does Not Exist') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "member.login.fail.first"));
                    } else if (data.loginResult == 'Please provide a valid User Name and Password.') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "member.login.fail.first"));
                    } else if (data.loginResult == 'Link Sent Successfully On Your Registered Mail ID') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "member.forgotPassword.success.message"));
                    } else if (data.loginResult == 'Internet Connection Error') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "Connection.lost.message"));
                    } else if (data.loginResult == 'Invaild Username or password. Please try again.') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "member.login.fail.first"));
                    } else if (data.loginResult == 'Invaild Username or password. Next invalid attempt will block your account.') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg')
                            .show();
                        $("#" + formID + ' #login-err-msg')
                            .html(
                                getBundle(
                                    getBundleLanguage,
                                    "member.login.fail.second"));
                    } else if (data.loginResult == 'Your username has been locked out, please reset your password by \'Forget Password\'.') {
                        try {
                            $('.login-ajax-loading').hide();
                        } catch (error) {}
                        $('#ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg').show();
                        $("#" + formID + ' #login-err-msg').html( getBundle(getBundleLanguage, "member.login.fail.third") );
                    } else if (data.loginResult == 'fail') {
                        $('.login-ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg').show();
                        $("#" + formID + ' #login-err-msg').html( getBundle(getBundleLanguage, "member.login.fail.first") );
                    } else {
                        $('.login-ajax-loading').hide();
                        $("#" + formID + ' #login-err-msg').show();
                        $("#" + formID + ' #login-err-msg').html(data.loginResult);
                    }
                },
                error: function() {
                    $('.login-ajax-loading').hide();
                    $('.login-ajax-loading').hide();
                    $("#" + formID + ' #login-err-msg').show();
                    $("#" + formID + ' #login-err-msg').html(data.loginResult);
                }
            });
        } else {
            $('.login-ajax-loading').hide();
        }
        $('.login-ajax-loading').hide();
    }, 1000);
}

var nextPage;

function getStarted() {
    /* $.ajax({
		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
		    type:'get',
		    data:{
  	    	"planCode" : "SAVIE-SP"
     		},
		    error:function(){
		    },
		    success:function(data){
		    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
		    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
			    	$('#loginpopup').modal('hide');
		    		$('#prev-savie-app-modal').modal('show');
		    	}else{ */
    $.ajax({
        url: pageContext.request.contextPath + '/ajax/savings-insurance/getPolicyApplicationSaveforLater',
        type: 'get',
        error: function() {},
        success: function(data) {
            if (data != null && data.errMsgs == null && data.nextPage != null) {
                $('#retrieve-application-modal').modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $('#loginpopup').modal('hide');
                $('#retrieve-application-modal').modal('show');
                nextPage = data.nextPage;
            } else {
                $.ajax({
                    url: pageContext.request.contextPath + '/ajax/savings-insurance/show',
                    type: 'get',
                    error: function() {},
                    success: function(data) {
                        if (data != null && data.errMsgs == null && data.name != null) {
                            $('#review-fna-modal').modal({
                                backdrop: 'static',
                                keyboard: false
                            });
                            $('#loginpopup').modal('hide');
                            $('#review-fna-modal').modal('show');
                        } else {
                            window.location = context + '/' + currentLang + '/FNA/financial-needs-analysis';
                        }
                    }
                });
            }
        }
    });
    /* }
		    }
		}); */
}
