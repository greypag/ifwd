<div class="row reset-margin">
	<div class="col-xs-12 profile">
		<img src="assets/images/avatar.png" class="avatar">
		<p class="name">Taiman Chan</p>
		<!-- <p class="age"></p> -->
	</div>
	<div class="col-xs-6 col-md-12 menu setting">
		<%if(eServicesPage == "default"){%>
		<a href="eServices-personal-info" class="link-menu active" id="profile-setting">
		<%}else{%>
		<a href="eServices-personal-info" class="link-menu" id="profile-setting">
		<%}%>
			<span class="icon-sidebar-menu">
				<span class="eServices-icons profile-setting" id="profile-setting-span"></span>
			</span>
			<span class="text">Profile setting</span>
		</a>
	</div>
	<div class="col-xs-6 col-md-12 menu purchase">
		<%if(eServicesPage == "purchase"){%>
		<a href="eServices-purchase-history" class="link-menu active" id="purchase-history">
		<%}else{%>
		<a href="eServices-purchase-history" class="link-menu" id="purchase-history">
		<%}%>		
			<span class="icon-sidebar-menu">
				<span class="eServices-icons purchase-history-icon " id="purchase-history-span"></span>
			</span>
			<span class="text">Purchase history</span>
		</a>
	</div>
	<div class="col-xs-6 col-md-12 menu referrals">
		<%if(eServicesPage == "referral"){%>
		<a href="eServices-referral" class="link-menu active" id="referrals-and-promo">
		<%}else{%>
		<a href="eServices-referral" class="link-menu" id="referrals-and-promo">
		<%}%>
			<span class="icon-sidebar-menu">
				<span class="eServices-icons menu-referrals-icon " id="referrals-and-promo-span"></span>
			</span>
			<span class="text">Referrals & promo</span>
		</a>
	</div>
	<div class="col-xs-6 col-md-12 menu logout">
		<a href="logout" class="link-menu " id="logout">
			<span class="icon-sidebar-menu">
				<span class="eServices-icons menu-logout-icon " id="logout-span"></span>
			</span>
			<span class="text">Logout</span>
		</a>
	</div>
	
</div>