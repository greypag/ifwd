<%-- <table class="table activation-form margin-left-2 vert-middle">
    <tbody>
        <tr>
            <td colspan="2"><h3 class="black-bold">
                    <fmt:message key="flight.details.applicant.heading"
                        bundle="${msg}" />
                </h3></td>
        </tr>
        <tr>


            <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5"><label
                for="inputFullName" class="bold-500"><fmt:message
                        key="flight.details.applicant.name" bundle="${msg}" /></label></td>
            <td class=""><input type="text"
                value="${userDetails.getFullName().trim()}" class="form-control full-control"
                id="inputFullName" name="fullName"
                placeholder="<fmt:message key="flight.details.applicant.name.placeholder" bundle="${msg}" />"
                onblur="replaceAlpha(this); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                onkeypress="return alphaOnly(event);" maxlength="100" /> <span
                id="fullnameinvalid" class="text-red"></span></td>
        </tr>
        <tr>
            <td valign="middle" class="">

                <label for="inputEmail3"
                class="bold-500"><fmt:message
                        key="flight.details.applicant.hkid" bundle="${msg}" /></label>

                <div class="styled-select custom-select-label">
                    <select id="selectHkidPass"
                        name="selectedHkidPassApplicant" onchange="selected(this)"
                        class="form-control soflow select-label">
                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                    </select>
                </div>
            </td>
            <td class=""><input type="text" name="hkid"
                class="form-control numberinput textUpper full-control"
                id="inputTxtAppHkid"
                placeholder="<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />" onkeyup="value=value.replace(/[\W]/g,'')" onblur="validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"/>
                <span id="errAppHkid" class="text-red"> </span></td>
        </tr>
        <!-- Birthday starts -->
        <tr>
            <td valign="middle"><label for="inputApplicantDob"
                class="bold-500"><fmt:message key="flight.details.applicant.birthday" bundle="${msg}" /></label></td>
            <td>
                <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                    <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
                </div>
                <span id="dobInvalid" class="text-red"></span>
            </td>
        </tr>
        <!-- Birthday ends -->
        <tr>
            <td valign="middle" class=""><label for="inputMobileNo"
                class="bold-500"><fmt:message
                        key="flight.details.applicant.mobile" bundle="${msg}" /></label></td>
            <td class=""><input type="text"
                value="${userDetails.getMobileNo().trim()}" class="form-control full-control"
                name="mobileNo" id="inputMobileNo"
                placeholder="<fmt:message key="flight.details.applicant.mobile.placeholder" bundle="${msg}" />"
                onkeypress="return isNumeric(event)"
                onblur="replaceNumeric(this); validateMobile('inputMobileNo','mobileNoInvalid');" maxlength="8" /> <span
                id="mobileNoInvalid" class="text-red"></span></td>
        </tr>
        <tr>
            <td valign="middle" class=""><label for="inputEmailId"
                class="bold-500"><fmt:message
                        key="flight.details.applicant.email" bundle="${msg}" /></label></td>
            <td class=""><input class="form-control full-control"
                value="${userDetails.getEmailAddress().trim()}" name="emailAddress"
                id="inputEmailId"
                placeholder="<fmt:message key="flight.details.applicant.email.placeholder" bundle="${msg}" />"
                maxlength="50" onblur="validateEmail('inputEmailId','emailid');" /> <span id="emailid" class="text-red"></span></td>
        </tr>
    </tbody>
</table> --%>
