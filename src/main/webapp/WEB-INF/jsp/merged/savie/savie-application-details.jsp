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
<form id="" method="post" action="${pageContext.request.contextPath}/${language}/savie-application-">
	    <h2>Personal info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Name in English:</td>
		    			<td><input type="text" name="firstName" id="firstName"></input></td>
		    			<td>Email address:</td>
		    			<td><input type="text" name="emailAddress" id="emailAddress"></input></td>
		    		</tr>
		    		<tr>
		    			<td></td>
		    			<td><input type="text" name="lastName" id="lastName"></input></td>
		    			<td>Residential tel no:</td>
		    			<td><input type="text" name="residentialTelNo" id="residentialTelNo"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    			<td><input type="text" name="chineseName" id="chineseName"></input></td>
		    			<td>Mobile no:</td>
		    			<td><input type="text" name="mobileNo" id="mobileNo"></input></td>
		    		</tr>
		    		<tr>
		    			<td>HKID:</td>
		    			<td><input type="text" name="hkId" id="hkId"></input></td>
		    			<td>Residential address:</td>
		    			<td><input type="text" name="residentialAdress1" id="residentialAdress1"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td>
		    			<td><input type="radio" name="gender" id="gender1" value="M"></input>Male
		    			    <input type="radio" name="gender" id="gender2" value="F"></input>Female
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="residentialAdress2" id="residentialAdress2"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Marital status:</td>
		    			<td>
		    			    <select name="maritalStatus" id="maritalStatus">
		    			        <option value="">-Please select-</option>
		    			        <option value="Married">Married</option>
		    			        <option value="Unmarried">Unmarried</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="residentialAdress3" id="residentialAdress3"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Date of birth:</td>
		    			<td>
		    			    <div class="input-group date" id="birthdayDiv">
								<span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
								<input name="birthday" type="text" class="datepicker form-control border-radius" id="birthday" readonly>
							</div>
							<span id="birthdayMsg" class="text-red"></span>
		    			</td>
		    			<td></td>
		    			<td>
		    			    <select name="residentialDistrict" id="residentialDistrict">
		    			        <option value="">district</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Place of birth:</td>
		    			<td>
		    			    <select name="placeOfBirth" id="placeOfBirth">
		    			        <option value="">-Please select-</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td>*No P.O Box address allowed</td>
		    		</tr>
		    		<tr>
		    			<td>Nationality:</td>
		    			<td>
		    			    <select name="nationality" id="nationality">
		    			        <option value="">-Please select-</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td><input type="checkbox" name="addressIsSame" id="addressIsSame" value="Y"/>My conrrespondance address is same as my residential address</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT"/>
		    			</td>
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
		    			<td>
		    			    <select name="employmentStatus" id="employmentStatus">
		    			        <option value="">-Please select-</option>
		    			        <option value="Employed">Employed</option>
		    			        <option value="Unemployed">Unemployed</option>
		    			    </select>
		    			</td>
		    			<td>Nature of business:</td>
		    			<td>
		    			    <select name="natureOfBusiness" id="natureOfBusiness">
		    			        <option value="">-Please select-</option>
		    			        <option value="Entertainment">Entertainment</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Occupation:</td>
		    			<td>
		    			    <select name="occupation" id="occupation">
		    			        <option value="">-Please select-</option>
		    			        <option value="Artist">Artist</option>
		    			    </select>
		    			</td>
		    			<td>Monthly personal income(HKD):</td>
		    			<td>
		    			    <select name="monthlyPersonalIncome" id="monthlyPersonalIncome">
		    			        <option value="">-Please select-</option>
		    			        <option value="55001">HK$55001 and above</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT"/>
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
		    			<td><input type="radio" name="ownEstate" value="true" id="ownEstate1"/>Own estate<input type="radio" name="ownEstate" value="false" id="ownEstate2"/>Name others</td>
		    		</tr>
		    		<tr>
		    			<td>Name in English</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="firstName" id="firstName"></input></td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="lastName" id="lastName"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="chineseName" id="chineseName"></input></td>
		    		</tr>
		    		<tr>
		    			<td>HKID/Passport No:</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="hkId" id="hkId"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td>
		    		</tr>
		    		<tr>
		    			<td><input type="radio" name="gender" id="gender1" value="M" />Male<input type="radio" name="gender" id="gender2" value="F"/>Female</td>
		    		</tr>
		    		<tr>
		    			<td>Entitlement(%):</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="entitlement" id="entitlement"></input></td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT"/>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
</form>
</div>
<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
</body>
</html>