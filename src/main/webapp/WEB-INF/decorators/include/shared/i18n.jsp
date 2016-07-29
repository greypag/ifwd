<script>

	var getBundleLanguage = "";
	var lang = UILANGUAGE;

	if(lang === "EN") {
	    getBundleLanguage = "en";
	} else {
		if(lang === "tc") {
		    getBundleLanguage = "zh";
		} else {
		    getBundleLanguage = "en";
		}
	}

	var home_url = "<%=request.getContextPath()%>";

	/* New GetBundle */
	var _fwdErrMsg;

	$.i18n.properties({
	   name: 'Messages',
	   path: ''+home_url+'/resources/bundle/',
	   mode: 'map',
	   language: getBundleLanguage,
	   cache: false,
	   callback: function() {
	   	_fwdErrMsg = $.extend(true, {}, $.i18n);
	   }
	});


	function fwdGetBundle(lang, key){
		return (_fwdErrMsg && _fwdErrMsg.map[key])?(_fwdErrMsg.map[key]):'['+key+']';
	}

	function getBundle(lang, key){
		return fwdGetBundle(lang,key);
	}

</script>