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
    <h2>Beneficiary info</h2>
    <p>You may add up to three(3) persons</p>
	<div style="margin:20px 0;"></div>
	<div>
		<div style="padding:10px 60px 20px 60px">
	    <form method="post" action="${pageContext.request.contextPath}/${language}/getSaviePersonalinfo">
	    	<table>
	    		<tr>
	    			<td><input type="radio"/>Own estate<input type="radio"/>Name others</td>
	    		</tr>
	    		<tr>
	    			<td>Name in English</td>
	    		</tr>
	    		<tr>
	    			<td><input type="text" name="beneGivenName"></input></td>
	    		</tr>
	    		<tr>
	    			<td><input type="text" name="beneLastName"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Name in Chinese:</td>
	    		</tr>
	    		<tr>
	    			<td><input type="text" name="beneChineseName"></input></td>
	    		</tr>
	    		<tr>
	    			<td>HKID/Passport No:</td>
	    		</tr>
	    		<tr>
	    			<td><input type="text" name="hkidOrPassportNo"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Gender:</td>
	    		</tr>
	    		<tr>
	    			<td><input type="radio" name="beneGender" value="M" />Male<input type="radio" name="beneGender" value="F"/>Female</td>
	    		</tr>
	    		<tr>
	    			<td>Entitlement(%):</td>
	    		</tr>
	    		<tr>
	    			<td><input type="text" name="beneEntitlement"></input></td>
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