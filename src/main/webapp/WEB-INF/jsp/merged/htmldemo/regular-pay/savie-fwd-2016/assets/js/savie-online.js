// Savie Online
$(function() {
	window.onresize = function() {
		if (getWidth()>=992) {
			$('.psa-collapse-content').addClass('in');
			$('.psa-btn').removeAttr('data-toggle');
			
			$('.fna-tab-content').addClass('col-lg-3 col-md-3 active');
			$('.navtabs-title').removeAttr('data-toggle');
			
			// Carousel modification
			$('.fna-icons-body .tab-content').removeClass('carousel-inner');
			$('.fna-icons-body .tab-content').removeAttr('role');
			$('.fna-tab-content').removeClass('item');
			
		} else {
			$('.psa-collapse-content').removeClass('in');
			$('.psa-btn').attr('data-toggle', 'collapse');
			
			$('.fna-tab-content').removeClass('col-lg-3 col-md-3 active');
			$('.navtabs-title').attr('data-toggle', 'tab');
			$('#navtabs-1').addClass('active');
			
			// Carousel modification
			$('#so-carousel').carousel({
				interval: false
			});
			$('#so-carousel').addClass('carousel slide');
			$('#so-carousel').attr('data-ride', 'carousel');
			$('.fna-carousel .tab-content').addClass('carousel-inner');
			$('.fna-carousel .tab-content').attr('role', 'listbox');
			$('.fna-tab-content').addClass('item');
			
			$('#so-carousel').on('slid.bs.carousel', function() {
				if($('#navtabs-1').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-1').addClass('active');
				}
				if($('#navtabs-2').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-2').addClass('active');
				}
				if($('#navtabs-3').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-3').addClass('active');
				}
				if($('#navtabs-4').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-4').addClass('active');
				}
			});
		}
	};
	$(window).resize();
	
	$('#see-all-product-btn').on('click', function () {
		$('.psa-link-content').slideDown('fast');
	});

	// Datepicker
	$('#sales-illu-dob').datepicker({
		format: "mm-dd-yyyy",
		//format: 'yy-mm-dd',
		container: "#date",
		startDate: new Date(),
		autoclose: true
	 });
	 
	// Placeholder	 
	$('input, textarea').placeholder();
			
	$('[placeholder]').focus(function() {
		//var input = $(this);
		//if (input.val() == input.attr('placeholder')) {
		//	input.val('');
		//	input.removeClass('placeholder');
		//}
	}).blur(function() {
		var input = $(this);
		if (input.val() == '' || input.val() == input.attr('placeholder')) {
			input.addClass('placeholder');
			input.val(input.attr('placeholder'));
		}
	}).blur();
	$('[placeholder]').parents('form').submit(function() {
		$(this).find('[placeholder]').each(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
			}
		})
	});
});

// Checkbox
function correspondenceCheckbox() {
	// Different to permanent is checked
	if (document.getElementById('diffToPermanent').checked) {			  
		if ($('#diffToPermanentShow').hasClass('hidden')) {
			$('#diffToPermanentShow').removeClass('hidden');
		}
	} else {
		$('#diffToPermanentShow').addClass('hidden');
	}
	// Different to residential is checked
	if (document.getElementById('diffToResidential').checked) {
		if ($('#diffToResidentialShow').hasClass('hidden')) {
			$('#diffToResidentialShow').removeClass('hidden');
		}
	} else {
		$('#diffToResidentialShow').addClass('hidden');
	}
}

// Radio button
if ($('#name-others-id').is(':checked')) {
	$('#beneficiary-contents').removeClass('hidden');
	$('.add-on-beneficiary').removeClass('hidden');
}

$('#own-estate-id').click(function () {
	if ($(this).is(':checked')) {
		$('#beneficiary-contents').addClass('hidden');
		$('.add-on-beneficiary').addClass('hidden');
	}
});

$('#name-others-id').click(function () {
	if ($(this).is(':checked')) {
		$('#beneficiary-contents').removeClass('hidden');
		$('.add-on-beneficiary').removeClass('hidden');
	}
});