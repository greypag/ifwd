<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
</head>
<body>
<div align="center">
    <h2>Personal info</h2>
	<div style="margin:20px 0;"></div>
	<div>
		<div style="padding:10px 60px 20px 60px">
	    <form method="post" action="${pageContext.request.contextPath}/${language}/getSavieEmploymentinfo">
	    	<table>
	    		<tr>
	    			<td>Name in English:</td>
	    			<td><input type="text" name="givenName"></input></td>
	    			<td>Email address:</td>
	    			<td><input type="text" name="emailAddress"></input></td>
	    		</tr>
	    		<tr>
	    			<td></td>
	    			<td><input type="text" name="lastName"></input></td>
	    			<td>Residential tel no:</td>
	    			<td><input type="text" name="telNo"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Name in Chinese:</td>
	    			<td><input type="text" name="chineseName"></input></td>
	    			<td>Mobile no:</td>
	    			<td><input type="text" name="mobileNo"></input></td>
	    		</tr>
	    		<tr>
	    			<td>HKID:</td>
	    			<td><input type="text" name="hkid"></input></td>
	    			<td>Residential address:</td>
	    			<td><input type="text" name="residentialAddress1"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Gender:</td>
	    			<td><input type="radio" name="gender" value="M"></input>Male
	    			    <input type="radio" name="gender" value="F"></input>Female
	    			</td>
	    			<td></td>
	    			<td><input type="text" name="residentialAddress2"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Marital status:</td>
	    			<td>
	    			    <select name="maritalStatus">
	    			        <option value="">-Please select-</option>
	    			        <option value="Married">Married</option>
	    			        <option value="Unmarried">Unmarried</option>
	    			    </select>
	    			</td>
	    			<td></td>
	    			<td><input type="text" name="residentialAddress3"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Date of birth:</td>
	    			<td><input type="text" name="dateOfBirth"></input></td>
	    			<td></td>
	    			<td>
	    			    <select name="district">
	    			        <option value="">district</option>
	    			        <option value="hk">hk</option>
	    			    </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>Place of birth:</td>
	    			<td>
	    			    <select name="placeOfBirth">
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
	    			    <select name="nationality">
	    			        <option value="">-Please select-</option>
	    			        <option value="hk">hk</option>
	    			    </select>
	    			</td>
	    			<td></td>
	    			<td><input type="checkbox" name="addressIsSame" value="Y"/>My conrrespondance address is same as my residential address</td>
	    		</tr>
	    		<tr align="center">
	    			<td colspan="4">
	    			   <input type="submit" value="NEXT"/>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    </div>
	</div>
</div>
</body>
</html>