<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/icon-font.css">


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
     <div class="savie-online-container app-pg-ctnr" id="ehome-app-application">
     <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div>
    <div class="container-fluid summary-bar">
        <div class="row">
            <div class="summary-bar-container">
                
                <ul class="summary-group clearfix">
                    <!--  -->
                    <li class="back">
                        <a href="javascript:void(0);" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Easy HomeCare</p>
                            <p class="fld-val">Standard cover, Annual</p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Promote Code</p>
                            <p class="fld-val"><span class="txt-promote-code">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">The Club Member</p>
                            <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Original price</p>
                            <p class="fld-val">HK$420.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$0.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                        <p><span class="txt-hkd-prefix">HK$</span><span class="txt-price">420.00</span><span class="txt-hkd-suffix"></span></p>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">The Club Member</p>
                                        <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Original price</p>
                                        <p class="fld-val">HK$420.00</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$0.00</p>
                                    </div>
                                </div>
                            </li>
                             <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Amount due</p>
                                        <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price">420.00</span></p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
     <div class="app-pg-cont">
        <form id="ef-form-application">
        <div class="container-fluid">

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title">Applicant's Details</h3>
                </div>
                    
                <div class="col-xs-12 col-md-12">
                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantName" name="applicantName" data-keyblock-alphabet="true" maxlength="100">
                                        <label class="mdl-textfield__label" for="applicantName">Full name (same as ID document)</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantNameErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-date">
                                            <input class="mdl-textfield__input mobiscroll-date" type="text" id="dob" name="dob">
                                            <label class="mdl-textfield__label" for="dob">Date of birth</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="dobErrMsg"></span>
                                </div>
                        </div>

                        <div class="col-xs-12 col-md-3">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="apphkidandpassport" name="apphkidandpassport">
                                            <option value="" disabled selected></option>
                                            <option value="appHkid">HKID</option>
                                            <option value="appPassport">Passport</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="apphkidandpassport">HKID/Passport</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="apphkidandpassportErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-3">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="hkId" name="hkId">
                                            <label class="mdl-textfield__label" for="hkId">HKID/Passport no.</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="hkIdErrMsg"></span>
                                </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="tel" id="mobileNo" name="mobileNo"  maxlength="8">
                                            <label class="mdl-textfield__label" for="mobileNo">Mobile number</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="mobileNoErrMsg"></span>
                                </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="email" id="emailAddress" name="emailAddress" maxlength="50">
                                            <label class="mdl-textfield__label" for="emailAddress">Email address</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="emailAddressErrMsg"></span>
                                </div>
                        </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-xs-12">
                            <h4>Correspondence Address</h4>
                        </div>
                        
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantRoom" name="applicantRoom" maxlength="10" data-keyblock-alphabet-num-space-dash="true" >
                                        <label class="mdl-textfield__label" for="applicantRoom">Room</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantRoomErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantFloor" name="applicantFloor" maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantFloor">Floor</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantFloorErrMsg"></span>
                            </div>
                        </div>                    
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantBlock" name="applicantBlock"  maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantBlock">Block</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantBlockErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantBuilding" name="applicantBuilding" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantBuilding">Building</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantBuildingErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantEstate" name="applicantEstate" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantEstate">Estate</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantEstateErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantStreetNo" name="applicantStreetNo" maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantStreetNo">Street No.</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantStreetNoErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantStreetName" name="applicantStreetName" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="applicantStreetName">Street Name</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantStreetNameErrMsg"></span>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="applicantDistrict" name="applicantDistrict">
                                            <option value="" disabled selected></option>
                                            <option value="AD">ABERDEEN</option>
                                            <option value="A1">ADMIRALTY</option>
                                            <option value="AL">AP LEI CHAU</option>
                                            <option value="BH">BEACON HILL</option>
                                            <option value="CB">CAUSEWAY BAY</option>
                                            <option value="CD">CENTRAL DISTRICT</option>
                                            <option value="CK">CHA KWO LING</option>
                                            <option value="CW">CHAI WAN</option>
                                            <option value="CL">CHEK LAP KOK</option>
                                            <option value="CC">CHEUNG CHAU</option>
                                            <option value="CS">CHEUNG SHA WAN</option>
                                            <option value="CH">CHOI HUNG</option>
                                            <option value="CY">CHUK YUEN</option>
                                            <option value="C1">CHUNG HOM KOK</option>
                                            <option value="DW">DEEP WATER BAY</option>
                                            <option value="DH">DIAMOND HILL</option>
                                            <option value="FL">FANLING</option>
                                            <option value="FN">FEI NGO SHAN</option>
                                            <option value="FT">FO TAN</option>
                                            <option value="HV">HAPPY VALLEY</option>
                                            <option value="HF">HENG FA CHUEN</option>
                                            <option value="HM">HO MAN TIN</option>
                                            <option value="HH">HUNGHOM</option>
                                            <option value="IE">ISLAND EAST</option>
                                            <option value="IS">ISLAND SOUTH</option>
                                            <option value="JL">JARDINE'S LOOKOUT</option>
                                            <option value="J1">JORDAN</option>
                                            <option value="K5">KAM TIN</option>
                                            <option value="K3">KENNEDY TOWN</option>
                                            <option value="KB">KOWLOON BAY</option>
                                            <option value="K1">KOWLOON CITY</option>
                                            <option value="K2">KOWLOON TONG</option>
                                            <option value="KC">KWAI CHUNG</option>
                                            <option value="K4">KWAI FONG</option>
                                            <option value="K6">KWU TUNG</option>
                                            <option value="KT">KWUN TONG</option>
                                            <option value="LC">LAI CHI KOK</option>
                                            <option value="LT">LAM TIN</option>
                                            <option value="LM">LAMMA ISLAND</option>
                                            <option value="LI">LANTAU ISLAND</option>
                                            <option value="LY">LEI YU MUN</option>
                                            <option value="LF">LOK FU</option>
                                            <option value="MO">MA ON SHAN</option>
                                            <option value="MT">MA TAU WAI</option>
                                            <option value="MW">MA WAN</option>
                                            <option value="MF">MEI FOO</option>
                                            <option value="ML">MID-LEVELS</option>
                                            <option value="MK">MONGKOK</option>
                                            <option value="N1">NGAU CHI WAN</option>
                                            <option value="NK">NGAU TAU KOK</option>
                                            <option value="NP">NORTH POINT</option>
                                            <option value="PK">PEAK</option>
                                            <option value="PC">PENG CHAU</option>
                                            <option value="PS">PING SHAN</option>
                                            <option value="PF">POK FU LAM</option>
                                            <option value="PR">PRINCE EDWARD</option>
                                            <option value="QB">QUARRY BAY</option>
                                            <option value="RB">REPULSE BAY</option>
                                            <option value="SK">SAI KUNG</option>
                                            <option value="SA">SAI WAN HO</option>
                                            <option value="SY">SAI YING PUN</option>
                                            <option value="S2">SAN PO KONG</option>
                                            <option value="SM">SAU MAU PING</option>
                                            <option value="S7">SHA TAU KOK</option>
                                            <option value="ST">SHA TIN</option>
                                            <option value="SP">SHAM SHUI PO</option>
                                            <option value="S3">SHAM TSENG</option>
                                            <option value="SH">SHAU KEI WAN</option>
                                            <option value="S1">SHEK KIP MEI</option>
                                            <option value="S8">SHEK KONG</option>
                                            <option value="SO">SHEK O</option>
                                            <option value="S4">SHEK TONG TSUI</option>
                                            <option value="SS">SHEUNG SHUI</option>
                                            <option value="SW">SHEUNG WAN</option>
                                            <option value="S6">SIU LAM</option>
                                            <option value="SI">SIU SAI WAN</option>
                                            <option value="SU">SO UK</option>
                                            <option value="SL">STANLEY</option>
                                            <option value="TH">TAI HANG</option>
                                            <option value="TK">TAI KOK TSUI</option>
                                            <option value="T3">TAI KOO SHING</option>
                                            <option value="TP">TAI PO</option>
                                            <option value="TT">TAI TAM</option>
                                            <option value="T4">TAI WAI</option>
                                            <option value="T7">THE PEAK</option>
                                            <option value="T5">TIN HAU</option>
                                            <option value="T2">TIN SHUI WAI</option>
                                            <option value="T9">TIN WAN</option>
                                            <option value="TU">TING KAU</option>
                                            <option value="TO">TO KWA WAN</option>
                                            <option value="T6">TSEUNG KWAN O</option>
                                            <option value="TS">TSIM SHA TSUI</option>
                                            <option value="T8">TSING LUNG TAU</option>
                                            <option value="TY">TSING YI</option>
                                            <option value="TW">TSUEN WAN</option>
                                            <option value="T1">TSZ WAN SHAN</option>
                                            <option value="TM">TUEN MUN</option>
                                            <option value="TC">TUNG CHUNG</option>
                                            <option value="WC">WAN CHAI</option>
                                            <option value="WH">WANG TAU HOM</option>
                                            <option value="WD">WESTERN DISTRICT</option>
                                            <option value="WO">WONG CHUK HANG</option>
                                            <option value="WT">WONG TAI SIN</option>
                                            <option value="YM">YAU MA TEI</option>
                                            <option value="YT">YAU TONG</option>
                                            <option value="YC">YAU YAT CHUEN</option>
                                            <option value="YL">YUEN LONG</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="applicantDistrict">District</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantDistrictErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="applicantArea" name="applicantArea">
                                            <option value="" disabled selected></option>
                                            <option value="HK">Hong Kong</option>
                                            <option value="KL">Kowloon</option>
                                            <option value="NT">New Territories</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="applicantArea">Area</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantAreaErrMsg"></span>
                            </div>
                        </div>
                    </div>

                </div>
                
            </div>

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title">Insured Details</h3>
                </div>
                    
                <div class="col-xs-12 col-md-12">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="fld-wrapper ctrl-insured-addr">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <p class="fld-label">Insured address same as applicant's correspondence address</p>
                                        </div>
                                        <div class="col-xs-12 col-md-6 cb-toggle">
                                            <div class="checkbox checkbox-slider--b checkbox-slider-md">
                                                <label class="on">
                                                   <i>No</i><input type="checkbox" name="cbSameCorrAddr" id="cbSameCorrAddr" checked data-txton="No" data-txtoff="Yes" checked><span></span><i>Yes</i>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                    <div class="row insured-addr-more">

                        <div class="col-xs-12">
                            <h4>Insured Address</h4>
                        </div>

                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aRoom" name="aRoom" maxlength="10" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aRoom">Room</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aRoomErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aFloor" name="aFloor" maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aFloor">Floor</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aFloorErrMsg"></span>
                            </div>
                        </div>
                    
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aBlock" name="aBlock" maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aBlock">Block</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aBlockErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aBuilding" name="aBuilding" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aBuilding">Building</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aBuildingErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aEstate" name="aEstate" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aEstate">Estate</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aEstateErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aStreetNo" name="aStreetNo" maxlength="5" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aStreetNo">Street No.</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aStreetNoErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="aStreetName" name="aStreetName" maxlength="50" data-keyblock-alphabet-num-space-dash="true">
                                        <label class="mdl-textfield__label" for="aStreetName">Street Name</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aStreetNameErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="aDistrict" name="aDistrict">
                                            <option value="" disabled selected></option>
                                            <option value="AD">ABERDEEN</option>
                                            <option value="A1">ADMIRALTY</option>
                                            <option value="AL">AP LEI CHAU</option>
                                            <option value="BH">BEACON HILL</option>
                                            <option value="CB">CAUSEWAY BAY</option>
                                            <option value="CD">CENTRAL DISTRICT</option>
                                            <option value="CK">CHA KWO LING</option>
                                            <option value="CW">CHAI WAN</option>
                                            <option value="CL">CHEK LAP KOK</option>
                                            <option value="CC">CHEUNG CHAU</option>
                                            <option value="CS">CHEUNG SHA WAN</option>
                                            <option value="CH">CHOI HUNG</option>
                                            <option value="CY">CHUK YUEN</option>
                                            <option value="C1">CHUNG HOM KOK</option>
                                            <option value="DW">DEEP WATER BAY</option>
                                            <option value="DH">DIAMOND HILL</option>
                                            <option value="FL">FANLING</option>
                                            <option value="FN">FEI NGO SHAN</option>
                                            <option value="FT">FO TAN</option>
                                            <option value="HV">HAPPY VALLEY</option>
                                            <option value="HF">HENG FA CHUEN</option>
                                            <option value="HM">HO MAN TIN</option>
                                            <option value="HH">HUNGHOM</option>
                                            <option value="IE">ISLAND EAST</option>
                                            <option value="IS">ISLAND SOUTH</option>
                                            <option value="JL">JARDINE'S LOOKOUT</option>
                                            <option value="J1">JORDAN</option>
                                            <option value="K5">KAM TIN</option>
                                            <option value="K3">KENNEDY TOWN</option>
                                            <option value="KB">KOWLOON BAY</option>
                                            <option value="K1">KOWLOON CITY</option>
                                            <option value="K2">KOWLOON TONG</option>
                                            <option value="KC">KWAI CHUNG</option>
                                            <option value="K4">KWAI FONG</option>
                                            <option value="K6">KWU TUNG</option>
                                            <option value="KT">KWUN TONG</option>
                                            <option value="LC">LAI CHI KOK</option>
                                            <option value="LT">LAM TIN</option>
                                            <option value="LM">LAMMA ISLAND</option>
                                            <option value="LI">LANTAU ISLAND</option>
                                            <option value="LY">LEI YU MUN</option>
                                            <option value="LF">LOK FU</option>
                                            <option value="MO">MA ON SHAN</option>
                                            <option value="MT">MA TAU WAI</option>
                                            <option value="MW">MA WAN</option>
                                            <option value="MF">MEI FOO</option>
                                            <option value="ML">MID-LEVELS</option>
                                            <option value="MK">MONGKOK</option>
                                            <option value="N1">NGAU CHI WAN</option>
                                            <option value="NK">NGAU TAU KOK</option>
                                            <option value="NP">NORTH POINT</option>
                                            <option value="PK">PEAK</option>
                                            <option value="PC">PENG CHAU</option>
                                            <option value="PS">PING SHAN</option>
                                            <option value="PF">POK FU LAM</option>
                                            <option value="PR">PRINCE EDWARD</option>
                                            <option value="QB">QUARRY BAY</option>
                                            <option value="RB">REPULSE BAY</option>
                                            <option value="SK">SAI KUNG</option>
                                            <option value="SA">SAI WAN HO</option>
                                            <option value="SY">SAI YING PUN</option>
                                            <option value="S2">SAN PO KONG</option>
                                            <option value="SM">SAU MAU PING</option>
                                            <option value="S7">SHA TAU KOK</option>
                                            <option value="ST">SHA TIN</option>
                                            <option value="SP">SHAM SHUI PO</option>
                                            <option value="S3">SHAM TSENG</option>
                                            <option value="SH">SHAU KEI WAN</option>
                                            <option value="S1">SHEK KIP MEI</option>
                                            <option value="S8">SHEK KONG</option>
                                            <option value="SO">SHEK O</option>
                                            <option value="S4">SHEK TONG TSUI</option>
                                            <option value="SS">SHEUNG SHUI</option>
                                            <option value="SW">SHEUNG WAN</option>
                                            <option value="S6">SIU LAM</option>
                                            <option value="SI">SIU SAI WAN</option>
                                            <option value="SU">SO UK</option>
                                            <option value="SL">STANLEY</option>
                                            <option value="TH">TAI HANG</option>
                                            <option value="TK">TAI KOK TSUI</option>
                                            <option value="T3">TAI KOO SHING</option>
                                            <option value="TP">TAI PO</option>
                                            <option value="TT">TAI TAM</option>
                                            <option value="T4">TAI WAI</option>
                                            <option value="T7">THE PEAK</option>
                                            <option value="T5">TIN HAU</option>
                                            <option value="T2">TIN SHUI WAI</option>
                                            <option value="T9">TIN WAN</option>
                                            <option value="TU">TING KAU</option>
                                            <option value="TO">TO KWA WAN</option>
                                            <option value="T6">TSEUNG KWAN O</option>
                                            <option value="TS">TSIM SHA TSUI</option>
                                            <option value="T8">TSING LUNG TAU</option>
                                            <option value="TY">TSING YI</option>
                                            <option value="TW">TSUEN WAN</option>
                                            <option value="T1">TSZ WAN SHAN</option>
                                            <option value="TM">TUEN MUN</option>
                                            <option value="TC">TUNG CHUNG</option>
                                            <option value="WC">WAN CHAI</option>
                                            <option value="WH">WANG TAU HOM</option>
                                            <option value="WD">WESTERN DISTRICT</option>
                                            <option value="WO">WONG CHUK HANG</option>
                                            <option value="WT">WONG TAI SIN</option>
                                            <option value="YM">YAU MA TEI</option>
                                            <option value="YT">YAU TONG</option>
                                            <option value="YC">YAU YAT CHUEN</option>
                                            <option value="YL">YUEN LONG</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="aDistrict">District</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aDistrictErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="aArea" name="aArea">
                                            <option value="" disabled selected></option>
                                            <option value="HK">Hong Kong</option>
                                            <option value="KL">Kowloon</option>
                                            <option value="NT">New Territories</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="aArea">Area</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aAreaErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <br>
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="netFloorArea" name="netFloorArea">
                                            <option value="" disabled selected></option>
                                            <option value="EEHCFLOORAREAA01">Less than 500</option>
                                            <option value="EEHCFLOORAREAA02">500-700</option>
                                            <option value="EEHCFLOORAREAA03">701-850</option>
                                            <option value="EEHCFLOORAREAA04">851-1000</option>
                                        </select>
                                        <label class="mdl-textfield__label" for="netFloorArea">Net floor Area (square feet)</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="netFloorAreaErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-date">
                                            <input class="mdl-textfield__input mobiscroll-date" type="text" id="effectdate" name="effectdate">
                                            <label class="mdl-textfield__label" for="effectdate">Effective date of coverage</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="effectdateErrMsg"></span>
                                </div>
                        </div>
                    </div>
                </div>
                
            </div>

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title">Declaration</h3>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="form-group no-border">
                        <div class="checkbox">
                            <input type="checkbox" name="declarration" id="declarration" value=""><label for="declarration">I have read and understood the policy provisions and declare that:<br>i. the particulars and statements given above are, to the best of my knowledge and belief, true and complete;<br>ii. the Home is constructed from bricks, stone or concrete with concrete roof and occupied by me and my family as private dwelling; <br>iii. I or my family member living with me have not sustained any loss during the last three years from any of the risks now proposed for insurance; or been refused renewal by any insurer;<br>iv. this application shall be the basis of the contract between me and FWD General Insurance Company Limited;<br>v. this Proposal Form is applied for at HKSAR, in case of fraud or misrepresentation, the policy may be declared void.</label>
                            <span class="error-msg" id="declarrationErrMsg"></span>
                        </div>
                        <div class="checkbox sep">
                            <input type="checkbox" name="declarration2" id="declarration2" value=""><label for="declarration2">I have read and understood Personal Information Collection Statement and agree to be bound by the same.</label>
                            <span class="error-msg" id="declarration2ErrMsg"></span>
                        </div>
                        <hr>
                        <div class="checkbox grey">
                            <input type="checkbox" name="donotWishDirectMarketing" id="donotWishDirectMarketing" value=""><label for="donotWishDirectMarketing">If you do NOT wish FWD General Insurance Company Limited to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below:<br>Please do not send direct marketing information to me.</label>
                            
                        </div>
                        <div class="checkbox grey">
                            <input type="checkbox" name="donotDisclose" id="donotDisclose" value=""><label for="donotDisclose">Please do not provide my personal data to other persons or companies for their use in direct marketing.</label>
                            
                        </div>
                    </div>
                </div>
            </div>



            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title">Create FWD member account</h3>
                </div>
                    
                <div class="col-xs-12 col-md-12">
                    <div class="row">

                        <div class="col-xs-12">
                            
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="userName" name="userName" maxlength="50">
                                        <label class="mdl-textfield__label" for="userName">Choose username</label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="userNameErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="password" id="password" name="password">
                                            <label class="mdl-textfield__label" for="password">Choose password</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="passwordErrMsg"></span>
                                </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="password" id="Confirm-Password" name="Confirm-Password">
                                            <label class="mdl-textfield__label" for="Confirm-Password">Confirm password</label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="Confirm-PasswordErrMsg"></span>
                                </div>
                        </div>
                    </div>

                </div>
                
            </div>

            <div class="btn-row text-center">
                <a href="javascript:void(0);" class="btn-app eh-btn-back">Back</a>
                <a href="javascript:void(0);" class="btn-app eh-btn-next">Next</a>
            </div>
            
        </div>
        </form>
    </div>
    <!-- Main Content End-->

		
    </div>

