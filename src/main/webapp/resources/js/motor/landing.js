var thArr = [];
var ref;
var thArr2 = [];
var ref2;
$(document).ready(function () {
    $('#seeMore').on('click', function(e){
        e.preventDefault();
        $(this).addClass('hidden');
        $('#compare-table').find('tr').removeClass('hidden');   
    });
    $('[data-toggle="tooltip"]').tooltip();
    $('a[href="#vModal"]').on('click', function() {
	  var vUrl;
	  vUrl = $(this).attr('data-url');
	  $('#vModal').find('#youtube-video').attr('src', vUrl);
	});

	$('#vModal').on('hide.bs.modal', function() {
	  $(this).find('#youtube-video').removeAttr('src');
	});
});
$(window).resize(function(){
    var w = $('#compare-table-wrap').width();
    $('#compare-table-wrap').find('th, td').outerWidth(w);
    ref = $('#ref-table').width() - 15;
    for(var i =1; i<$('#compare-table-wrap th').length; i++){
        thArr[i] = $('#compare-table-wrap th').eq(i).offset().left-ref;
    }

    var w2 = $('#compare-table2-wrap').width();
    $('#compare-table2-wrap').find('th, td').outerWidth(w2);
    ref2 = $('#ref-table2').width() - 15;
    for(var i =1; i<$('#compare-table2-wrap th').length; i++){
        thArr2[i] = $('#compare-table2-wrap th').eq(i).offset().left-ref2;
    }
});
$(window).load(function(){
    var w = $('#compare-table-wrap').width();
    $('#compare-table-wrap').find('th, td').outerWidth(w);
    
    ref = $('#ref-table').width() - 15;
    thArr[0] = 0;

    for(var i =1; i<$('#compare-table-wrap th').length; i++){
        thArr[i] = $('#compare-table-wrap th').eq(i).offset().left-ref;
    }
    $("#compare-table-wrap .nxt").on('click', function (e) {
        e.preventDefault();
        var i = $("#compare-table-wrap .nxt").index($(this));
        $('#compare-table-wrap').animate({scrollLeft: thArr[i+1] }, 500);
    });
    $("#compare-table-wrap .prev").on('click', function (e) {
        e.preventDefault();
        var i = $("#compare-table-wrap .prev").index($(this));
        $('#compare-table-wrap').animate({scrollLeft: thArr[i] }, 500);
    });

    var w2 = $('#compare-table2-wrap').width();
    $('#compare-table2-wrap').find('th, td').outerWidth(w2);
    
    ref2 = $('#ref-table2').width() - 15;
    thArr2[0] = 0;

    for(var i =1; i<$('#compare-table2-wrap th').length; i++){
        thArr2[i] = $('#compare-table2-wrap th').eq(i).offset().left-ref2;
    }
    $("#compare-table2-wrap .nxt").on('click', function (e) {
        e.preventDefault();
        var i = $("#compare-table2-wrap .nxt").index($(this));
        $('#compare-table2-wrap').animate({scrollLeft: thArr2[i+1] }, 500);
    });
    $("#compare-table2-wrap .prev").on('click', function (e) {
        e.preventDefault();
        var i = $("#compare-table2-wrap .prev").index($(this));
        $('#compare-table2-wrap').animate({scrollLeft: thArr2[i] }, 500);
    });
});
