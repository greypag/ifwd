<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="teaser-confirmation-block">
	<div class="fwd-container container-fluid teaser-confirmation">
		<h2>Thank you for completing the survey.</h2>

		<h4>Share the love! Let your friends and family know about <span class="savie-bold">SAVIE</span> and start saving together!</h4>


		<div class="clearfix">
			<div class="left-desktop">
				<img src="<%=request.getContextPath()%>/resources/images/savie/teaser-confirmation-image.png">
			</div>
			<div class="left-desktop text">
				<h3>Guaranteed 3% return each year for the first 3 policy years</h3>
				<p class="act-now">Act now to grab the chance to earn 4% return
					in the 3rd year! Limited Quota Offer!!</p>
				<div class="fwd-div-btn">
					<button type="button" class="btn-fwd-fb">
						<i class="fa fa-facebook fwd-fb"></i>Share on Facebook
					</button>
				</div>

			</div>
		</div>

		<button type="button" class="btn-white btn-confirmation">Back to home</button>
	</div>
</div>