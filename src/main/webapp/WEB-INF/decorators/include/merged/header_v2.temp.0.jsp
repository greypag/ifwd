<%
	session = request.getSession();
	String uatAuth = (String) session.getAttribute("uatAuth");
	// 	if (uatAuth == null)
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");
	// 	if (!uatAuth.equals("userName"))
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");

	UserDetails user = new UserDetails();
	if (session.getAttribute("userDetails") != null) {
		user = (UserDetails) session.getAttribute("userDetails");
	}
%>
