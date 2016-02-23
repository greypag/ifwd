<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>

			<button type="button" class="btn btn-primary" id="error-box-demo">Click to show demo</button>
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>			
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			PNotify.prototype.options.styling = "bootstrap3";
			function show_stack_bar_top(type) {
			var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
			    var opts = {
			        title: "Over Here",
			        text: "Check me out. I'm in a different stack.",
			        addclass: "stack-bar-top error-box",
			        cornerclass: "",
			        width: "100%",
			        stack: stack_bar_top
			    };
			    switch (type) {
			    case 'error':
			        opts.title = "Oh No";
			        opts.text = "Watch out for that water tower!";
			        opts.type = "error";
			        break;
			    case 'info':
			        opts.title = "Breaking News";
			        opts.text = "Have you met Ted?";
			        opts.type = "info";
			        break;
			    case 'success':
			        opts.title = "Sorry, failed to connect to server.";
			        opts.text = "Sorry, our service is currently unavailable and we are fixing the issue. Please try again later. We apologize for the inconvenience caused.";
			        opts.type = "success";
			        break;
			    }
			    new PNotify(opts);
			}
			$(document).ready(function () {
				$('#error-box-demo').on('click', function () {
					show_stack_bar_top('success');
				});
			});
		</script>
	</body>
</html>