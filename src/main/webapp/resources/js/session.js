
$(function() {	
	setInterval("TimeInterval()", 60000); 	//间隔多长时间执行一次，以毫秒为单位，60000毫秒/1000 = 60秒(1分钟)
});

function TimeInterval()
{
	 $.ajax({
	        url: contextPath+'/ajax/checkSession',
	        contentType: "application/json",        
	        type: 'POST',
	        dataType: "json",
	        async: true,
	        cache: false,
	        data: null,
	        error: function() {

	        },
	        success: function(data) {

	        }
	    });	 

}