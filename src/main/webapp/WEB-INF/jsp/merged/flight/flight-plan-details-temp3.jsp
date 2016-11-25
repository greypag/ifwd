<%-- <div id="childtraveller">
    <h4 class="color1 margin-left-28">
        <fmt:message key="flight.details.insured.label.family.child"
            bundle="${msg}" />
        <c:out value="${inx}"></c:out>
    </h4>
    <table class="table activation-form margin-left-2 vert-middle">
        <tbody>
            <tr>
                <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                     <label class="bold-500"><fmt:message
                    key="flight.details.insured.name" bundle="${msg}" /></label>
                </td>
                <td class="">
                     <input
                        type="text" name="childName" id="txtChldFullName${inx}"
                        value="" class="form-control full-control"
                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                        onblur="replaceAlpha(this); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                    <span id="errtxtChldFullName${inx}" class="text-red">
                    </span>
                </td>
            </tr>
            <tr>
                <td valign="middle" class="">
                    <label class="bold-500"><fmt:message
                            key="flight.details.applicant.hkid"
                            bundle="${msg}" /></label>
                    <div class="styled-select custom-select-label">
                        <select id="selectedChildHkidPass${inx}" class="form-control soflow select-label" name="selectedChildHkidPass">
                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                        </select>
                    </div>
                </td>
                <td class="">
                         <input
                        id="txtChldInsuHkid${inx}" name="childHKID"
                        class="form-control textUpper full-control"
                        placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                        value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtChldInsuHkid${inx}','selectedChildHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"/> <span id="errtxtChldInsuHkid${inx}"
                        class="text-red"> </span>
                </td>
            </tr>
            <tr>
                <td valign="middle" class="">
                    <label class="bold-500"><fmt:message
                    key="flight.details.insured.age" bundle="${msg}" /></label>
                </td>
                <td class="">
                     <t:dropdown
                        defaultLabel="Select One"
                        onChange=""
                        selectables="${mapChildType}"
                        valueElmId="selectchildAgeRange${inx}"
                        valueElmName="childAgeRange"
                    />
                    <div class="styled-select">
                    <select name="childAgeRange" class="form-control soflow select-label"
                        id="selectchildAgeRange${inx}">
                        <c:forEach var="ageList" items="${mapChildType}">
                            <c:choose>
                                <c:when test="${ageList.key == '1'}">
                                    <option value="${ageList.key}" selected>
                                </c:when>
                                <c:otherwise>
                                    <option value="${ageList.key}">
                                </c:otherwise>
                            </c:choose>
                            <c:out value="${ageList.value}" />
                            </option>
                        </c:forEach>
                    </select></div> <span id="errchildRange${inx}" class="text-red"></span>
            </td>
            </tr>
            <tr>
                <td valign="middle" class="">
                     <label class="bold-500"><fmt:message
                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                </td>
                <td class="">
                     <div class="styled-select">
                    <select id="childselectBenificiary${inx}"
                        name="childBeneficiary"
                        onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
                        class="form-control soflow select-label">
                        <option value="SE"><fmt:message
                                key="flight.details.insured.beneficiary.default"
                                bundle="${msg}" /></option>
                        <c:forEach var="relationshipCodeList"
                            items="${mapRelationshipCode}">
                            <option value="${relationshipCodeList.key}"><c:out
                                    value="${relationshipCodeList.value}" /></option>
                        </c:forEach>
                    </select></div> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
                </td>
            </tr>
            <tr id="childbenificiaryId${inx}" class="hide">
                <td valign="middle" class="">
                     <label class="bold-500"><fmt:message
                key="flight.details.insured.beneficiary.name"
                bundle="${msg}" /></label>
                </td>
                <td class="">
                      <input type="text"
                        name="childBenificiaryFullName"
                        id="childBenefitiaryName${inx}" value=""
                        class="form-control full-control "
                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                        onblur="replaceAlpha(this); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                    <span id="errchildBenefitiaryName${inx}" class="text-red"></span>
                </td>
            </tr>
            <tr id="childbenificiaryId${inx}b" class="hide">
                <td valign="middle" class="">
                    <div class="styled-select custom-select-label">
                        <select id="selectedChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedChldBenefitiaryHkidPass">
                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                        </select>
                    </div>
                </td>
                <td class="">
                      <input id="txtchildInsuHkid${inx}"
            name="childBenificiaryHkid" class="form-control textUpper full-control"
            placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
            value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtchildInsuHkid${inx}','selectChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
            class="text-red"> </span>
                </td>
            </tr>
        </tbody>
    </table>
</div> --%>
