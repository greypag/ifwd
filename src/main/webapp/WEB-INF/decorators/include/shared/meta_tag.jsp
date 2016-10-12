<!-- Title -->
<title>${pageTitle}</title>

<!-- <meta name="robots" content="NOODP"> -->

<meta name='description' content="${pageMetaDataDescription}" >
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-control" content="no-cache, no-store">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name='keywords' content="meta keywords here"/>

<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="icon" type="image/x-icon" href="<%=siteURL%>/resources/images/favicon.ico" />

<link rel="canonical" href="${canonical}"/>

<% 
	if((!requestUri.endsWith("-insurance") 
		&&!(requestUri.endsWith("/tc/home") || requestUri.endsWith("/tc/home/") 
			|| requestUri.endsWith("/tc") || requestUri.endsWith("/tc/"))
		&&!(requestUri.endsWith("/en/home") || requestUri.endsWith("/en/home/") 
			|| requestUri.endsWith("/en") || requestUri.endsWith("/en/"))
		&& !requestUri.endsWith("/offers") 
		&& !requestUri.endsWith("/faq")) && !(requestUri.endsWith("/provie"))) { 
%>
<meta name="robots" content="noindex">
<% }
   
	if(requestUri.endsWith("/tc/home") || requestUri.endsWith("/tc/home/") 
		   || requestUri.endsWith("/tc") || requestUri.endsWith("/tc/")) {
%>
<link rel="alternate" hreflang="en" href="https://i.fwd.com.hk/en" />
<% } else if(requestUri.endsWith("/en/home") || requestUri.endsWith("/en/home/") 
		   || requestUri.endsWith("/en") || requestUri.endsWith("/en/")) {
%>
<link rel="alternate" hreflang="zh-HK" href="https://i.fwd.com.hk/tc" />
<% 
    } else if (requestUri.indexOf("/en/") >= 0) { 
%>
<link rel="alternate" hreflang="zh-HK" href="<%= requestUri.replaceAll("/en/", "/tc/") %>" />
<% 
    } else if (requestUri.indexOf("/tc/") >= 0) { 
%>
<link rel="alternate" hreflang="en" href="<%= requestUri.replaceAll("/tc/", "/en/") %>" />
<%
    }
%>


<!-- Google Rich Snippets Start-->

<%-- <enhance:out escapeXml="false"> --%>
<!-- <div itemscope itemtype="http://schema.org/Product"> -->
<%--    <span itemprop="brand">${googleRickSnippetBrand}</span> --%>
<%--    <span itemprop="name">${googleRickSnippetName}</span> --%>
<%--    <img itemprop="image" src="${googleRickSnippetImageUrl}" alt="${googleRickSnippetImageAlt}" /> --%>
<%--    <div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">${googleRickSnippetRating}</div> --%>

<!--    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer"> -->
<%--        <span itemprop="price">${googleRickSnippetPrice}</span> --%>
<%--        <link itemprop="availability" href="${googleRickSnippetAvailability}" />${googleRickSnippetAvailabilityText} --%>
<!--    </div> -->

<%--    <u>${googleRickSnippetDescription1}</u> <span itemprop="description">${googleRickSnippetDescription2}</span> --%>
<!-- </div> -->
<%-- </enhance:out> --%>

<!-- Google Rich Snippets End-->

