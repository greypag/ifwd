<!-- Timeout Modal -->
<div id="timeout-modal" class="modal fade fwd-generic-modal timeout" role="dialog" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog">
      <div class="modal-content" align="center">
        <div class="modal-body form-container" style="color:#fc6d08">
           <div class="row">
              <h2><fmt:message key="error.timeout.message" bundle="${msg}" /></h2>
           </div>
           <div class="row">
              <div class="col-lg-6 col-md-6 fwd-orange-btn-center-wrapper">
                 <button type="button" class="btn next bdr-curve btn btn-primary btn-lg wd5" id="timeout-btn" data-dismiss="modal"><fmt:message key="error.timeout.button" bundle="${msg}" /></button>
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