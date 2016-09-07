<!-- Start of LiveChat (www.livechatinc.com) code -->
<script type="text/javascript">

	var __lc = {};
	__lc.license = 6320751;
	__lc.group = (UILANGUAGE=='EN')?1:2;

	(function() {
	var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
	lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
	})();

	$(document).ready(function(){
		$('.livechat_button').on("click",function(){
        	//console.log("livechat clicked");
            $('#livechat-compact-container').show();
            $('#livechat-compact-container').css({
                visibility: 'visible',
                opacity: 1
            });
            LC_API.open_chat_window();
        });
	});

</script>
<!-- End of LiveChat code -->