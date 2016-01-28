/************************** Ajax Manager ***************************/
var isCalling = false;
AjaxManager = {
    that: this,
    url:null,
    postData:null,
    callback:null,
    timeout:5000,

    fire:function(url, postData, successCallBack, _timeout, _method) {
    	console.log("ajax call url:"+url);
        console.log("ajax call data:"+postData);
        if (!isCalling) {
            isCalling = true;
            
            if (_timeout !== null) AjaxManager.timeout = _timeout;

            _method = (_method !== null)? _method : "POST";
            
            if (successCallBack) AjaxManager.callback = successCallBack;
            AjaxManager.url = url;
            AjaxManager.postData = postData;

            
            $.ajax({
            	timeout: AjaxManager.timeout,
				method: _method,
				dataType :"json",
				url: url+"?v="+Math.random(),
				data: postData
			})
			.error(function(x,t,m){
                AjaxManager.error(x,t,m);
            }).success(function(result){
                AjaxManager.success(result);
            });

        }
    },

    error: function(x,t,m) {
        isCalling = false;
        if(t==="timeout") {

            alert("Connection timeout, please try again."); //Connection timeout, please try again

        } else {
            alert("Connection error, please try again later.\n"+m); //Connection error, please try again later.
        }

        this.reset();
    },

    success:function(result){
        isCalling = false;
        AjaxManager.callback(result);
        this.reset();
    },

    reset: function(){
    	
    }
}
/************************** Ajax Manager ***************************/




FormValidate = {
    isEmpty: function(s){
        return ((s == null) || (s.length == 0))
    },

    isValidEmail: function(emailAddr){
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailAddr))
        return (true);
    },

    isNumber:function (str) {
        // body...
        charset = "0123456789";
        var result = true;

        for (var i=0;i<str.length;i++) {
            if (charset.indexOf(str.substr(i,1))<0) {
              result = false;
              break;
            }
        }

        return result;
    }, 

    isPhone:function (str) {
        // body...
        charset = "0123456789";
        var result = true;

        for (var i=0;i<str.length;i++) {
            if (charset.indexOf(str.substr(i,1))<0) {
              result = false;
              break;
        }
        }

        if(str.length!=8){
            result =  false;
        }
        /*
        sixpos=str.indexOf("6");
        ninepos=str.indexOf("9");
        fivepos=str.indexOf("5");
        if (sixpos!=0 && ninepos!=0 && fivepos!=0){
            result = false;
        }
        */

        return result;
    }

}