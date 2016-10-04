<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
	/*********
		Define Java variaibles
	**********/

	String requestUri = request.getRequestURI();
	String siteURL = request.getContextPath();

	boolean langFlag = false;
 	if(session.getAttribute("language") != null){
		langFlag = true;
 	} else {
		langFlag = false;
 	}
	String langBodyClass = (langFlag && "EN".equals(session.getAttribute("language").toString().toUpperCase()))?"":"chin";

	String username = (String)session.getAttribute("username");

	boolean isAuthenticated = session.getAttribute("authenticate") != null && session.getAttribute("authenticate")=="true";
	boolean isDirect = session.getAttribute("authenticate") != null && "direct".equalsIgnoreCase(session.getAttribute("authenticate").toString());

	String actionName = "";
	if (request.getAttribute("controller") != null) {
		actionName = request.getAttribute("controller").toString();
	}

%>

<!DOCTYPE HTML>
<html>
	<head>

	<!--Template V2-->

	<%-- Meta data--%>
		<%@ include file="include/shared/meta_tag.jsp"%>
		<%@ include file="include/shared/social_network.jsp"%>
	<%-- End Meta data--%>

	<%-- Core Header Scripts--%>
		<%@ include file="include/shared/core_css.jsp"%>
		<%@ include file="include/shared/core_js.jsp"%>
		<%@ include file="include/shared/i18n.jsp"%>

		<script>
			var context = "${pageContext.request.contextPath}";
			var language = "${language}";
			var affiliate = "${affiliate}";
			var home_url = "<%=request.getContextPath()%>";
			<%--For Savie online 2016 JS --%>
			var getpath = "<%=request.getContextPath()%>";
			<%--For Savie online 2016 JS END--%>
			var actionName = "<%=actionName%>";

			/*
			 * Global Site Variables
			 */
			var Site = {
				'context':'${pageContext.request.contextPath}',
				'language': '${language}',
				'affiliate': '${affiliate}',
				'actionName': '<%=actionName%>'
			};

		</script>
	<%-- End Core Header Scripts--%>

	<%-- Browser Specific Scripts--%>
		<%@ include file="include/shared/IE8_scripts.jsp"%>
		<%@ include file="include/shared/IE9_scripts.jsp"%>
		<%@ include file="include/shared/IOS_chrome.jsp"%>
	<%-- End Browser Specific Scripts--%>

	<%-- Tracking Scripts--%>
		<%@ include file="include/shared/vwo.jsp"%>
		<%@ include file="include/shared/kenshoo.jsp"%>
	<%-- End Tracking Scripts--%>

		<dec:head />

		<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />

	</head>

	<body class="<%=langBodyClass%> <% if(request.getAttribute("controller").toString()=="Motor"){ %>motor-Body<% } %>">
<%
	if (com.ifwd.fwdhk.controller.UserRestURIConstants.isContentEditable()) {
%>
<small>Enable Browse?<input type=checkbox id=cmsIsDefault></small>
<div id=editPanel style="z-index:99; display:none; background-color:yellow; padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 10px">
<textarea id=cmsContent cols=50 rows=5></textarea><br>
<button id=cmsUpdate>Update</button><button id=cmsCancel>Cancel</button><button id=cmsExport>Export</button><br>
<textarea id=cmsExportContent cols=50 rows=3 style="display: none"></textarea><br>
</div>
<script language="javascript">

var control;
var tagsKey = [];
var tagsValue = [];

$(document).ready(function(){
  var j = 0;
  $( "tag" ).each(function( i ) {
      tagsKey[j] = $( this ).attr("key");
      tagsValue[j] = $( this ).html();
      j++;
  })
  alert('Content Loaded');
});

$( "#cmsCancel" ).click(function() {
	  $( "#cmsExportContent" ).hide();
	  $( '#editPanel' ).hide();  
});


$( "#cmsUpdate" ).click(function() {
  control.html($( "#cmsContent" ).val());
  var i;
  for (i=0; i<tagsKey.length; i++) {
      if (tagsKey[i]==control.attr("key")) {
          tagsValue[i] = $( "#cmsContent" ).val();
      }
  }
  $( "#cmsExportContent" ).hide();
  $( '#editPanel' ).hide();  
});

$( "#cmsExport" ).click(function() {
  var content;
  $( "#cmsExportContent" ).show();
  $( "#cmsExportContent" ).html("");
  var i;
  for (i=0; i<tagsKey.length; i++) {
      content = $( "#cmsExportContent" ).html(); 
      if (content.length > 0) {
          content += "\n";
      }
      $( "#cmsExportContent" ).html(content + tagsKey[i] + "=" + tagsValue[i]);
  }
});

$( "body" ).click(function( event ) {
	if (event.target.id != 'cmsContent' && event.target.id != 'cmsExport' && event.target.id != 'cmsIsDefault' && event.target.id != 'cmsUpdate' && event.target.id != 'cmsExportContent') {
		if (!$( '#cmsIsDefault' ).is(':checked')) {
		    event.preventDefault();    
		}
	    control = $( event.target );
		for (i=0; i<tagsKey.length; i++) {
		    if (tagsKey[i]==control.attr("key")) {
		 		$( '#editPanel' ).show();
			$( '#editPanel' ).css('left', event.pageX);      // <<< use pageX and pageY
			$( '#editPanel' ).css('top', event.pageY);
			$( '#editPanel' ).css('display', 'inline');     
			$( '#editPanel' ).css("position", "absolute");  // <<< also make it absolute!
			$( "#cmsContent" ).val( event.target.innerHTML );
		    }
		}
	}
});

</script>
<%
	}
%>
	<%-- GTM Scripts--%>
		<%@ include file="include/shared/google_tag_manager.jsp"%>
	<%-- End GTM Scripts--%>

	<%-- Body Scripts--%>
		<%@ include file="include/merged/header_v2.jsp"%>

		<div class="closeMobileMenu commonBody"><dec:body /></div>

		<%@ include file="include/merged/footer_v2.jsp"%>
	<%-- End Body Scripts--%>

	<%-- Core Footer Scripts--%>
		<%@ include file="include/shared/core_footer_js.jsp"%>
	<%-- End Core Footer Scripts--%>

	<%-- Module Scripts--%>
		<%if (isAuthenticated && username!=null) {%>
			<%@ include file="/WEB-INF/jsp/merged/session.jsp"%>
		<% } %>

		<%@ include file="include/shared/timeout.jsp"%>

		<%@ include file="/WEB-INF/jsp/merged/comp/notification.jsp"%>
	<%-- End Module Scripts--%>

	<%-- Third Party Scripts--%>
		<%@ include file="include/shared/facebook_share.jsp"%>
		<%@ include file="include/shared/livechat.jsp"%>
	<%-- End Third Party Scripts--%>

	</body>
</html>
