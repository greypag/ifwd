<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
</head>
<body>
<div align="center">
<form method="post" action="${pageContext.request.contextPath}/${language}/saving-insurance/${nextPageFlow}">
<h2>Personal info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Name in English:</td>
		    			<td>${savieDetail.savieApplicantBean.firstName }</td>
		    			<td>Email address:</td>
		    			<td>${savieDetail.savieApplicantBean.email }</td>
		    		</tr>
		    		<tr>
		    			<td></td>
		    			<td>${savieDetail.savieApplicantBean.lastName }</td>
		    			<td>Residential tel no:</td>
		    			<td>${savieDetail.savieApplicantBean.residentialTelNo }</td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    			<td>${savieDetail.savieApplicantBean.chineseName }</td>
		    			<td>Mobile no:</td>
		    			<td>${savieDetail.savieApplicantBean.mobileNo }</td>
		    		</tr>
		    		<tr>
		    			<td>HKID:</td>
		    			<td>${savieDetail.savieApplicantBean.hkId }</td>
		    			<td>Residential address:</td>
		    			<td>${savieDetail.savieApplicantBean.residentialAdress1 }</td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td>
		    			<td>${savieDetail.savieApplicantBean.gender }
		    			</td>
		    			<td></td>
		    			<td>${savieDetail.savieApplicantBean.residentialAdress2 }</td>
		    		</tr>
		    		<tr>
		    			<td>Marital status:</td>
		    			<td>${savieDetail.savieApplicantBean.maritalStatus }
		    			</td>
		    			<td></td>
		    			<td>${savieDetail.savieApplicantBean.residentialAdress3 }</td>
		    		</tr>
		    		<tr>
		    			<td>Date of birth:</td>
		    			<td>${savieDetail.savieApplicantBean.birthday }</td>
		    			<td></td>
		    			<td>${savieDetail.savieApplicantBean.residentialDistrict }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Place of birth:</td>
		    			<td>${savieDetail.savieApplicantBean.placeOfBirth }
		    			</td>
		    			<td></td>
		    			<td>*No P.O Box address allowed</td>
		    		</tr>
		    		<tr>
		    			<td>Nationality:</td>
		    			<td>${savieDetail.savieApplicantBean.nationality }
		    			</td>
		    			<td></td>
		    			<td>${savieDetail.savieApplicantBean.addressIsSame }</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
	    <h2>Employment info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Employment status:</td>
		    			<td>${savieDetail.savieEmploymentBean.employmentStatus }
		    			</td>
		    			<td>Nature of business:</td>
		    			<td>${savieDetail.savieEmploymentBean.natureOfBusiness }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Occupation:</td>
		    			<td>${savieDetail.savieEmploymentBean.occupation }
		    			</td>
		    			<td>Monthly personal income(HKD):</td>
		    			<td>${savieDetail.savieEmploymentBean.monthlyPersonalIncome }
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
	    <h2>Beneficiary info</h2>
	    <p>You may add up to three(3) persons</p>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].ownEstate }</td>
		    		</tr>
		    		<tr>
		    			<td>Name in English</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].firstName }</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].lastName }</td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].chineseName }</td>
		    		</tr>
		    		<tr>
		    			<td>HKID/Passport No:</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].hkId }</td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].gender }</td>
		    		</tr>
		    		<tr>
		    			<td>Entitlement(%):</td>
		    		</tr>
		    		<tr>
		    			<td>${savieDetail.savieBeneficiaryBeans[0].entitlement }</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
		<h2>Payment</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td colspan="4">${savieDetail.saviePaymentBean.paymentType }</td>
		    		</tr>
		    		<tr>
		    			<td>Amount</td>
		    			<td>${savieDetail.saviePaymentBean.amount }</td>
		    			<td>Account no</td>
		    			<td>${savieDetail.saviePaymentBean.amount }</td>
		    		</tr>
		    		<tr>
		    			<td>Payment method</td>
		    			<td>${savieDetail.saviePaymentBean.paymentMethod }</td>
		    			<td>Bank account holder name</td>
		    			<td>${savieDetail.saviePaymentBean.bankAccountHolderName }</td>
		    		</tr>
		    		<tr>
		    			<td>Bank name(Code)</td>
		    			<td>${savieDetail.saviePaymentBean.bankName }
		    			</td>
		    			<td>Branch name</td>
		    			<td>${savieDetail.saviePaymentBean.branchName }
		    			</td>
		    		</tr>
		    		<tr>
		    			<td  colspan="4">${savieDetail.saviePaymentBean.paymentConfirmAuthorize }</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="submit" value="NEXT"/>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
</form>
</div>
</body>
</html>