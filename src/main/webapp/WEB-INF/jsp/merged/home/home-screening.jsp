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
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
     <div class="savie-online-container app-pg-ctnr theme-white" id="ehome-app-screening">
     
  
     <div class="app-pg-cont">
        <form id="ef-form-screening">
        <div class="container-fluid">

            <h2>Before we start</h2>
            <div class="screening-wrapper clearfix">
                <img src="<%=request.getContextPath()%>/resources/images/easy-home/screening_image_v01.png" alt="" class="img-hero hidden-xs">
                <img src="<%=request.getContextPath()%>/resources/images/easy-home/screening_image_mobile_v01.png" alt="" class="img-responsive visible-xs">
                <div class="screening-cont">
                    <div class="screening-block">
                        <span>Question 1</span>
                        <p>Is the building aged over 35 years?</p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                <i>Yes</i><input type="checkbox" name="cb1" checked data-txton="No" data-txtoff="Yes"><span></span><i>No</i>
                            </label>
                        </div>
                    </div>
                    <div class="screening-block">
                        <span>Question 2</span>
                        <p>Is your home situated in a building which is 4-storey (or less)?</p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                 <i>Yes</i><input type="checkbox" name="cb2" checked  data-txton="No" data-txtoff="Yes"><span></span><i>No</i>
                            </label>
                        </div>
                    </div>
                    <div class="screening-block">
                        <span>Question 3</span>
                        <p>Is your home below net floor area of 1,000 square feet?</p>
                        <div class="checkbox checkbox-slider--b checkbox-slider-md">
                            <label class="on">
                                <i>Yes</i><input type="checkbox" name="cb3" checked data-txton="No" data-txtoff="Yes"><span></span><i>No</i>
                            </label>
                        </div>
                    </div>

                </div>
                <div class="btn-row text-center">
                    <a href="javascript:void(0);" class="btn-app eh-btn-next" id="screening-next">Next</a>
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
			      		$('#loading-overlay').modal('hide');
			      		window.location = '<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/${nextPageFlow}';					}
			      	else{
			      		console.log(data.errorMsg); 
			      	}
		        },
		        error:function(){
		            console.log('error');   
		        }
		  });
		}else{
			$("#oldHome").modal("show");
			centerModals($("#oldHome"));
		}
	});
	
</script>
   
