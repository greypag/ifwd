<!-- Timeout Modal -->
<div id="timeout-modal" class="modal fade timeout-modal" role="dialog" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog timeout-modal__dialog">
      <div class="modal-content timeout-modal__dialog__content" align="center">
        <div class="modal-body form-container timeout-modal__dialog__content__body" style="">
           <div class="row">
              <h2><fmt:message key="error.timeout.message" bundle="${msg}" /></h2>
           </div>
           <div class="row">
              <div class="col-lg-6 col-md-6">
                 <button type="button" class="btn btn-primary btn-lg btn--bdr-curve-0 next wd5" id="timeout-btn" data-dismiss="modal"><fmt:message key="error.timeout.button" bundle="${msg}" /></button>
              </div>
           </div>
        </div>
     </div>
  </div>
</div>

<script>
	$('#timeout-btn').on('click', function(e) {
	  window.location.href= contextPath+'/'+language;
	});
</script>