<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/pnotify.custom.min.js"></script>

<script>
	PNotify.prototype.options.styling = "bootstrap3";
	function show_stack_bar_top(msg_type, titleToShown, message) {
		var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
/*
		var addclass = '';
		if(msg_type=='error'){
			addclass = 'stack-bar-top error-box';
		}else if('info'){
			addclass = 'stack-bar-top';
		}else{
			//default is error message
			addclass = 'stack-bar-top error-box';
		}
*/
		var opts = {
			title: titleToShown,
			text: message,
			addclass: "stack-bar-top",
			cornerclass: "",
			width: "100%",
			type: msg_type,
			hide: false,
			buttons: {
				closer: true,
				sticker: true
			},
			stack: stack_bar_top
		};
		new PNotify(opts);
	}
</script>