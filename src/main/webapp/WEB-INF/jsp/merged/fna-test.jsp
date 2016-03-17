<script>
function clearFna() {
	$("#testResult").html('');
}

function testFna() {
	$.ajax({
		type : "POST",
		url : "<%=request.getContextPath()%>/ajax/savings-insurance/product-recommend",
		data : jQuery.parseJSON( $("#fna").val() ),
		async : false,
		success : function(data) {
			var plans = '';
			for (var i=0; i < data.product_list.length; i++) {
				for (var j=0; j < data.product_list[i].products.length; j++) {
					plans += "<tr><td>"+data.product_list[i].products[j].product_code + "</td><td>"+data.product_list[i].products[j].name + "</td></tr>"
				}
			}
			if (plans.length > 0) {
				plans = "<table>" + plans + "</table>";
			} else {
				plans = "No record."
			}
		
			$("#testResult").html(plans);
		}
	});
}
</script>
<form>
<table border=1 cellpadding="2">	
	<tr><td>
	<textarea id="fna" cols="80" rows="2"></textarea>
	</td><td>
	<button type="button" onclick="testFna()">Test Now</button>
	</td><td>
	<button type="button" onclick="clearFna()">Clear</button>
	</td></tr>
	<tr><td>
	<div id="testResult"></div>
	</td></tr>
</table>	
</form>
