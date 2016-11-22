<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/pop-up-temp.css"/>

<script>
function imgModal(modal_id, img, title, content, button){
	var modal_html = '';
	modal_html += '<div class="modal fade" id="'+modal_id+'">';
	modal_html += '	<div class="modal-dialog" role="document">';
	modal_html += '		<div class="modal-content">';
	modal_html += '			<div class="modal-body">';
	modal_html += '				<div class="row">';
	modal_html += '					<div class="modal-body__img__desktop col-md-4 col-lg-4 visible-md visible-lg">';
	modal_html += '						<img src="<%=request.getContextPath()%>'+img+'" />';
	modal_html += '					</div>';
	modal_html += '					<div class="modal-body__right col-xs-12 col-sm-12 col-md-8 col-lg-8">';
	modal_html += '						<div class="modal-body__close">';
	modal_html += '							<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
	modal_html += '								<span aria-hidden="true">&times;</span>';
	modal_html += '							</button>';
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__img__mobile visible-xs visible-sm">';
	modal_html += '							<img src="<%=request.getContextPath()%>'+img+'" />';
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__title">';
	modal_html += '							<h3 class="modal-title">'+title+'</h3>';
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__content">';
	modal_html += '							'+content;
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__button">';
	modal_html += '							<button type="button" class="btn btn-primary" data-dismiss="modal">'+button+'</button>';
	modal_html += '						</div>';
	modal_html += '					</div>';
	modal_html += '				</div>';
	modal_html += '			</div>';
	modal_html += '		</div>';
	modal_html += '	</div>';
	modal_html += '</div>';
	
	// add to body
	$('body').append(modal_html);
	
	$('#'+modal_id).on('shown.bs.modal',function(){
		console.log('.modal-body__right height: '+$('#'+modal_id+' .modal-body__right').height());
		console.log('.modal-body__img__desktop height: '+$('#'+modal_id+' .modal-body__img__desktop').height());
		$('#'+modal_id+' .modal-body__img__desktop').css('margin-top',($('#'+modal_id+' .modal-body__right').height() - $('#'+modal_id+' .modal-body__img__desktop').height()) / 2);
	});
}

function imgModal_noImg(modal_id, title, content, button){
	var modal_html = '';
	modal_html += '<div class="modal fade" id="'+modal_id+'">';
	modal_html += '	<div class="modal-dialog" role="document">';
	modal_html += '		<div class="modal-content">';
	modal_html += '			<div class="modal-body">';
	modal_html += '				<div class="row">';
	modal_html += '					<div class="modal-body__right col-xs-12 col-sm-12 col-md-12 col-lg-12">';
	modal_html += '						<div class="modal-body__close">';
	modal_html += '							<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
	modal_html += '								<span aria-hidden="true">&times;</span>';
	modal_html += '							</button>';
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__title">';
	modal_html += '							<h3 class="modal-title">'+title+'</h3>';
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__content">';
	modal_html += '							'+content;
	modal_html += '						</div>';
	modal_html += '						<div class="modal-body__button">';
	modal_html += '							<button type="button" class="btn btn-primary" data-dismiss="modal">'+button+'</button>';
	modal_html += '						</div>';
	modal_html += '					</div>';
	modal_html += '				</div>';
	modal_html += '			</div>';
	modal_html += '		</div>';
	modal_html += '	</div>';
	modal_html += '</div>';
	
	// add to body
	$('body').append(modal_html);
}

</script>

