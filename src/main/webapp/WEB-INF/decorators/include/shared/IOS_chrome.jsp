<div class="modal modal-vcenter fade bs-example-modal-lg " id="ios_chromeAlert"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p class="alert_header">Opps...Your browser is currently not supported.</p>
                    <p class="alert_suggest">Please switch to suggested <br/>browsers below:</p>
                    <img src="<%=request.getContextPath()%>/resources/images/safari_background.png">
                </div>
                <div class="modal-footer">
                  <button id="closemodal" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
</div>

<script>
	var iosChromeAlertMsg = [];
	iosChromeAlertMsg[0] = '抱歉，你的瀏覽器現時未受支援。';
    iosChromeAlertMsg[1] = '請選用以下其它建議的瀏覽器：';
    iosChromeAlertMsg[2] = '關閉';

    $(document).ready(function(){
		if(navigator.userAgent.match('CriOS')){
			if(lang === "tc") {
				$('#ios_chromeAlert .alert_header').html(iosChromeAlertMsg[0]);
				$('#ios_chromeAlert').addClass("tc_alert");
				$('#ios_chromeAlert .alert_suggest').html(iosChromeAlertMsg[1]);
				$('#ios_chromeAlert .btn').html(iosChromeAlertMsg[2]);
			}
			$('#ios_chromeAlert').modal('show');
			centerModals($('#ios_chromeAlert'));
			$(window).on('resize', centerModals);
		}
	});

</script>