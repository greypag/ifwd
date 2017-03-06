<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/pnotify.custom.min.js"></script>

<script>
function show_stack_bar_top(message) {
	var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
    var opts = {
		        title: "<fmt:message key="system.errorbox.generic.title" bundle="${msg}" />",
		        text: "<fmt:message key="system.errorbox.generic.message" bundle="${msg}" />",
		        addclass: "stack-bar-top error-box",
		        cornerclass: "",
		        width: "100%",
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