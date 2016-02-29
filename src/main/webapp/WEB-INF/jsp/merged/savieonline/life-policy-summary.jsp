<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div align="center">
<table>
<tr>
<td>Personal info</td>
<td><a class="buy-now et-quote btn-color-ylw" href="<%=request.getContextPath()%>/${language}/savings-insurance/life-personal-details?backSummary=Y" >Edit</a></td>
</tr>
<tr>
<td>firstname:${lifePersonalDetails.firstname }</td>
<td>lastname:${lifePersonalDetails.lastname }</td>
</tr>
<tr>
<td>chineseName:${lifePersonalDetails.chineseName }</td>
<td>dob:${lifePersonalDetails.dob }</td>
</tr>
<tr>
<td>gender:${lifePersonalDetails.gender }</td>
<td>hkid:${lifePersonalDetails.hkid }</td>
</tr>
<tr>
<td>martialStatus:${lifePersonalDetails.martialStatus }</td>
<td>mobileNumber:${lifePersonalDetails.mobileNumber }</td>
</tr>
<tr>
<td>emailAddress:${lifePersonalDetails.emailAddress }</td>
<td>placeOfBirth:${lifePersonalDetails.placeOfBirth }</td>
</tr>
<tr>
<td>nationalty:${lifePersonalDetails.nationalty }</td>
<td>permanetAddress1:${lifePersonalDetails.permanetAddress1 }</td>
</tr>
<tr>
<td>permanetAddress2:${lifePersonalDetails.permanetAddress2 }</td>
<td>permanetAddress3:${lifePersonalDetails.permanetAddress3 }</td>
</tr>
<tr>
<td>permanetAddressDistrict:${lifePersonalDetails.permanetAddressDistrict }</td>
<td>residentialAddress1:${lifePersonalDetails.residentialAddress1 }</td>
</tr>
<tr>
<td>residentialAddress2:${lifePersonalDetails.residentialAddress2 }</td>
<td>residentialAddress3:${lifePersonalDetails.residentialAddress3 }</td>
</tr>
<tr>
<td>residentialAddressDistrict:${lifePersonalDetails.residentialAddressDistrict }</td>
<td>correspondenceAddress1:${lifePersonalDetails.correspondenceAddress1 }</td>
</tr>
<tr>
<td>correspondenceAddress2:${lifePersonalDetails.correspondenceAddress2 }</td>
<td>correspondenceAddress3:${lifePersonalDetails.correspondenceAddress3 }</td>
</tr>
<tr>
<td>correspondenceAddressDistrict:${lifePersonalDetails.correspondenceAddressDistrict }</td>
<td></td>
</tr>
<tr>
<td>Employment info</td>
<td><a class="buy-now et-quote btn-color-ylw" href="<%=request.getContextPath()%>/${language}/savings-insurance/life-employment-info?backSummary=Y" >Edit</a></td>
</tr>
<tr>
<td>employmentStatus:${lifeEmploymentInfo.employmentStatus }</td>
<td>natureOfBusiness:${lifeEmploymentInfo.natureOfBusiness }</td>
</tr>
<tr>
<td>occupation:${lifeEmploymentInfo.occupation }</td>
<td>employerName:${lifeEmploymentInfo.employerName }</td>
</tr>
<tr>
<td>monthlyPersonalIncome:${lifeEmploymentInfo.monthlyPersonalIncome }</td>
<td>education:${lifeEmploymentInfo.education }</td>
</tr>
<tr>
<td>amountOfOtherSourceOfIncome:${lifeEmploymentInfo.amountOfOtherSourceOfIncome }</td>
<td>amountOfLiquidAssets:${lifeEmploymentInfo.amountOfLiquidAssets }</td>
</tr>
<tr>
<td>Beneficary info</td>
<td><a class="buy-now et-quote btn-color-ylw" href="<%=request.getContextPath()%>/${language}/savings-insurance/life-beneficary-info?backSummary=Y" >Edit</a></td>
</tr>
<tr>
<td>beneficaryFirstName1:${lifeBeneficaryInfo.beneficaryFirstName1 }</td>
<td>beneficaryLastName1:${lifeBeneficaryInfo.beneficaryLastName1 }</td>
</tr>
<tr>
<td>beneficaryChineseName1:${lifeBeneficaryInfo.beneficaryChineseName1 }</td>
<td>beneficaryID1:${lifeBeneficaryInfo.beneficaryID1 }</td>
</tr>
<tr>
<td>beneficaryGender1:${lifeBeneficaryInfo.beneficaryGender1 }</td>
<td>beneficaryRelation1:${lifeBeneficaryInfo.beneficaryRelation1 }</td>
</tr>
<tr>
<td>beneficaryWeight1:${lifeBeneficaryInfo.beneficaryWeight1 }</td>
<td>beneficaryFirstName2:${lifeBeneficaryInfo.beneficaryFirstName2 }</td>
</tr>
<tr>
<td>beneficaryLastName2:${lifeBeneficaryInfo.beneficaryLastName2 }</td>
<td>beneficaryChineseName2:${lifeBeneficaryInfo.beneficaryChineseName2 }</td>
</tr>
<tr>
<td>beneficaryID2:${lifeBeneficaryInfo.beneficaryID2 }</td>
<td>beneficaryGender2:${lifeBeneficaryInfo.beneficaryGender2 }</td>
</tr>
<tr>
<td>beneficaryRelation2:${lifeBeneficaryInfo.beneficaryRelation2 }</td>
<td>beneficaryWeight2:${lifeBeneficaryInfo.beneficaryWeight2 }</td>
</tr>
<tr>
<td>beneficaryFirstName3:${lifeBeneficaryInfo.beneficaryFirstName3 }</td>
<td>beneficaryLastName3:${lifeBeneficaryInfo.beneficaryLastName3 }</td>
</tr>
<tr>
<td>beneficaryChineseName3:${lifeBeneficaryInfo.beneficaryChineseName3 }</td>
<td>beneficaryID3:${lifeBeneficaryInfo.beneficaryID3 }</td>
</tr>
<tr>
<td>beneficaryGender3:${lifeBeneficaryInfo.beneficaryGender3 }</td>
<td>beneficaryRelation3:${lifeBeneficaryInfo.beneficaryRelation3 }</td>
</tr>
<tr>
<td>beneficaryWeight3:${lifeBeneficaryInfo.beneficaryWeight3 }</td>
<td></td>
</tr>
<tr>
<td>Payment info</td>
<td><a class="buy-now et-quote btn-color-ylw" href="<%=request.getContextPath()%>/${language}/savings-insurance/life-payment" >Edit</a></td>
</tr>
<tr>
<td>bankCode:${lifePayment.bankCode }</td>
<td>branchCode:${lifePayment.branchCode }</td>
</tr>
<tr>
<td>accountNumber:${lifePayment.accountNumber }</td>
<td>accountHolderName:${lifePayment.accountHolderName }</td>
</tr>
<tr>
<td>paymentAmount:${lifePayment.paymentAmount }</td>
<td></td>
</tr>
</table>
<a id="nextPage" class="buy-now et-quote btn-color-ylw" href="#" >next page</a>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
});
</script>