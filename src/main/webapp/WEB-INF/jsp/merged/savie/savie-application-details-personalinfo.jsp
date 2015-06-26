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
	    			<td><input type="text" name="name"></input></td>
	    			<td>Email address:</td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td></td>
	    			<td><input type="text" name="name"></input></td>
	    			<td>Residential tel no:</td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Name in Chinese:</td>
	    			<td><input type="text" name="name"></input></td>
	    			<td>Mobile no:</td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>HKID:</td>
	    			<td><input type="text" name="name"></input></td>
	    			<td>Residential address:</td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Gender:</td>
	    			<td><input type="radio" name="name"></input>Male
	    			    <input type="radio" name="name"></input>Female
	    			</td>
	    			<td></td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Marital status:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select>
	    			</td>
	    			<td></td>
	    			<td><input type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Date of birth:</td>
	    			<td><input type="text" name="name"></input></td>
	    			<td></td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    		</tr>
	    		<tr>
	    			<td>Place of birth:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td>Nationality:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    			<td></td>
	    			<td><input type="checkbox" name="name"/>My conrrespondance address is same as my residential address</td>
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