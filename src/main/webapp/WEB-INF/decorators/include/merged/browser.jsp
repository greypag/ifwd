<%@ page import="java.util.*"%>
<%
	String agent = request.getHeader("user-agent");

	System.out.println("agent : " + agent);

	String[] strs = agent.split(";");
	StringTokenizer st = new StringTokenizer(agent,";");  
	/* st.nextToken();  
	//得到用户的浏览器名  
	String userbrowser = st.nextToken();  
	System.out.println("userbrowser : " + userbrowser);
	
	//得到用户的操作系统名  
	String useros = st.nextToken(); 
	System.out.println("useros : " + useros); */
	
	
	String ip = request.getHeader("x-forwarded-for");
	if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	ip = request.getHeader("Proxy-Client-IP");
	}
	if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	ip = request.getRemoteAddr();
	} 

	System.out.println("ip : " + ip);
	
	
	/* String ip = request.getRemoteAddr();//获得客户端的ip地址 
	int port = request.getServerPort();
	
	
	System.out.println("port : " + port); */
	/* System.out.println("strs : " + strs[0]+" "+strs[1]+" "+strs[2]); */
	String serverName = request.getServerName();
	System.out.println("serverName : " + serverName);
	
	String referer = request.getHeader("referer");
	System.out.println("referer : " + referer);
	
	String requestUrl = request.getRequestURI();
	System.out.println("requestUrl : " + requestUrl);
	
	
	System.out.println("operation system name : " + System.getProperty("os.name"));
	System.out.println("operation system version : " + System.getProperty("os.version"));
	System.out.println("operation system arch : " + System.getProperty("os.arch"));

	
%>
