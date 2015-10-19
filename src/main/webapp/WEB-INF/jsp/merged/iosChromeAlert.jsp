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