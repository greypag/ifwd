var application = application || {};

/*
Create new restriction and strict event
1) Add new data attribute
2) Add new pattern
3) Add new function
*/

application.common = {
	dataAttributes:[
		"data-keyblock-alphabet",
		"data-keyblock-alphabet-space",
		"data-keyblock-num",
		"data-keyblock-alphabet-num-space-dash",
		"data-keyblock-alphabet-num-space"
	],

	pattern:{
		Alphabet : /^[a-zA-Z]*$/,
		AlphabetSpace : /^[a-zA-Z\s]*$/,
		Num : /^[0-9]*$/,
		Email : /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/,
		Mobileno:/^1[0-9]{10}$|^[5689][0-9]{7}$/,
		AlphabetNumSpaceDash : /^[a-zA-Z0-9\s\-]*$/,
		AlphabetNumSpace : /^[a-zA-Z0-9\s]*$/
	},

	stripPattern:{
		Alphabet : /[^a-zA-Z]/g,
		Num : /[^0-9]/g,
		Space : /[^\s]/g,

		AlphabetNum : /[^a-zA-Z0-9]/g,
		AlphabetSpace : /[^a-zA-Z\s]/g,
		AlphabetNumSpace : /[^a-zA-Z0-9\s]/g,
		AlphabetNumSpaceDash : /[^a-zA-Z0-9\s\-]/g,
		AlphabetNumSpaceDot:/[^\sa-zA-Z.]/g

	},
	
	kbFnKey:[
	         8,		//backspace
	         45,	//Insert
	         46,	//Delete
	         36,	//Home
	         35,	//End
	         37,	//Left
	         38,	//Top
	         39,	//Right
	         40		//Bottom
	],

	validate :function(str,pattern){

		var that = this;
		var result = false;

		if(!that.pattern[pattern]){
			console.log("missing pattern",pattern);
			return false;
		}else{
			return that.pattern[pattern].test(str);
		}

	},

	init:function(){
		
		var that = this;
		//jQuery required
		

		var inputs_arr = [];
		$(that.dataAttributes).each(function(key,val){ inputs_arr.push(String("input[{0}='true']").replace("{0}",val)); });

		var inputs = $(inputs_arr.join(","));

		inputs.each(function(){
			var d = $(this).data();

			for(var sEvt in d){

				sEvt = (typeof sEvt === 'string') ? sEvt:null;

				if(sEvt != null){
					
					$(this).on("keypress",function(evt){
						return that.keyblock(evt,sEvt.replace("keyblock",""));
					});
				
					$(this).on("blur",function(evt){
						return that.keystrip(evt,sEvt.replace("keyblock",""));
					});
				}
			}
		});
	},

	add:function(){

	},

	keyblock:function(evt,s){

		var that = this;
		//check existed function or pattern
		if(typeof that[s] == "function"){
			return that[s](evt);
		}else if(that.pattern[s]){
			var charCode = (evt.which) ? evt.which : evt.keyCode;
			if($.inArray(charCode,that.kbFnKey) == -1){
				var keychar = String.fromCharCode(charCode);
				return that.pattern[s].test(keychar);
			}else{
				return true;
			}
			
		}else{
			console.log("missing custom function or pattern");
			return false;
		}

		
	},

	keystrip:function(evt,s){
		var that = this;

		//check existed function or pattern
		if(typeof that[s] == "function"){
			that[s](evt);
		}else if(that.stripPattern[s] ){
			var target = evt.currentTarget;
			var string = target.value;
			string = string.replace(that.stripPattern[s], '');
			target.value = string;
		}else{
			console.log("missing custom function or pattern");
		}


		
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