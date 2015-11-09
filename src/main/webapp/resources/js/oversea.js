function msieversion() { 
   var ua = window.navigator.userAgent;
   var msie = ua.indexOf ( "MSIE " );

   if ( msie > 0 ){    // If Internet Explorer, return version number
      return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )));
   }else{                 // If another browser, return 0
      return 0;
	}
}
$(function() {
  if((msieversion() > 0) && (msieversion() < 10)){
	  console.log(msieversion());
	  $("#oversea_feature").find(".wow").css("visibility","show");
	  $("#oversea_feature_mob").find(".wow").css("visibility","show");
  }
});		