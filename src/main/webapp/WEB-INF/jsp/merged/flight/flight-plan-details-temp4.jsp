<%-- <div id="childtraveller">
    <h4 class="color1 margin-left-28">
        <fmt:message key="flight.details.insured.label.family.others"
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
                        type="text" name="otherName" id="txtOtherFullName${inx}"
                        value="" class="form-control full-control "
                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                        onblur="replaceAlpha(this); validateName('txtOtherFullName${inx}','errtxtOtherFullName${inx}',false,'insured');"
                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                    <span id="errtxtOtherFullName${inx}" class="text-red"></span>
                </td>
            </tr>
            <tr>
                <td valign="middle" class="">
                    <label class="bold-500"><fmt:message
                            key="flight.details.applicant.hkid"
                            bundle="${msg}" /></label>
                    <div class="styled-select custom-select-label">
                        <select id="selectedOtherHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherHkidPass">
                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                        </select>
                    </div>
                </td>
                <td class="">
                     <input
                    id="txtOtherInsuHkid${inx}" name="otherHKID"
                    class="form-control textUpper full-control"
                    placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherInsuHkid${inx}','selectedOtherHkidPass${inx}','errtxtOtherInsuHkid${inx}',false,'insured');"/><span id="errtxtOtherInsuHkid${inx}"
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
                        selectables="${mapAgeType}"
                        valueElmId="selectOtherAgeRange${inx}"
                        valueElmName="otherAgeRange"
                    />
                    <div class="styled-select">
                    <select name="otherAgeRange" class="form-control soflow select-label"
                        id="selectOtherAgeRange${inx}">
                        <c:forEach var="ageList" items="${mapAgeType}">
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
                    </select></div> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
                </td>
            </tr>
            <tr>
                <td valign="middle" class="">
                     <label class="bold-500"><fmt:message
                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                </td>
                <td class="">
                     <div class="styled-select">
                    <select id="otherSelectBenificiary${inx}"
                        name="otherBeneficiary"
                        onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
                        class="form-control soflow select-label">
                        <option value="SE"><fmt:message
                                key="flight.details.insured.beneficiary.default"
                                bundle="${msg}" /></option>
                        <c:forEach var="relationshipCodeList"
                            items="${mapRelationshipCode}">
                            <option value="${relationshipCodeList.key}"><c:out
                                    value="${relationshipCodeList.value}" /></option>
                        </c:forEach>
                    </select></div> <span id="benificiary" style="display: none"> <label
                        style="color: red">Beneficiary which is blank</label>
                    </span>
                </td>
            </tr>
            <tr id="otherbenificiaryId${inx}" class="hide">
                <td valign="middle" class="">
                     <label class="bold-500"><fmt:message
                    key="flight.details.insured.beneficiary.name"
                    bundle="${msg}" /></label>
                </td>
                <td class="">
                      <input type="text"
                        name="otherBenificiaryFullName"
                        id="otherBenefitiaryName${inx}" value=""
                        class="form-control full-control "
                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                        onblur="replaceAlpha(this); validateName('otherBenefitiaryName${inx}','errotherBenefitiaryName${inx}',false,'beneficiary');"
                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                    <span id="errotherBenefitiaryName${inx}" class="text-red"></span>
                </td>
            </tr>
            <tr id="otherbenificiaryId${inx}b" class="hide">
                <td valign="middle" class="">
                    <div class="styled-select custom-select-label">
                        <select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherBenefitiaryHkidPass">
                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                        </select>
                    </div>
                </td>
                <td class="">
                      <input id="txtOtherBenInsuHkid${inx}"
                    name="otherBenificiaryHkid" class="form-control textUpper full-control"
                    placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherBenInsuHkid${inx}','selectOtherBenefitiaryHkidPass${inx}','errtxtOtherBenInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtOtherBenInsuHkid${inx}"
                    class="text-red"> </span>
                </td>
            </tr>
        </tbody>
    </table>
</div> --%>
