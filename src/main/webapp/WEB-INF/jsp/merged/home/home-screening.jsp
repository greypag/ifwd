<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>
    <!-- Main Content Start-->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/icon-font.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/titatoggle-dist-min.css">
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-home/easyhome-app-uifn.js"></script>
    
    <!-- Breadcrumb Component Start-->

    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
    <c:set var="breadcrumbActive" value="0" />

    <c:if test="${planIndex == 'easy-home-care'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.easyhome
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
    </c:if>
    <c:if test="${planIndex == 'home-liability'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.home.liability
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
    </c:if>

    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
        <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
        <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
    </jsp:include>

    <!-- Breadcrumb Component End-->
    
     <div class="savie-online-container app-pg-ctnr theme-white" id="ehome-app-screening">
     
  
     <div class="app-pg-cont">
        <form id="ef-form-screening">
        <div class="container-fluid">

            <h2><fmt:message key="screening.home.jumbo" bundle="${msg}" /></h2>
            <div class="screening-wrapper clearfix">
                <img src="<%=request.getContextPath()%>/resources/images/easy-home/${plan=='home-liability'? 'screening_image_v02.png' : 'screening_image_v01.png' }" alt="" class="img-hero hidden-xs">
                <img src="<%=request.getContextPath()%>/resources/images/easy-home/${plan=='home-liability'? 'screening_image_mobile_v02.png' : 'screening_image_mobile_v01.png' }" alt="" class="img-responsive visible-xs">
                <div class="screening-cont">
                    <div class="screening-block">
                        <span><fmt:message key="screening.home.question1.q" bundle="${msg}" /></span>
                        <p><fmt:message key="screening.home.question1" bundle="${msg}" /></p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                <i><fmt:message key="screening.home.question.yes" bundle="${msg}" /></i><input type="checkbox" name="cb1" checked data-txton="No" data-txtoff="Yes"><span></span><i><fmt:message key="screening.home.question.no" bundle="${msg}" /></i>
                            </label>
                        </div>
                    </div>
                    <div class="screening-block">
                        <span><fmt:message key="screening.home.question2.q" bundle="${msg}" /></span>
                        <p><fmt:message key="screening.home.question2" bundle="${msg}" /></p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                 <i><fmt:message key="screening.home.question.yes" bundle="${msg}" /></i><input type="checkbox" name="cb2" checked  data-txton="No" data-txtoff="Yes"><span></span><i><fmt:message key="screening.home.question.no" bundle="${msg}" /></i>
                            </label>
                        </div>
                    </div>
                    <div class="screening-block">
                        <span><fmt:message key="screening.home.question3.q" bundle="${msg}" /></span>
                        <p><fmt:message key="screening.home.question3" bundle="${msg}" /></p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                <i><fmt:message key="screening.home.question.yes" bundle="${msg}" /></i><input type="checkbox" name="cb3" checked data-txton="No" data-txtoff="Yes"><span></span><i><fmt:message key="screening.home.question.no" bundle="${msg}" /></i>
                            </label>
                        </div>
                    </div>

                </div>
                <div class="btn-row text-center">
                    <a href="javascript:void(0);" class="btn-app eh-btn-next" id="screening-next"><fmt:message key="screening.home.button.next" bundle="${msg}" /></a>
                </div>
            </div>
        </div>
        </form>
    </div>
    </div>
    <!-- Main Content End-->
    
    <div class="modal fade" id="oldHome"
    tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" 
    aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div id="homecareLandingModal" class="modal-content plan-modal">
           <div class="modal-body">
           <div style="overflow: hidden;"><a class="close" aria-label="Close" data-dismiss="modal">
                 <span aria-hidden="true" style="font-size:30px;">×</span>
               </a>
            </div>
             
                <p class="errorMsg">Thank you for your interests in our products, sorry that we are unable to accept your application online. For any enquiry, please call our customer service hotline at 3123 3123.</p>
                <br/>
            </div>
        </div>
    </div>
</div>

<script>
	$("input[name='cb1'],input[name='cb2'],input[name='cb3']").on("click",function(){
		var allNo = $('input[name="cb1"]:checked').attr("checked")
		 && $('input[name="cb2"]:checked').attr("checked")
		 && $('input[name="cb3"]:checked').attr("checked");
		if(allNo) {
			$("#screening-next").removeClass("grey-out");
		}else {
			$("#screening-next").addClass("grey-out");
		}
	});
	$("#screening-next").on("click",function(){
		var allNo = $('input[name="cb1"]:checked').attr("checked")
		 		 && $('input[name="cb2"]:checked').attr("checked")
		 		 && $('input[name="cb3"]:checked').attr("checked");
		if(allNo){
			$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
			$.ajax({
		        type : "get",
		        cache:false, 
		        async:false, 
		        url : '${pageContext.request.contextPath}/ajax/${planIndex}/getHomeCareQuote',
		        data : {
			        	referralCode : "",
			        	answer1 : "N",
			        	answer2 : "N"
			           },
		        success : function(data) {
			      	if(data !=null && data.errorMsg ==null){
			      		window.location = '<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/${nextPageFlow}';					}
			      	else{
			      		$('#loading-overlay').modal('hide');
			      		console.log(data.errorMsg); 
			      	}
		        },
		        error:function(){
		        	$('#loading-overlay').modal('hide');
		            console.log('error');   
		        }
		  });
		}else{
			$("#oldHome").modal("show");
			centerModals($("#oldHome"));
		}
	});
	
</script>
   
