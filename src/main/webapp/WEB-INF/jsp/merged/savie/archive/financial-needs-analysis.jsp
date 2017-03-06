<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">



<link href="<%=request.getContextPath()%>/resources/css/savie/bootstrap.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>

<script type="text/javascript">
	function gotoCenter(){
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}";
	}
	
	function gotoAppForm(){
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}";
	}
</script>

</head>
<body>
	<div align="center">
		<div>
			<input type="radio"></input>I have read and I understand and accept this<a href="#" style="color: red;">
			Persion Information Collection Statement</a>
		</div>
		<table style="width: 80%;">
			<tr>
				<td style="margin-left: 20px;font-size: large; color: red;">Financial need analysis</td>
			</tr>
			<tr>
				<td>Before we continue, do you need to complete a financial needs analysis questionnare?</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="Yes" data-toggle="modal" data-target="#myModal" id="yes-button"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="No" data-toggle="modal" data-target="#noModal" id="no-button"/>
				</td>
			</tr>
		</table>
		
		<div align="center">
			<input type="submit" value="NEXT" style="color: red;" onclick="gotoAppForm();"/>
		</div>
		
		<div style="height: 30px;"></div>
		
		<%-- <table style="width: 80%;">
			<tr style="color: red;">
				<td colspan="2">
					Your selected plan <input type="button" value="Edit"/>
				</td>
			</tr>
			<tr>
				<td>
					Plan name
				</td>
				<td>
					SAVIE
				</td>
			</tr>
			<tr>
				<td>
					Single premium
				</td>
				<td>
					HK$ 100,000
				</td>
			</tr>
		</table>
		
		<div style="height: 30px;"></div>
		
		<table style="width: 80%;">
			<tr style="color: red;">
				<td colspan="2">
					Input for sales illustration <input type="button" value="Edit"/>
				</td>
			</tr>
			<tr>
				<td>
					Name in English(same as HKID)
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td>
					Given name
				</td>
				<td>
					Andy
				</td>
			</tr>
			<tr>
				<td>
					Last Name
				</td>
				<td>
					Lau
				</td>
			</tr>
			<tr>
				<td>
					Name in Chinese(same as HKID)
				</td>
				<td>
					刘德华
				</td>
			</tr>
			<tr>
				<td>
					Date of birth
				</td>
				<td>
					27-09-1961
				</td>
			</tr>
			<tr>
				<td>
					Gender
				</td>
				<td>
					Male
				</td>
			</tr>
			<tr>
				<td colspan="2">
					This above information will become your policy information
				</td>
			</tr>
		</table>
		
		<div style="height: 30px;"></div>
		
		<div align="center">
			<a href="<%=request.getContextPath()%>/${language}/savings-insurance/application" style="color: red;">Proceed to sales illustration</a>
			<input type="button" value="Proceed to sales illustration" style="color: red;"/>
		</div>
		
		<div style="height: 30px;"></div>
		
		<table style="width: 80%;">
			<tr>
				<td style="color: red;font: bold;" colspan="2">This product is for HK residents only</td>
			</tr>
			<tr>
				<td colspan="2">I have read the definition of a United States persion in <a href="#" style="color: red;">Declaration relating to Foreign Account 
				Tax Compliance Act</a> and</td>
			</tr>
			<tr>
				<td colspan="2">confirm that i am not a United States persion</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="Yes"/></td>
			</tr>
			<tr>
				<td><input type="button" value="No"/></td>
				<td>Please call customer hotline 3123-3123</td>
			</tr>
		</table>
		
		<div align="center">
			<input type="submit" value="NEXT" style="color: red;" onclick="gotoAppForm();"/>
		</div>
		
		<div style="height: 30px;"></div>
		
	</div> --%>
</div>	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               	Title
            </h4>
         </div>
         <div class="modal-body">
           	<table>
			<tr>
				<td>
					If you require a finacial needs analysis,please select any one
				</td>
			</tr>	
			<tr>	
				<td>
					of our customer service centres below for an appointment.
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="gotoCenter();">Yes,take me there</button>
				</td>
				
			</tr>
			<tr>
				<td align="center">
					<button type="button" class="btn btn-primary" data-dismiss="modal">No thanks</button>
				</td>
			</tr>
		</table>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>


<div class="modal fade" id="noModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               	Title
            </h4>
         </div>
         <div class="modal-body">
           	<table>
			<tr>
				<td>
					Tell us why you do not want to complete a
				</td>
			</tr>
			<tr>	
				<td>
					financial needs analysis.
				</td>
			</tr>
			<tr>
				<td>
					e.g.I do not want to do a financial needs analysis.
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="2" cols="15" style="width: 410px;">Tell us why</textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="button" class="btn btn-primary" data-dismiss="modal"  onclick="gotoAppForm();">Submit</button>
				</td>
				
			</tr>
		</table>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>	
	
	
	
</body>
</html>