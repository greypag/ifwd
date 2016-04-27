var application = application || {};


application.common = {
	dataAttributes:[
		"data-keycheck-numOnly"
	],
	init:function(){
		
		var that = this;
		//jQuery required
		

		var inputs_arr = [];
		$(that.dataAttributes).each(function(key,val){ inputs_arr.push(String("input[{0}='true']").replace("{0}",val)); });

		var inputs = $(inputs_arr.join(","));

		inputs.each(function(){
			var d = $(this).data();

			for(var i in d){
				switch(i){
					case "keycheckNumonly":
						$(this).on("keypress",that.chkNumberOnly);
						break;
				}
			}
		});
	},
	chkNumberOnly:function(evt){
		var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

		return true;
	},

	//Common Validator

	validateCardHolder :function (fnameElm,lnameElm,cHolderElm){
		
		var firstName= $(fnameElm).val().trim().split(',')[0].toUpperCase();
		var lastName= $(lnameElm).val().trim().toUpperCase();
		var firstNameSub = firstName.split(' ');
		var shortNameSub = firstName.split(' ').map(function(name){ return name.substring(0,1).trim() + '.';});

		if ( firstName.trim() == '' || lastName.trim() == '' ) {
		 return false;
		}

		/* Build List */
		var whiteList = [];
		var ignoreList = [];
		var minWords = (firstNameSub.length==1)?1:2;
		for( var i=minWords; i<=firstNameSub.length; i++ ){
			var a1 = firstNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + ' ' + cV; }, []).trim();
			var a2 = firstNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + cV; }, []).trim();
		 	var b1 = shortNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + ' ' + cV; }, []).trim();
		 	var b2 = shortNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + cV; }, []).trim();
		 	whiteList.push(lastName + ' ' + a1);
		 	whiteList.push(lastName + ' ' + a2);
		 	whiteList.push(lastName + ' ' + b1);
		 	whiteList.push(lastName + ' ' + b2);
		 	whiteList.push(a1 + ' ' + lastName);
		 	whiteList.push(a2 + ' ' + lastName);
		 	whiteList.push(b1 + ' ' + lastName);
		 	whiteList.push(b2 + ' ' + lastName);
		}

		var cardHolderName = $(cHolderElm).val().trim().toUpperCase();
		for( var i=0; i< whiteList.length; i++ ){
			if( cardHolderName.indexOf(whiteList[i])>-1 ) {
				return true; 
			}
		}
		return false;
	}
};

$(document).ready(function(){
	application.common.init();
});