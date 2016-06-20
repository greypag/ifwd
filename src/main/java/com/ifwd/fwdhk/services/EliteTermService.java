package com.ifwd.fwdhk.services;

import javax.servlet.http.HttpServletRequest;

import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.GetEliteTermPremiumResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.eliteterm.EliteTermPlanDetailBean;

public interface EliteTermService {
	public CreateEliteTermPolicyResponse createEliteTermPolicy(HttpServletRequest request)throws ECOMMAPIException;
	public GetEliteTermPremiumResponse getEliteTermPremium(EliteTermPlanDetailBean etPlanDetail,HttpServletRequest request)throws ECOMMAPIException;
	public BaseResponse sendImage(HttpServletRequest request,String passportFlage) throws ECOMMAPIException;
	public BaseResponse finalizeEliteTermPolicy(HttpServletRequest request,String policyNo)throws ECOMMAPIException;
	public BaseResponse getUploadedDocument(HttpServletRequest request)throws ECOMMAPIException;
	public BaseResponse contactCs(HttpServletRequest request)throws ECOMMAPIException;
	public BaseResponse setEliteTermPolicyAgentEmail(HttpServletRequest request)throws ECOMMAPIException;
	public BaseResponse uploadSignature(HttpServletRequest request,String image,String policyNo)throws ECOMMAPIException;
	public BaseResponse sendEliteTermMail(HttpServletRequest request)throws ECOMMAPIException;
	public void putEtPlanOptionSession(HttpServletRequest request)throws ECOMMAPIException;
	public void putEtPaymentSession(HttpServletRequest request)throws ECOMMAPIException;
	public BaseResponse getPromoteCode(HttpServletRequest request)throws ECOMMAPIException;
	public void uploadEliteTermDocuments(HttpServletRequest request)throws ECOMMAPIException;
	public String getPolicyUserName(HttpServletRequest request,String policyNumber);
	public boolean checkIsDocumentUpload(HttpServletRequest request,String policyNumber);
	public void removeEtSession(HttpServletRequest request)throws ECOMMAPIException;
	public void putEtPageKeySession(HttpServletRequest request)throws ECOMMAPIException;
	public void putPersonalInfoSession(HttpServletRequest request)throws ECOMMAPIException;
	public void putEmploymentInfoSession(HttpServletRequest request)throws ECOMMAPIException;
	public void putBeneficiaryInfoSession(HttpServletRequest request)throws ECOMMAPIException;
	public void putDeclarationSession(HttpServletRequest request)throws ECOMMAPIException;
	
}
