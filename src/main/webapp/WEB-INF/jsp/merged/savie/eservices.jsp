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
		<div class="fwd-savie-wrapper" id="eservices-page">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			<div class="fwd-container container-fluid breadcrumbs purchase-history-bc">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
						<li><a href="#">Home</a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc">FWD Member Account</li>
	               </ol>
	            </div>
	         </div>
			<div class="container-fluid fwd-full-container" id="savie-online-purchase-history">
				<div class="fwd-container-limit clearfix sidebar">
					<div class="row" id="purchase-history-page">
						<h2>FWD member account</h2>
						<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	                            <span class="button-text">Profile</span>
	                            <i class="fa fa-angle-down"></i>
	                        </button>
	                        <ul class="dropdown-menu" role="menu">
	                            <li class="active"><a href="#personal-info-tab" data-toggle="tab" aria-expanded="true">Profile</a></li>
	                            <li><a href="#purchase-history-tab" data-toggle="tab" aria-expanded="true">Insurance plan</a></li>
	                            <li class=""><a href="#referral-tab" data-toggle="tab" aria-expanded="true">Promo &amp; offers</a></li>
	                        </ul>
	                    </div>
						<div class="col-md-3 side-menu hidden-xs hidden-sm">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="profile"></span>Profile</a></li>
								<li><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="insurance-plan"></span>Insurance plan</a></li>
								<li><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="promo-offers"></span>Promo &amp; offers</a></li>
							</ul>
						</div>
						<div class="col-xs-12 col-md-9 right-side-content">
							<h3 class="heading-title">Member details</h4>
							<div id="member-details">	
								<div class="row member-data-holder">
									<div class="col-xs-6 col-md-4 member-data-label">
										Full name
									</div>
									<div class="col-xs-6 col-md-4 member-data-info">
										CHAN TAI MAN
									</div>
								</div>
								<div class="row member-data-holder">
									<div class="col-xs-6 col-md-4 member-data-label">
										Mobile no.
									</div>
									<div class="col-xs-6 col-md-4 member-data-info">
										52295139
									</div>
								</div>
								<div class="row member-data-holder">
									<div class="col-xs-6 col-md-4 member-data-label">
										Email address
									</div>
									<div class="col-xs-6 col-md-4 member-data-info">
										ALEX.PANG@FWD.COM
									</div>
								</div>
								<div class="row member-data-holder">
									<div class="col-xs-6 col-md-4 member-data-label">
										Username
									</div>
									<div class="col-xs-6 col-md-4 member-data-info">
										ALEX PANG
									</div>
								</div>
							</div>
							<h3 class="heading-title">Financial needs analysis</h4>	
							<p id="complete-statement">You have completed FNA on 08-11-2015. <a href="#">Review FNA</a></p>	
						</div>
					</div>
				</div>
			</div>	
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";

			$(document).ready(function () {
				$(".dropdown-menu li a").click(function(){
				  var selText = $(this).text();
				  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
				  $('.dropdown-menu li').removeClass('active');
				  $(this).parent().addClass('active');
				});
			});
		</script>
		
	</body>
</html>