package com.ifwd.fwdhk.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.ifwd.fwdhk.connector.response.BaseResponse;
import com.ifwd.fwdhk.connector.response.eliteterm.CreateEliteTermPolicyResponse;
import com.ifwd.fwdhk.connector.response.savieonline.GetPolicyApplicationResponse;
import com.ifwd.fwdhk.exception.ECOMMAPIException;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savieOnline.LifeBeneficaryInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifeDeclarationBean;
import com.ifwd.fwdhk.model.savieOnline.LifeEmploymentInfoBean;
import com.ifwd.fwdhk.model.savieOnline.LifePaymentBean;
import com.ifwd.fwdhk.model.savieOnline.LifePersonalDetailsBean;
import com.ifwd.fwdhk.model.savieOnline.PartnerRegisterBean;
import com.ifwd.fwdhk.model.savieOnline.SavieFnaBean;
import com.ifwd.fwdhk.model.savieOnline.SaviePlanDetailsBean;

public interface SavieOnlineService {
	public net.sf.json.JSONObject getSavieOnlinePlandetails(SaviePlanDetailsBean saviePlanDetails,HttpServletRequest request, HttpSession session) throws ECOMMAPIException;
	public void createSalesIllustrationPdf(String type,HttpServletRequest request) throws Exception;
	public void createApplicationFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception;
	public void createFnaFormPdf(String type,HttpServletRequest request,HttpSession session) throws Exception;
	public JSONObject saveProductFna(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getProductrRecommend(SavieFnaBean savieFna,HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getFna(HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject getPurchaseHistoryByPlanCode(HttpServletRequest request) throws ECOMMAPIException;
	public CreateEliteTermPolicyResponse createLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
	public BaseResponse finalizeLifePolicy(HttpServletRequest request,HttpSession session)throws ECOMMAPIException;
	public List<OptionItemDesc> getBranchCode(String value,HttpServletRequest request) throws ECOMMAPIException;
	public void lifePersonalDetailsSaveforLater(LifePersonalDetailsBean lifePersonalDetails,HttpServletRequest request) throws ECOMMAPIException;
	public void lifeEmploymentInfoSaveforLater(LifeEmploymentInfoBean lifeEmploymentInfo,HttpServletRequest request) throws ECOMMAPIException;
	public GetPolicyApplicationResponse getPolicyApplicationSaveforLater(HttpServletRequest request) throws ECOMMAPIException;
	public void lifeBeneficaryInfoSaveforLater(LifeBeneficaryInfoBean lifeBeneficaryInfo,HttpServletRequest request) throws ECOMMAPIException;
	public void lifePaymentSaveforLater(LifePaymentBean lifePayment,HttpServletRequest request) throws ECOMMAPIException;
	public void lifeDeclarationSaveforLater(LifeDeclarationBean lifeDeclaration,HttpServletRequest request) throws ECOMMAPIException;
	public void uploadSavieOnlineDocument(HttpServletRequest request)throws ECOMMAPIException, Exception;
	public BaseResponse sendImage(HttpServletRequest request,String passportFlage) throws ECOMMAPIException;
	public BaseResponse uploadSignature(HttpServletRequest request,String image)throws ECOMMAPIException;
	public void removeSavieOnlineSession(HttpServletRequest request);
	public void getTimeSlot(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void upsertAppointment(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public org.json.simple.JSONObject getAccessCode(HttpServletRequest request) throws Exception;
	public void getCustomerServiceCentre(Model model, HttpServletRequest request, HttpSession session, String appointmentTypeId) throws Exception;
	public void CustomerServiceCentreConfirmation(String action, Model model, HttpServletRequest request) throws Exception;
	public JSONObject validateSession(HttpServletRequest request) throws ECOMMAPIException;
	public void clearFna(HttpServletRequest request) throws ECOMMAPIException;
	public void sendEmailForSaveLater(HttpServletRequest request) throws ECOMMAPIException;
	public void contactCs(HttpServletRequest request) throws ECOMMAPIException;
	public JSONObject sendEmails(HttpServletRequest request, String action, JSONObject model) throws Exception;
	public void clearPolicyApplication(HttpServletRequest request) throws ECOMMAPIException;
	public String getPolicyUserName(HttpServletRequest request,String policyNumber);
	public boolean checkIsDocumentUpload(HttpServletRequest request,String policyNumber);
	public void deleteSaviePdf(HttpServletRequest request);
	public void sendEmailForDocumentUploadLater(HttpServletRequest request) throws ECOMMAPIException;
	public void partnerRegister(PartnerRegisterBean partnerRegisterDetails,HttpServletRequest request) throws ECOMMAPIException;
	public void sendMailToNewPartner(PartnerRegisterBean partnerRegisterDetails,HttpServletRequest request) throws ECOMMAPIException;
}
