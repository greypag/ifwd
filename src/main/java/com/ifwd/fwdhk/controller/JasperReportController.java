package com.ifwd.fwdhk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.ifwd.fwdhk.controller.UserRestURIConstants;
import com.ifwd.fwdhk.model.Person;

@SuppressWarnings("deprecation")
@Controller
public class JasperReportController {
	
	
	
	@RequestMapping(value="reportpdf" , method = RequestMethod.GET)
	public String process(HttpServletRequest request)	throws Exception {
		
		
		String websiteroot=UserRestURIConstants.getProperties("website.root");
		String reportType=request.getParameter("reportType");
		String templatefile = "";
		String outputpath = "";
		String sql ="";
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = null;
		db = dbf.newDocumentBuilder();
		Document doc = null;
		doc = db.parse(websiteroot+"/config/ReportTemplateConfig.xml");
		Element root = doc.getDocumentElement();
		NodeList xmls = root.getElementsByTagName("template");
		for (int i = 0; i < xmls.getLength(); i++) {
			Element element=(Element)xmls.item(i);
			String id = element.getAttribute("id");  //获得ID属性
			if(id.equalsIgnoreCase(reportType))
			{	
				NodeList templatefileList = element.getElementsByTagName("templatefile");
				Element templatefileElement = (Element)templatefileList.item(0);
				templatefile = templatefileElement.getFirstChild().getNodeValue();
				
				NodeList outputpathList = element.getElementsByTagName("outputpath");
				Element outputpathElement = (Element)outputpathList.item(0);
				outputpath = outputpathElement.getFirstChild().getNodeValue();
				
				NodeList sqlList = element.getElementsByTagName("sql");
				Element sqlElement = (Element)sqlList.item(0);
				sql = sqlElement.getFirstChild().getNodeValue();
				break;
			}		
		}	

		HttpSession session = request.getSession();
		List<Person> list = new ArrayList<Person>();

		list.add(new Person("Lily", "female", 22, "臺灣", "10086"));
		list.add(new Person("Macro", "male", 33, "北京", "13800000000"));
		list.add(new Person("Andy", "male", 44, "HongKong", "13812345678"));
		list.add(new Person("Linder", "female", 28, "Guangxi", "18677778888"));
		list.add(new Person("Jessie", "female", 26, "Gansu", "18219177720"));
		
		String fileName =genPDFFile(reportType, templatefile, outputpath, sql, list, request);
		
		
		session.setAttribute("PDFNAME", fileName);
		session.setAttribute("reportType", reportType);
		return UserRestURIConstants.getSitePath(request) + "download";
	}
	
	
	@SuppressWarnings("rawtypes")
	public static String genPDFFile(String reportType, String templatefile,String outputpath,String sql, List mapList,HttpServletRequest request) throws JRException, SAXException, IOException, ParserConfigurationException {
				
		
		JasperReport jasperReport;
		JasperPrint jasperPrint;		

		try {
			String FileName="";
			FileName=templatefile;
			File file = new File(FileName);
			//如果jasper文件不存在，就调用jrxml文件编译生成
			//JasperCompileManager.compileReportToFile(String sourceFileName, String destFileName)
//			if (!file.exists()) {
//				JasperCompileManager.compileReportToFile(path + "/"+ reportName + ".jrxml",path + "/"+ reportName + ".jasper");
//			}
			jasperReport = (JasperReport) JRLoader.loadObject(file);
			
			JRDataSource dataSource  = new JRBeanCollectionDataSource(mapList);
			//此处为关键，将对象列表设为数据源			
			jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource);
			//因模版上没有传入参数，所以此处第二个参数为空
			String fileName = reportType+"_"+GetFileName()+".pdf";		
			File fi = new File(outputpath);
			if(!fi.exists()){
				fi.mkdir();
			}
			//生成方法1
			JRPdfExporter exporter = new JRPdfExporter();
			exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRPdfExporterParameter.CHARACTER_ENCODING,"UTF-8");
			exporter.setParameter(JRPdfExporterParameter.OUTPUT_FILE_NAME, outputpath+"/"+fileName);
			//注意此处用的不是JRPdfExporterParameter.OUTPUT_FILE，要用这个，还需新建File
			exporter.exportReport();
			
			//生成方法2
			try {					
				JasperExportManager.exportReportToPdfFile(jasperPrint,outputpath+"/"+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return fileName;
		}catch(JRException e){
			e.printStackTrace();			
			throw new JRException(e);
		}
	}
	

	
	@RequestMapping(value="/download" , method = RequestMethod.GET)
	public void downloadPdfFile(HttpServletRequest request,HttpServletResponse response,@RequestParam(required = true)String fileName) throws IOException, ParserConfigurationException, SAXException{
		
		String websiteroot=UserRestURIConstants.getProperties("website.root");
		String reportType=request.getParameter("reportType");
		String templatefile = "";
		String outputpath = "";
		String sql ="";
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = null;
		db = dbf.newDocumentBuilder();
		Document doc = null;
		doc = db.parse(websiteroot+"/config/ReportTemplateConfig.xml");
		Element root = doc.getDocumentElement();
		NodeList xmls = root.getElementsByTagName("template");
		for (int i = 0; i < xmls.getLength(); i++) {
			Element element=(Element)xmls.item(i);
			String id = element.getAttribute("id");  //获得ID属性
			if(id.equalsIgnoreCase(reportType))
			{				
				NodeList outputpathList = element.getElementsByTagName("outputpath");
				Element outputpathElement = (Element)outputpathList.item(0);
				outputpath = outputpathElement.getFirstChild().getNodeValue();
				break;
			}
		}	
		
		InputStream is;
		if(fileName.startsWith("http")){
			URL url = null; 
			url = new URL(fileName); 
			URLConnection conn = url.openConnection();
			is=conn.getInputStream();
			String[] strs = fileName.split("/");
			fileName = strs[strs.length-1];
		}
		else
		{
			is = new FileInputStream(outputpath+fileName);			
		}
		
		response.setContentType("application/pdf");
		//response.setHeader("Location",fileName);
		response.setHeader("Content-Disposition","attachment; filename=\""+ fileName + "\"");
		response.setHeader("Cache-Control", "private");	
		IOUtils.copy(is , response.getOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		
	}
	
	
	public static String GetFileName()
	{
		java.util.Date dt=new java.util.Date();
		SimpleDateFormat fmt=new SimpleDateFormat("YYYYMMddHHmmssSSSS");
		String ndt=fmt.format(dt);
		return ndt;
	}

	
}
