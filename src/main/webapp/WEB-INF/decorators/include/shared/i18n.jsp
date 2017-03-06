<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.i18n.properties-min-1.0.9.js"></script>

<script>

	var getBundleLanguage = "";
	var lang = UILANGUAGE.toUpperCase();

	if(lang === "EN") {
		getBundleLanguage = "en";
	} else {
		if(lang === "TC") {
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