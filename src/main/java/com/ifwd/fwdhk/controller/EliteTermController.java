package com.ifwd.fwdhk.controller;

import static com.ifwd.fwdhk.api.controller.RestServiceImpl.COMMON_HEADERS;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ifwd.fwdhk.api.controller.RestServiceDao;
import com.ifwd.fwdhk.common.document.PDFGeneration;
import com.ifwd.fwdhk.common.document.PdfAttribute;
import com.ifwd.fwdhk.model.OptionItemDesc;
import com.ifwd.fwdhk.model.savie.SavieFormApplicationBean;
import com.ifwd.fwdhk.services.SavieService;
import com.ifwd.fwdhk.util.CommonEnum.GenderEnum;
import com.ifwd.fwdhk.util.CommonUtils;
import com.ifwd.fwdhk.util.HeaderUtil;
import com.ifwd.fwdhk.util.InitApplicationMessage;
import com.ifwd.fwdhk.util.SaviePageFlowControl;
import com.ifwd.fwdhk.util.WebServiceUtils;

@Controller
public class EliteTermController extends BaseController{
	
	private final static Logger logger = LoggerFactory.getLogger(EliteTermController.class);
	
	@Autowired
	private RestServiceDao restService;
	@Autowired
	private SavieService savieService;
	@Autowired
	private CommonUtils commonUtils;

	@RequestMapping(value = {"/{lang}/elite-term/confirmation"})
	public ModelAndView getConfirmation(Model model, HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eliteterm/elite-terms-confirmation");
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/document-upload"})
	public ModelAndView getDocumentUpload(Model model, HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eliteterm/elite-terms-document-upload");
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/landing"})
	public ModelAndView getLanding(Model model, HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eliteterm/elite-terms-landing");
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/payment"})
	public ModelAndView getPayment(Model model, HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eliteterm/elite-terms-payment");
	}
	
	@RequestMapping(value = {"/{lang}/elite-term/select-plan"})
	public ModelAndView getSelectPlan(Model model, HttpServletRequest request) {
		return new ModelAndView(UserRestURIConstants.getSitePath(request)+ "eliteterm/elite-terms-select-plan");
	}
}
