
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec"%>

<!DOCTYPE HTML>
<html>

<head>
	<script type="text/javascript"> 
		window.status = "Loading: Document body...";
	</script>

	<!-- Title -->
	<title><dec:title default="FWDHKPH1A" /></title>

	<%--   <%@ include file="setup.jsp"%> --%>

	<dec:head />
</head>
<body>

	
	<%@ include file="include/header.jsp"%>
	<section>
				
		<section class="main-content">
			<dec:body />
			<%@ include file="include/footer.jsp"%>
		</section>
		<section class="loading-modal"></section>
		<section class="notification-sec">
			<div class="alert-cont col-sm-8 col-sm-offset-2">
				<label class="alert col-sm-11"></label>
				<a href="javascript:void(0)" class="col-sm-1 icon icon-close" title="close">  </a>
			</div>
		</section>
	</section>

	<!-- Scripts -->
	<section>
		<script type="text/javascript" src="<%=request.getContextPath()%>/include/js/bootstrap.js"></script>
		<script type="text/javascript">
			window.status = "Done";
		</script>
	</section>

</body>
</html>
