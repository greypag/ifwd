<script>
	$(function(){
		// Set fb Share meta
		var defaultOg = {
			'en': {
				'title': 'FWD | Hong Kong',
				'desc': 'Get a full range of travel, free flight and home insurance with FWD \✓24\/7 support \✓ \'A\' rated secure & stable financial strength \✓ Rewards & benefits',
				'url': 'https://i.fwd.com.hk/en',
				'img': 'https://i.fwd.com.hk/resources/images/slider/main_en.jpg'
			},
			'tc': {
				'title': '獲取適合您的保障 | 富衛香港',
				'desc': '富衛保險是一間以香港為中心的保險公司，提供各種旅遊、家居及工作假期保險計劃。我們全天候24小時支援你的需要，並獲得國際評級機構授予多項卓越的財務實力評級，為您提供眾多優惠。',
				'url': 'https://i.fwd.com.hk/tc',
				'img': 'https://i.fwd.com.hk/resources/images/slider/main_cn.jpg'
			}
		}

		var ogTitle= $('meta[property="og:title"]').attr("content") || '';
		var ogDesc=$('meta[property="og:description"]').attr("content") || '';
		var ogUrl=$('meta[property="og:url"]').attr("content") || '';
		var ogImg=$('meta[property="og:image"]').attr("content") || '';

		ogTitle = (ogTitle=='')?defaultOg[UILANGUAGE]['title']:ogTitle;
		ogDesc = (ogDesc=='')?defaultOg[UILANGUAGE]['desc']:ogDesc;
		ogUrl = (ogUrl=='')?defaultOg[UILANGUAGE]['url']:ogUrl;
		ogImg = (ogImg=='')?defaultOg[UILANGUAGE]['img']:ogImg;

		window.fbAsyncInit = function() {
			FB.init({
				appId      : '1684174765175679',
				xfbml      : true,
				version    : 'v2.5'
			});
		};


		(function(d, s, id){
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {return;}
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function fbShare(method,link,name,picture,description){
			FB.ui({
				method: method,
				display: 'iframe',
				href: link,
				mobile_iframe: true
			}, function(response) {
				if (response && response.post_id) {
					console.log('Post was published.'+ response);
				} else {
					console.log('Post was not published.' + response);
				}
			});    
		}

		$('#fb-dialog-share').on("click",function(){
			fbShare('share', ogUrl, ogTitle, ogImg, ogDesc);
		});
	});
</script>