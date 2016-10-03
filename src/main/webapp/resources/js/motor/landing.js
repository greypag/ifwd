var thArr = [];
var ref;
$(document).ready(function () {
    $('#seeMore').on('click', function(e){
        e.preventDefault();
        $(this).addClass('hidden');
        $('#compare-table').find('tr').removeClass('hidden');   
    });

});
$(window).resize(function(){
    var w = $('#compare-table-wrap').width();
    $('#compare-table-wrap').find('th, td').outerWidth(w);
    ref = $('#ref-table').width() - 15;
    for(var i =1; i<$('#compare-table-wrap th').length; i++){
        thArr[i] = $('#compare-table-wrap th').eq(i).offset().left-ref;
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
});
