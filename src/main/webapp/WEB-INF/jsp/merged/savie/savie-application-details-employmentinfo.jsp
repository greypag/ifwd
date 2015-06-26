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
    <h2>Employment info</h2>
	<div style="margin:20px 0;"></div>
	<div>
		<div style="padding:10px 60px 20px 60px">
	    <form method="post" action="${pageContext.request.contextPath}/${language}/getSavieBeneficiaryinfo">
	    	<table>
	    		<tr>
	    			<td>Employment status:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    			<td>Nature of business:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    		</tr>
	    		<tr>
	    			<td>Occupation:</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
	    			<td>Monthly personal income(HKD):</td>
	    			<td><select name="language">
	    			        <option value="ar">Arabic</option>
	    			        <option value="bg">Bulgarian</option>
	    			        <option value="ca">Catalan</option>
	    			        <option value="zh-cht">Chinese Traditional</option>
	    			        <option value="cs">Czech</option>
	    			    </select></td>
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