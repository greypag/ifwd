<%-- <table class="table activation-form margin-left-2 vert-middle">
    <tbody>
        <tr>
            <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                 <label class="bold-500"><fmt:message
                key="flight.details.insured.name" bundle="${msg}" /></label>
            </td>
            <td class="">
                 <c:if test="${inx == 1}">
                    <input
                    type="text" name="personalName" id="txtInsuFullName${inx}"
                    value="${userDetails.getFullName().trim()}" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                        </c:if>
                        <c:if test="${inx > 1}">
                            <input
                    type="text" name="personalName" id="txtInsuFullName${inx}"
                    value="" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                </c:if>
                <span id="errtxtPersonalFullName${inx}" class="text-red"> </span>
            </td>
        </tr>
        <tr>
            <td valign="middle" class="">
                <label class="bold-500"><fmt:message
                        key="flight.details.applicant.hkid"
                        bundle="${msg}" /></label>
                <!-- <div class="styled-select custom-select-label">
                    <select id="selectedPersonalHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalHkidPass">
                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                    </select>
                </div>-->
            </td>
            <td class="">
                     <input
                id="txtInsuHkid${inx}" name="personalHKID"
                class="form-control textUpper full-control"
                placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> <span id="errtxtInsuHkid${inx}"
                class="text-red"> </span> <span
                id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
            </td>
        </tr>
        <tr>
            <td valign="middle" class="">
                 <label class="bold-500"><fmt:message
                key="flight.details.insured.age" bundle="${msg}" /></label>
            </td>
            <td class="">
                 <div class="styled-select"><select
                    name="personalAgeRange" class="form-control soflow select-label"
                    id="selectAgeRange${inx}">
                    <c:forEach var="ageList" items="${mapSelfType}">
                        <c:choose>
                            <c:when test="${ageList.key == '2'}">
                                <option value="${ageList.key}" selected>
                            </c:when>
                            <c:otherwise>
                                <option value="${ageList.key}">
                            </c:otherwise>
                        </c:choose>
                        <c:out value="${ageList.value}" />
                        </option>
                    </c:forEach>
                </select></div><span id="errselectAgeRange${inx}" class="text-red">
                </span>
            </td>
        </tr>
        <tr>
            <td valign="middle" class="">
                 <label class="bold-500"><fmt:message
                key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
            </td>
            <td class="">
                 <div class="styled-select"><select name="personalBeneficiary" class="form-control soflow select-label"
                    id="personalselectBenificiary${inx}"
                    onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}')">
                    <option value="SE"><fmt:message
                            key="flight.details.insured.beneficiary.default"
                            bundle="${msg}" /></option>
                    <c:forEach var="relationshipList"
                        items="${mapRelationshipCode}">
                        <option value="${relationshipList.key}"><c:out
                                value="${relationshipList.value}" /></option>
                    </c:forEach>
                </select></div> <span id="errpersonalselectBenificiary${inx}" class="text-red"></span>
            </td>
        </tr>
        <tr id="personalbenificiaryId${inx}" class="hide">
            <td valign="middle" class="">
                 <label class="bold-500"><fmt:message
            key="flight.details.insured.beneficiary.name"
            bundle="${msg}" /></label>
            </td>
            <td class="">
                  <input type="text"
                    name="personalBenificiaryFullName"
                    id="personalBenefitiaryId${inx}" value="" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                <span id="errpersonalBenefitiaryId${inx}" class="text-red"> </span>
            </td>
        </tr>
        <tr id="personalbenificiaryId${inx}b" class="hide">
            <td valign="middle" class="">
                 <label class="pad-left1 bold-500"><fmt:message
                        key="flight.details.insured.beneficiary.hkid"
                        bundle="${msg}" /></label>
                <div class="styled-select custom-select-label">
                <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass">
                    <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                    <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                </select>
                </div>
            </td>
            <td class="">
                  <input id="personalBenefitiaryHKId${inx}"
                name="personalBenificiaryHkid" class="form-control textUpper full-control"
                placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                value="" onkeyup="hkidValid(this)" onblur="validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                class="text-red"> </span>
            </td>
        </tr>
    </tbody>
</table> --%>
