<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<style type="text/css" media="all">

#landing-carousel .carousel-control-wrap{
	position: relative;
	    width: 120px;
    float: right;
top: -60px;
}

#landing-carousel .carousel-control{
position: absolute;
width: 60px;
height: 60px;
}
#landing-carousel .carousel-control.left{
background: #909393 !important;
opacity: 1 !important;
filter: alpha(opacity=0.5 times 100) !important;
}
#landing-carousel .carousel-control.right{
background: #484c48 !important;
opacity: 1 !important;
filter: alpha(opacity=0.5 times 100) !important;
}
#landing-carousel .fa{
	text-shadow: none;
    font-size: 200%;
    line-height: 1.5;
}

    .quote-form-wrapper{
        margin: 0 15px;
    }
    .q5:last-of-type{
        margin-bottom: 30px;
    }
    @media screen and (max-width: 767px){
        .quote-form-wrapper{
            margin: 0;
            padding: 0 20px;
        }
        #testimonials{
       /*     
       margin-left: -20px;
            margin-right: -20px;
            padding-left: 20px;
            padding-right: 20px;
            */
        }
    }

   #hero #getComprehensive, #hero #getThirdParty{
    	white-space: initial;
    }
    
    #landing-carousel{
    padding-top: 50px;
    }
</style>
<section id="" class="motor-landing">
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor
        </c:set>
        <c:set var="breadcrumbActive">2</c:set>
        <c:set var="breadcrumbBold">true</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
            <jsp:param name="breadcrumbBold" value="${breadcrumbBold}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->
    
    <div class="whole-banner" id="hero">
        <div class="page-banner">
            <img src="<%=request.getContextPath()%>/resources/images/motor/Motor-Insurance_Mobile.jpg" class="img-responsive hidden-md hidden-lg" alt="FWD Saving Insurance Hong Kong">
            <img src="<%=request.getContextPath()%>/resources/images/motor/Motor-Insurance_PC.jpg" class="img-responsive hidden-xs hidden-sm" alt="FWD Saving Insurance Hong Kong">

            <div class="container up">
                <div class="row">
                    <div class="col-xs-12">
                        <h1 class="text--shadow-default">
                            <fmt:message key="motor.landing.page.heading" bundle="${motorMsg}" />
                        </h1>
                    </div>
                </div>
            </div>
            <div class="container down">
                <div class="row">
                    <div class="text-center col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                        <h3>
                            <fmt:message key="motor.landing.hero.getquote.label" bundle="${motorMsg}" />
                        </h3>
                        <a id="getComprehensive" class="btn btn-primary bdr-curve yellow-color" href="<%=request.getContextPath()%>/${language}/motor-insurance/get-quote?plan=comp"><fmt:message key="motor.landing.hero.getquote.comprehensive" bundle="${motorMsg}" /></a>
                        <a id="getThirdParty" class="btn btn-primary bdr-curve light-green-color" href="<%=request.getContextPath()%>/${language}/motor-insurance/get-quote?plan=third"><fmt:message key="motor.landing.hero.getquote.thirdparty" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container download-section">
        <div class="content">
           <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <p>
                        <fmt:message key="motor.landing.page.content" bundle="${motorMsg}" />
                        <br/>
                        <br/>
                        <small>
<fmt:message key="motor.landing.page.content.remark" bundle="${motorMsg}" />
</small>
                        <br/>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <a id="dlProductBrochure" class="" href="<fmt:message key="motor.link.productbrochure" bundle="${motorMsg}" />" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.button.productbrochure" bundle="${motorMsg}" /></a>
                    <a id="dlPolicyTerms" class="" href="<fmt:message key="motor.link.policyterms" bundle="${motorMsg}" />" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.button.policyterms" bundle="${motorMsg}" /></a>
                </div>
            </div>
        </div>
        
    </div>
    <div class="container" id="compare">
        <div  id="testimonials"> 
            <div class="panel panel-default">
                <div id="collapseOne" class="panel-collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="table-responsive hidden-xs">
                            <table class="table table-striped" id="compare-table">
                                <thead>
                                    <tr>
                                        <th class="col-xs-6 "></th>
                                        <th class="col-xs-2  silver text-center yellow-color"><fmt:message key="motor.landing.table.header.col1" bundle="${motorMsg}" /></th>
                                        <th class="col-xs-2  gold text-center orange-color"><fmt:message key="motor.landing.table.header.col2" bundle="${motorMsg}" /></th>
                                        <th class="col-xs-2  gold text-center light-green-color"><fmt:message key="motor.landing.table.header.col3" bundle="${motorMsg}" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><fmt:message key="motor.landing.table.row1.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"><fmt:message key="motor.landing.table.row1.col1" bundle="${motorMsg}" /></td>
                                        <td class="text-center orange-border"><fmt:message key="motor.landing.table.row1.col2" bundle="${motorMsg}" /></td>
                                        <td class="text-center light-green-border"><fmt:message key="motor.landing.table.row1.col3" bundle="${motorMsg}" /></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="motor.landing.table.row2.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"><fmt:message key="motor.landing.table.row2.col1" bundle="${motorMsg}" /></td>
                                        <td class="text-center orange-border"><fmt:message key="motor.landing.table.row2.col2" bundle="${motorMsg}" /></td>
                                        <td class="text-center light-green-border"><fmt:message key="motor.landing.table.row2.col3" bundle="${motorMsg}" /></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="motor.landing.table.row3.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row4.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row5.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row6.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row7.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row8.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row9.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row10.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row11.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr class="hidden">
                                        <td><fmt:message key="motor.landing.table.row12.copy" bundle="${motorMsg}" /></td>
                                        <td class="text-center yellow-border"></td>
                                        <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                        <td class="text-center light-green-border"></td>
                                    </tr>
                                    <tr>
                                        <td colspan=4 class="text-center">
                                            <br />
                                            <a id="seeMore" href="javascript:;"><i class="fa fa-caret-down" aria-hidden="true"></i>&nbsp;&nbsp;<fmt:message key="motor.button.seemorecoverage" bundle="${motorMsg}" /></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row visible-xs" id="compare-table-2">
                            <div class="col-xs-5">
                                <table class="table" id="ref-table">
                                    <thead>
                                        <tr>
                                            <th class="col-xs-6 "></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th class="col-xs-2  silver text-center yellow-color"><fmt:message key="motor.landing.table.header.col1" bundle="${motorMsg}" /></th>
                                        </tr>
                                        <tr>
                                            <th class="col-xs-2  gold text-center orange-color"><fmt:message key="motor.landing.table.header.col2" bundle="${motorMsg}" /></th>
                                        </tr>
                                        <tr>
                                            <th class="col-xs-2  gold text-center light-green-color"><fmt:message key="motor.landing.table.header.col3" bundle="${motorMsg}" /></th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xs-7">
                                <div class="table-responsive" id="compare-table-wrap">
                                    <table class="table table-striped" id="compare-table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row1.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row2.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row3.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row4.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row5.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row6.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row7.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row8.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row9.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row10.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-1">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row11.copy" bundle="${motorMsg}" />      
                                                        </div>
                                                        <div class="col-xs-1">
                                                            <a class="nxt" href="javascript:;">
                                                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="row">
                                                        <div class="col-xs-2">
                                                            <a class="prev" href="javascript:;">
                                                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-10">
                                                            <fmt:message key="motor.landing.table.row12.copy" bundle="${motorMsg}" />        
                                                        </div>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center yellow-border"><fmt:message key="motor.landing.table.row1.col1" bundle="${motorMsg}" /></td>
                                                <td class="text-center yellow-border"><fmt:message key="motor.landing.table.row2.col1" bundle="${motorMsg}" /></td>
                                                <td class="text-center yellow-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center yellow-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                                <td class="text-center yellow-border"></td>
                                            </tr>
                                            <tr>
                                                <td class="text-center orange-border"><fmt:message key="motor.landing.table.row1.col2" bundle="${motorMsg}" /></td>
                                                <td class="text-center orange-border"><fmt:message key="motor.landing.table.row2.col2" bundle="${motorMsg}" /></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center orange-border"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="text-center light-green-border"><fmt:message key="motor.landing.table.row1.col3" bundle="${motorMsg}" /></td>
                                                <td class="text-center light-green-border"><fmt:message key="motor.landing.table.row2.col3" bundle="${motorMsg}" /></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                                <td class="text-center light-green-border"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="container featured" id="featured">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.landing.features.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.landing.features.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-xs-4 col-sm-12">
                        <div class="title hidden-xs" >
                            <fmt:message key="motor.landing.features.1.title" bundle="${motorMsg}" />
                        </div>
                        <div class="thumbnail">
                            <img src="<%=request.getContextPath()%>/resources/images/motor/safety-driver-bouns.png" alt="" />
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-12">
                        <div class="title visible-xs" >
                            <fmt:message key="motor.landing.features.1.title" bundle="${motorMsg}" />
                        </div>
                        <div class="content">
                            <p>
                             <fmt:message key="motor.landing.features.1.copy" bundle="${motorMsg}" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-xs-4 col-sm-12">
                        <div class="title hidden-xs" >
                            <fmt:message key="motor.landing.features.2.title" bundle="${motorMsg}" />
                        </div>
                        <div class="thumbnail">
                            <img src="<%=request.getContextPath()%>/resources/images/motor/mobile-coverage.png" alt="" />
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-12">
                        <div class="title visible-xs" >
                            <fmt:message key="motor.landing.features.2.title" bundle="${motorMsg}" />
                        </div>
                        <div class="content">
                            <p>
                                <fmt:message key="motor.landing.features.2.copy" bundle="${motorMsg}" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-xs-4 col-sm-12">
                        <div class="title hidden-xs" >
                            <fmt:message key="motor.landing.features.3.title" bundle="${motorMsg}" />
                        </div>
                        <div class="thumbnail">
                            <img src="<%=request.getContextPath()%>/resources/images/motor/Telematics-Promotion.png" alt="" />
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-12">
                        <div class="title visible-xs" >
                            <fmt:message key="motor.landing.features.3.title" bundle="${motorMsg}" />
                        </div>
                        <div class="content">
                            <p>
                                <fmt:message key="motor.landing.features.3.copy" bundle="${motorMsg}" /><a href="#landing-carousel">
                            <fmt:message key="motor.landing.features.1.extracopy1" bundle="${motorMsg}" />
                            </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
                                <div class="col-xs-12 text-center">
                                                <p>
                            <small>
                            <fmt:message key="motor.landing.features.1.extracopy2" bundle="${motorMsg}" />
                        <a href="<%=request.getContextPath()%>/resources/pdf/motor/<fmt:message key="motor.landing.features.1.extralink2" bundle="${motorMsg}" />" target="_blank"><fmt:message key="motor.landing.features.1.extracopy3" bundle="${motorMsg}" /></a>
                        <fmt:message key="motor.landing.features.1.extracopy4" bundle="${motorMsg}" />
                                                    </small>
                            </p>
                    </div>
        </div>
    </div>
    
    <div id="landing-carousel" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/Mobile/<fmt:message key="motor.landing.motor.landing.inforgraphic.1.linkmb" bundle="${motorMsg}" />" class="img-responsive hidden-md hidden-lg" alt="">
    <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/PC/<fmt:message key="motor.landing.motor.landing.inforgraphic.1.linkpc" bundle="${motorMsg}" />" class="img-responsive hidden-xs hidden-sm" alt="">
    </div>
    <div class="item">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/Mobile/<fmt:message key="motor.landing.motor.landing.inforgraphic.2.linkmb" bundle="${motorMsg}" />" class="img-responsive hidden-md hidden-lg" alt="">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/PC/<fmt:message key="motor.landing.motor.landing.inforgraphic.2.linkpc" bundle="${motorMsg}" />" class="img-responsive hidden-xs hidden-sm" alt="">
    </div>
        <div class="item">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/Mobile/<fmt:message key="motor.landing.motor.landing.inforgraphic.3.linkmb" bundle="${motorMsg}" />" class="img-responsive hidden-md hidden-lg" alt="">
<img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/PC/<fmt:message key="motor.landing.motor.landing.inforgraphic.3.linkpc" bundle="${motorMsg}" />" class="img-responsive hidden-xs hidden-sm" alt="">
    </div>
        <div class="item">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/Mobile/<fmt:message key="motor.landing.motor.landing.inforgraphic.4.linkmb" bundle="${motorMsg}" />" class="img-responsive hidden-md hidden-lg" alt="">
   <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/PC/<fmt:message key="motor.landing.motor.landing.inforgraphic.4.linkpc" bundle="${motorMsg}" />" class="img-responsive hidden-xs hidden-sm" alt="">
    </div>
        <!-- div class="item">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/Mobile/<fmt:message key="motor.landing.motor.landing.inforgraphic.5.linkmb" bundle="${motorMsg}" />" class="img-responsive hidden-md hidden-lg" alt="">
 <img src="<%=request.getContextPath()%>/resources/images/motor/promotion_banner/PC/<fmt:message key="motor.landing.motor.landing.inforgraphic.5.linkpc" bundle="${motorMsg}" />" class="img-responsive hidden-xs hidden-sm" alt="">
    </div> -->
  </div>

  <!-- Controls -->
 <div class="carousel-control-wrap" id="infoGraphic">
 <a class="left carousel-control" href="#landing-carousel" role="button" data-slide="prev">
    <i class="fa fa-angle-left" aria-hidden="true"></i>
  </a>
  <a class="right carousel-control" href="#landing-carousel" role="button" data-slide="next">
      <i class="fa fa-angle-right" aria-hidden="true"></i>
  </a>
 </div>
  
</div>
    <div class="container featured no-border">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.landing.addition.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.landing.addition.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-xs-4 col-sm-12">
                                <div class="title hidden-xs" >
                                    <fmt:message key="motor.landing.addition.addition1.title" bundle="${motorMsg}" />
                                </div>
                                <div class="thumbnail">
                                    <img src="<%=request.getContextPath()%>/resources/images/motor/personal-acc.png" alt="" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-12">
                                <div class="title visible-xs" >
                                    <fmt:message key="motor.landing.addition.addition1.title" bundle="${motorMsg}" />
                                </div>
                                <div class="content">
                                    <p>
                                        <fmt:message key="motor.landing.addition.addition1.copy" bundle="${motorMsg}" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-xs-4 col-sm-12">
                                <div class="title hidden-xs" >
                                    <fmt:message key="motor.landing.addition.addition2.title" bundle="${motorMsg}" />
                                </div>
                                <div class="thumbnail">
                                    <img src="<%=request.getContextPath()%>/resources/images/motor/Benefits.png" alt="" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-12">
                                <div class="title visible-xs" >
                                    <fmt:message key="motor.landing.addition.addition2.title" bundle="${motorMsg}" />
                                </div>
                                <div class="content">
                                    <p>
                                        <fmt:message key="motor.landing.addition.addition2.copy" bundle="${motorMsg}" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="container hidden" id="testimonials" >
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Partnership Benefits</h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl">Partnership Benefits</h2>
            <!--end mobile--> 
        </div>
        <div class="row middle-carousel">
            <div class="col-xs-12 col-sm-8 carousel-left">
                <img src="http://dummyimage.com/800x480/ccc/555.jpg" class="img-responsive hidden-md hidden-lg" alt="FWD Saving Insurance Hong Kong">
                <img src="http://dummyimage.com/800x480/ccc/555.jpg" class="img-responsive hidden-xs hidden-sm" alt="FWD Saving Insurance Hong Kong">
            </div>
            <div class="col-xs-12 col-sm-4 carousel-right">
                <div class="content">
                    <h3>Oil Discount</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                        <br />
                        <br />
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                        <br />
                        <br />
                    </p>

                    <a class="btn btn-primary bdr-curve " href="javascript:;">Read More</a>
                </div>

            </div>
        </div>
    </div>
    <div class="container hidden" >
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.landing.partnership.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.landing.partnership.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row text-center">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="content">
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                        <br />
                        <br />
                    </p>
                    <a class="bdr-curve btn btn-primary" href="javascript:;">Get Now</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row bottom">
            <div class="text-center col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <h3>
                    <fmt:message key="motor.landing.hero.getquote.label" bundle="${motorMsg}" />
                </h3>
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="row button-group">
                            <div class="col-xs-6 text-right">
                                <a id="getComprehensive" class=" btn btn-primary bdr-curve nxt-btn" href="<%=request.getContextPath()%>/${language}/motor-insurance/get-quote?plan=comp"><fmt:message key="motor.landing.hero.getquote.comprehensive" bundle="${motorMsg}" /></a>
                                <br />
                                <br />
                            </div>    
                            <div class="col-xs-6 text-left">
                                <a id="getThirdParty" class="btn btn-primary bdr-curve nxt-btn" href="<%=request.getContextPath()%>/${language}/motor-insurance/get-quote?plan=third"><fmt:message key="motor.landing.hero.getquote.thirdparty" bundle="${motorMsg}" /></a>
                                <br />
                                <br />
                            </div>    
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.landing.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.landing.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row read-more-blog">
            <div class="col-sm-6 col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/1st_blog_image.jpg" alt="">
                    <div class="overlay ">
                        <h2><fmt:message key="motor.landing.tips.1.title" bundle="${motorMsg}" /></h2>
                        <div class="hidden-xs">
                        <a class="info" href='<fmt:message key="motor.landing.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="row text-center">
                    <div class="col-xs-4 col-xs-offset-4">
                        <br />
                        <a class="info visible-xs btn btn-primary bdr-curve" href='<fmt:message key="motor.landing.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>


            </div>
            <div class="col-sm-6 hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/2nd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.landing.tips.2.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.landing.tips.2.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/3rd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.landing.tips.3.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.landing.tips.3.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/4th_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.landing.tips.4.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.landing.tips.4.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/landing.js"></script>