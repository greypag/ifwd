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
                    type="text" name="adultName" id="txtInsuFullName${inx}"
                    value="${userDetails.getFullName().trim()}" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                        </c:if>
                        <c:if test="${inx > 1}">
                            <input
                    type="text" name="adultName" id="txtInsuFullName${inx}"
                    value="" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                </c:if>
                <span id="errtxtAdFullName${inx}" class="text-red"> </span>
            </td>
        </tr>
        <tr>
            <td valign="middle" class="">
                <label class="bold-500"><fmt:message
                        key="flight.details.applicant.hkid"
                        bundle="${msg}" /></label>
                <div class="styled-select custom-select-label">
                    <select id="selectedAdultHkidPass${inx}" class="form-control soflow select-label" name="selectedAdultHkidPass">
                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                    </select>
                </div>
            </td>
            <td class="">
                     <input
                id="txtInsuHkid${inx}" name="adultHKID"
                class="form-control textUpper full-control"
                placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                value="" onkeyup="value=value.replace(/[\W]/g,'')" onblur="validateHkid('txtInsuHkid${inx}','selectedAdultHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> <span id="errtxtInsuHkid${inx}"
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
                    name="adultAgeRange" class="form-control soflow select-label"
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
                 <div class="styled-select"><select name="adultBeneficiary" class="form-control soflow select-label"
                    id="adultsselectBenificiary${inx}"
                    onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')">
                    <option value="SE"><fmt:message
                            key="flight.details.insured.beneficiary.default"
                            bundle="${msg}" /></option>
                    <c:forEach var="relationshipList"
                        items="${mapRelationshipCode}">
                        <option value="${relationshipList.key}"><c:out
                                value="${relationshipList.value}" /></option>
                    </c:forEach>
                </select></div> <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
            </td>
        </tr>
        <tr id="adultsbenificiaryId${inx}" class="hide">
            <td valign="middle" class="">
                 <label class="bold-500"><fmt:message
            key="flight.details.insured.beneficiary.name"
            bundle="${msg}" /></label>
            </td>
            <td class="">
                  <input type="text"
                    name="adultBenificiaryFullName"
                    id="adultBenefitiaryId${inx}" value="" class="form-control full-control"
                    placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                    onblur="replaceAlpha(this); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
                    onkeypress="    return alphaOnly(event);" maxlength="100" />
                <span id="erradultBenefitiaryId${inx}" class="text-red"> </span>
            </td>
        </tr>
        <tr id="adultsbenificiaryId${inx}b" class="hide">
            <td valign="middle" class="">
                 <label class="pad-left1 bold-500"><fmt:message
                        key="flight.details.insured.beneficiary.hkid"
                        bundle="${msg}" /></label>
                <div class="styled-select custom-select-label">
                <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                    <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                    <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                </select>
                </div>
            </td>
            <td class="">
                  <input id="adultBenefitiaryHKId${inx}"
                name="adultBenificiaryHkid" class="form-control textUpper full-control"
                placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                value="" onkeyup="hkidValid(this)" onblur="validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                class="text-red"> </span>
            </td>
        </tr>
    </tbody>
</table> --%>
