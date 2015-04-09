<%@ tag description="Layout" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ attribute name="defaultLabel" type="java.lang.String" %>
<%@ attribute name="defaultValue" type="java.lang.String" %>
<%@ attribute name="onChange" type="java.lang.String" %>
<%@ attribute name="selectables" type="java.util.Map" %>
<%@ attribute name="valueElmId" type="java.lang.String" %>
<%@ attribute name="valueElmName" type="java.lang.String" %>
<%@ attribute name="defaultWithFirst" type="java.lang.Boolean" %>
<%@ attribute name="containerCss" type="java.lang.String" %>

<c:set var="defaultWithFirst" value="${(defaultWithFirst == null) ? false : defaultWithFirst}" />
<c:if test="${defaultWithFirst}">
	<c:set var="firstEntry" value="${selectables.entrySet().iterator().next()}" />
	<c:set var="defaultLabel" value="${firstEntry.value}" />
	<c:set var="defaultValue" value="${firstEntry.key}" />
</c:if>
<c:set var="dropDownElm" value="select-${valueElmId}" />
<div class="dropdown drop-down simulate-drop-down ${containerCss}">

	<a href="#" id="${dropDownElm}"
		class="dropdown-toggle col-lg-12 col-md-12"
		data-toggle="dropdown"> 
		<label class="select-label">${defaultLabel}</label> <i class="fa fa-caret-down pull-right"></i>
	</a>
	
	<ul class="dropdown-menu" role="menu" aria-labelledby="${dropDownElm}">
		<c:if test="${not defaultWithFirst}">
			<li role="presentation">
				<a role="menuitem" tabindex="-1" href="javascript:void(0);" onClick="setDropDownValue(this,'${defaultValue}');${onChange}">${defaultLabel}</a>
			</li>
		</c:if>
		<c:forEach var="selectable" items="${selectables}">
			<li role="presentation">
			<a role="menuitem" tabindex="-1" href="javascript:void(0);" onClick="setDropDownValue(this,'${selectable.key}');${onChange}"><c:out value="${selectable.value}" /></a>
			</li>
		</c:forEach>
	</ul>
	<input type="hidden" id="${valueElmId}" name="${valueElmName}" role="value" value="${defaultValue}"/>
</div>