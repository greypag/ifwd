package com.ifwd.fwdhk.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.AcroFields.FieldPosition;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.RadioCheckField;


public class genPDF {
	
	
	public static String generatePdf(String inputFileName,String outputFilePath,List<PdfAttribute> attributeList) throws FileNotFoundException, DocumentException, IOException
	{
		String outFileName="";
		 RadioCheckField check;
		 
		try {
			Date dt=new Date();
			SimpleDateFormat fmt=new SimpleDateFormat("yyyyMMddHHmmssSSSS");
			outFileName = fmt.format(dt) + ".pdf";
			PdfReader reader = new PdfReader(inputFileName);
			PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(outputFilePath + outFileName));
			AcroFields form = stamper.getAcroFields();
			
			if (attributeList.size() > 0) {
				for (PdfAttribute pdfAttribute : attributeList) {
					if (!StringUtils.isEmpty(pdfAttribute.getKey())) {
						form.setField(pdfAttribute.getKey(),
								pdfAttribute.getValue());
						
						
					}
				}
			}
			stamper.setFormFlattening(true);
			stamper.close();
			reader.close();
		} catch (Exception e) {
			
		}
		return  outFileName;
	}
	
	public static String generatePdf2(String inputFileName,String outputFilePath,List<PdfAttribute> attributeList,Boolean watermark, String marker) throws FileNotFoundException, DocumentException, IOException
	{
		String outFileName="";
		
		try {
			
			outFileName = genPDF.newFiledName();
			PdfReader reader = new PdfReader(inputFileName);
			PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(outputFilePath + outFileName));
			AcroFields form = stamper.getAcroFields();
			
			if (attributeList.size() > 0) {
				for (PdfAttribute pdfAttribute : attributeList) {
					if (!StringUtils.isEmpty(pdfAttribute.getKey())) {
						if(pdfAttribute.getValue().contains(":\\")){
							
							 List<FieldPosition> pos = form.getFieldPositions(pdfAttribute.getKey());
							
							 FieldPosition p= pos.get(0);
							  Rectangle rect=p.position;
							  PdfContentByte over; 
							   try{ 
							  Image img = Image.getInstance(pdfAttribute.getValue());
							  
							    over = stamper.getOverContent(p.page);
								img.setBorder(1);
								img.setAlignment(1); //对齐方式（1为居中，0为居左，2为居右）
							float imw = img.getWidth()/rect.getWidth(); //=1/3
								float imh = img.getHeight()/rect.getHeight();// =6/9
								
								if(imw>imh)
								{
									img.scaleAbsolute(img.getWidth()/imw, img.getHeight()/imw);//控制图片大小
								}
								else
								{
									img.scaleAbsolute(img.getWidth()/imh, img.getHeight()/imh);//控制图片大小//3,9
								}
							
								//img.scaleAbsolute(rect.getWidth(), rect.getHeight());//控制图片大小
								img.setAbsolutePosition(rect.getLeft(),rect.getBottom());//控制图片位置
							

							    over.addImage(img); 
							   }catch(Exception e){
									System.out.println("没找到文件");
									continue;
								}	
						}else{
							form.setField(pdfAttribute.getKey(),
									pdfAttribute.getValue());
						}
						
						
					}
				}
			}
			stamper.setFormFlattening(true);
			if(watermark){
				int n = reader.getNumberOfPages();
				BaseFont  base = BaseFont.createFont("STSongStd-Light",
						  "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
				if (base == null || stamper == null) {return "0"; }
				// 设置透明度为0.4
			
				
				  for(int i = 1; i <= n; i++) {  
				       
					     PdfContentByte over = stamper.getOverContent(i);  
					 	Rectangle pageRect =stamper.getReader(). getPageSizeWithRotation(i);
						float x = pageRect.getWidth() / 2;
						float y = pageRect.getHeight() / 2;
					     PdfGState gs = new PdfGState();
			                gs.setFillOpacity(0.4f);// 设置透明度为0.4
			                gs.setStrokeOpacity(0.4f);
			                over.saveState();
			               over.setGState(gs);
			                over.beginText();
			               over.setColorFill(BaseColor.GRAY);
			              over.setFontAndSize(base, 60);
			                // 水印文字成45度角倾斜
			             over.showTextAligned(Element.ALIGN_CENTER ,
			                marker, x, y, 45);
			             over.endText(); 
			              
					    
					    }  
			}
			stamper.close();
			reader.close();
		} catch (Exception e) {
			
		}
		return  outFileName;
	}
	
	/*
	public static String picturePdf2(String picturePathName,String outFilePathName) throws Exception
	{
		PdfReader reader = new PdfReader( outFilePathName); 
		  int n = reader.getNumberOfPages(); 
		  Document document = new Document(reader.getPageSize(n)); 
		  float width = document.getPageSize().getWidth(); 
		  // Create a stamper that will copy the document to a new file 
		  PdfStamper stamp = new PdfStamper(reader,  
		    new FileOutputStream("D:\\temp\\text3.pdf")); 
		  PdfContentByte over; 
		  Image img = Image.getInstance(picturePathName); 
		  width = width - img.getWidth(); 
		  System.out.println("width:" + width); 
		  img.setAbsolutePosition(200, 300); 
		  img.setAlignment(Image.ALIGN_CENTER); 
		  img.scaleAbsolute(100,100);
		  if(n > 0) 
		  { 
		    // Text over the existing page 
		    over = stamp.getOverContent(n); 
		    over.addImage(img); 
		  } 
		  stamp.close(); 
		  return outFilePathName;
		} 
		
	public static String picturePdf3(String picturePathName,String outFilePathName) throws Exception
	{
		PdfReader reader = new PdfReader( outFilePathName); 
		  int n = reader.getNumberOfPages(); 
		  Document document = new Document(reader.getPageSize(n)); 
		  float width = document.getPageSize().getWidth(); 
		  // Create a stamper that will copy the document to a new file 
		  PdfStamper stamp = new PdfStamper(reader,  
		    new FileOutputStream("D:\\temp\\text5.pdf")); 
		
		  Image img = Image.getInstance(picturePathName); 
		  width = width - img.getWidth(); 
		  System.out.println("width:" + width); 
		  img.setAbsolutePosition(200, 300); 
		  img.setAlignment(Image.ALIGN_CENTER); 
		  img.scaleAbsolute(100,100);
		  for(int i = 1; i <= n; i++) {  
		       
			     PdfContentByte under = stamp.getUnderContent(i);  
			     PdfGState gs = new PdfGState();
	                gs.setFillOpacity(0.5f);// 设置透明度为0.5
	                under.setGState(gs);
			     under.addImage(img);  
			    
			    }  
		  stamp.close(); 
		  return outFilePathName;
		} 
	
	public static OutputStream generatePdf(InputStream is,List<PdfAttribute> attributeList) throws FileNotFoundException, DocumentException, IOException
	{
		OutputStream os = null;       
		
		try {
			PdfReader reader = new PdfReader(is);
	        PdfStamper stamper = new PdfStamper(reader, os);
	        AcroFields form = stamper.getAcroFields();
			if (attributeList.size() > 0) {
				for (PdfAttribute pdfAttribute : attributeList) {
					if (!StringUtils.isEmpty(pdfAttribute.getKey())) {
						form.setField(pdfAttribute.getKey(),
								pdfAttribute.getValue());
					}
				}
			}
			stamper.setFormFlattening(true);
			stamper.close();
			reader.close();
		} catch (Exception e) {
			
		}
		return  os;
	}
	public static String picturePdf4(String picturePathName,String outFilePathName) throws Exception
	{
		String path="D:\\temp\\";
		PdfReader reader = new PdfReader( outFilePathName); 
		  int n = reader.getNumberOfPages(); 
		
	 
		  // Create a stamper that will copy the document to a new file 
		  Date dt=new Date();
			SimpleDateFormat fmt=new SimpleDateFormat("yyyyMMddHHmmssSSSS");
			String outFileName = fmt.format(dt) + ".pdf";
		  PdfStamper stamp = new PdfStamper(reader,  
		    new FileOutputStream(path+outFileName)); 
		  AcroFields form = stamp.getAcroFields();  
		  List<FieldPosition> pos = form.getFieldPositions("picture1");
		  FieldPosition p= pos.get(0);
		  Rectangle rect=p.position;
		  
		  PdfContentByte over; 
		  Image img = Image.getInstance(picturePathName); 
		    over = stamp.getOverContent(p.page);
			img.setBorder(1);
			img.setAlignment(1); //对齐方式（1为居中，0为居左，2为居右）
		float imw = img.getWidth()/rect.getWidth(); //=1/3
			float imh = img.getHeight()/rect.getHeight();// =6/9
			
			if(imw>imh)
			{
				img.scaleAbsolute(img.getWidth()/imw, img.getHeight()/imw);//控制图片大小
			}
			else
			{
				img.scaleAbsolute(img.getWidth()/imh, img.getHeight()/imh);//控制图片大小//3,9
			}
		
			//img.scaleAbsolute(rect.getWidth(), rect.getHeight());//控制图片大小
			img.setAbsolutePosition(rect.getLeft(),rect.getBottom());//控制图片位置
		

		    over.addImage(img); 
		  
		  stamp.close(); 
		  return outFilePathName;
		} */
	public static String newFiledName() throws Exception{ //生成新的pdf文件名
		Date dt=new Date();
		SimpleDateFormat fmt=new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String outFileName = fmt.format(dt) + ".pdf";
		return outFileName;
	}
	public static void readFormFields(String file) throws IOException, DocumentException{
		PdfReader reader = new PdfReader(file);
		AcroFields form = reader.getAcroFields();
		Map<String, AcroFields.Item> fields = form.getFields();
		@SuppressWarnings("unused")
		int cnt = 0;
		for(Map.Entry<String, AcroFields.Item> entry : fields.entrySet()){
			System.out.println(entry.getKey());
			cnt++;
		}
	}

/*	public static String picturePdf6(String path,String oldFileName,String newFileName,String picturename) throws Exception
	{
		PdfReader reader = new PdfReader(path+oldFileName); 
		  int n = reader.getNumberOfPages(); 
		
	
		  // Create a stamper that will copy the document to a new file 
		
		  
		  PdfStamper stamp = new PdfStamper(reader,  
		    new FileOutputStream(path+newFileName)); 
		
		  Image img = Image.getInstance(picturePathName); 
		  width = width - img.getWidth(); 
		  System.out.println("width:" + width); 
		  img.setAbsolutePosition(200, 300); 
		  img.setAlignment(Image.ALIGN_CENTER); 
		  img.scaleAbsolute(100,100);
		  
		BaseFont  base = BaseFont.createFont("STSongStd-Light",
				  "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		if (base == null || stamp == null) {return "0"; }
		// 设置透明度为0.4
	
		
		  for(int i = 1; i <= n; i++) {  
		       
			     PdfContentByte under = stamp.getOverContent(i);  
			 	Rectangle pageRect =stamp.getReader(). getPageSizeWithRotation(i);
				float x = pageRect.getWidth() / 2;
				float y = pageRect.getHeight() / 2;
			     PdfGState gs = new PdfGState();
	                gs.setFillOpacity(0.4f);// 设置透明度为0.4
	                gs.setStrokeOpacity(0.4f);
	                under.saveState();
	                under.setGState(gs);
	                under.beginText();
	                under.setColorFill(BaseColor.GRAY);
	               under.setFontAndSize(base, 60);
	                // 水印文字成45度角倾斜
	              under.showTextAligned(Element.ALIGN_CENTER ,
	                "All rights reserved, copy", x, y, 45);
	              under.endText(); 
	              
			    
			    }  
		  stamp.close(); 
		  return path+newFileName;
		} 
*/
	public static void main(String[] args) throws Exception {
		List<PdfAttribute> attributeList=new ArrayList<PdfAttribute>() ;		
	attributeList.add(new PdfAttribute("applicationNo","SV2015070600001"));
	String firstname="Bruce";
	String lastname="Lee";
	attributeList.add(new PdfAttribute("englishName",firstname+" "+lastname));		
    attributeList.add(new PdfAttribute("chineseName","李小龍"));	
    attributeList.add(new PdfAttribute("hkId","A1234563"));
   
    attributeList.add(new PdfAttribute("hkId2","A1234563"));
    attributeList.add(new PdfAttribute("hkId","A1234563"));
    attributeList.add(new PdfAttribute("gender","Male"));
    attributeList.add(new PdfAttribute("birthday","1958-08-01"));
    attributeList.add(new PdfAttribute("maritalStatus","Married"));
    attributeList.add(new PdfAttribute("placeOfBirth","Hong Kong"));
    attributeList.add(new PdfAttribute("nationality","China"));
    attributeList.add(new PdfAttribute("residentialTelNo","852 28503922"));
    attributeList.add(new PdfAttribute("mobileNo","852 93886166"));
    attributeList.add(new PdfAttribute("emailAddress","bruce.lee@gmail.com"));
    attributeList.add(new PdfAttribute("residentialAdress1","1/F., FWD Financial Centre, 308 Des Voeux Rd Central, Hong Kong"));
   attributeList.add(new PdfAttribute("employmentStatus","Employee"));
   attributeList.add(new PdfAttribute("occupation","Information Technology"));
   attributeList.add(new PdfAttribute("natureOfBusiness","Insurance"));
   attributeList.add(new PdfAttribute("monthlyPersonalIncome","10,000 - 20,000"));
   attributeList.add(new PdfAttribute("singlePremiumAmount","10,000"));
   attributeList.add(new PdfAttribute("paymentPlan","Bank: HSBC Branch: Central Method: DDA"));
   attributeList.add(new PdfAttribute("englishName1","Chan Tai Man"));
   attributeList.add(new PdfAttribute("chineseName1","陳小采"));
   attributeList.add(new PdfAttribute("hkIdooo","H9534859"));
   attributeList.add(new PdfAttribute("relationship","Spouse"));
   attributeList.add(new PdfAttribute("entitlement","100%"));
   attributeList.add(new PdfAttribute("dateTime","11/02/1998"));
   attributeList.add(new PdfAttribute("expiryDate","06/07/2017"));
   attributeList.add(new PdfAttribute("RadioButton22","On"));
   attributeList.add(new PdfAttribute("RadioButton21","On"));
   attributeList.add(new PdfAttribute("bankName","0018880123456789"));
   attributeList.add(new PdfAttribute("bankNo","001"));
   attributeList.add(new PdfAttribute("branchNo","888"));
   attributeList.add(new PdfAttribute("accountNo","0123456789"));
   attributeList.add(new PdfAttribute("Sign1","D:\\template\\signe.jpg"));
   attributeList.add(new PdfAttribute("tree","D:\\template\\tree.jpg"));
	String name=generatePdf2("D:\\template\\ApplicantChi.pdf","D:\\template\\",attributeList,true,"All rights reserved, copy");
	
		/*String oldFileName="NewProposalsTemplatePA1.pdf";
		String path="D:\\temp\\";
		String newFileName=genPDF.newFiledName();
		String picturename="apple.png";
		genPDF.picturePdf4(path+picturename, path+oldFileName);*/

	}

}


/*package com.ifwd.fwdhk.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.client.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;

import com.ifwd.fwdhk.model.savie.SavieBeneficiaryBean;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;



public class genPDF {
	
	
	public static String generatePdf(String inputFileName,String outputFilePath,List<PdfAttribute> attributeList) throws FileNotFoundException, DocumentException, IOException
	{
		String outFileName="";
		
		try {
			outFileName = DateUtils.formatDate(new java.util.Date(),"yyyyMMddHHmmss") + ".pdf";
			PdfReader reader = new PdfReader(inputFileName);
			PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(outputFilePath + outFileName));
			AcroFields form = stamper.getAcroFields();
			if (attributeList.size() > 0) {
				for (PdfAttribute pdfAttribute : attributeList) {
					if (StringUtils.isNotEmpty(pdfAttribute.getKey())) {
						form.setField(pdfAttribute.getKey(),
								pdfAttribute.getValue());
					}
				}
			}
			stamper.setFormFlattening(true);
			stamper.close();
			reader.close();
		} catch (Exception e) {
			
		}
		return  outFileName;
	}
	
	public static void readFormFields(String file) throws IOException, DocumentException{
		PdfReader reader = new PdfReader(file);
		AcroFields form = reader.getAcroFields();
		Map<String, AcroFields.Item> fields = form.getFields();
		int cnt = 0;
		for(Map.Entry<String, AcroFields.Item> entry : fields.entrySet()){
			System.out.println(entry.getKey());
			//System.out.println("form.setField(\"" +entry.getKey() + "\", \"\");");
			cnt++;
		}
	}
	
    @SuppressWarnings("deprecation")
	public void fillForm(String src, String dest) throws IOException, DocumentException {
        PdfReader reader = new PdfReader(src);
        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(dest));
        AcroFields form = stamper.getAcroFields();

      
        form.setField("OwnPolicyNo", "Off");
        form.setField("OwnPolicyYes", "On");
        form.setField("IDNumberSuffix", "");
        form.setField("IDExpDateDay", "");
        form.setField("IDExpDateMonth", "");
        form.setField("IDExpDateYear", "");        
        form.setField("OccupationSuffix", "");
        form.setField("EmailAddressSuffix", "");
        form.setField("PremiumDueContinued", "Off");        
        form.setField("OwnerBankAccount", "");
        form.setField("OwnerBankName", "");
        form.setField("OwnerRekeningNo", "");        
        form.setField("PremiumDueContinued2", "On");
        form.setField("OwnerCreditCardName", "OwnerCreditCardName");
        form.setField("OwnerCreditCardBankName", "");
        form.setField("FormDeclare", "On");
        stamper.setFormFlattening(true);
        		
        stamper.close();
        reader.close();
    }	


	// file form
 	protected static void fillFormPA(InputStream is, OutputStream os) throws IOException, DocumentException {
         PdfReader reader = new PdfReader(is);
         PdfStamper stamper = new PdfStamper(reader, os);
         //BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
         //BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
         
         
         
         AcroFields form = stamper.getAcroFields();         
    
         form.setField("PolicyNumber", "PolicyNumber");
         //form.setFieldProperty("FirstName", "textfont", bf, null);
         form.setField("FirstName", "吴");   
         form.setField("LastName", "锦美");         
         form.setField("Name", "吴锦美");         
         form.setField("DATA CALON PEMEGANG POLISTERTANGGUNG", "PEMEGANG");         
       
         form.setField("GenderMale",  "Y");	// not checkbox
         form.setField("GenderFemale", "X");	// not checkbox

         
         form.setField("EmailAddress", "Jerry.JM.Wu@pccw.com");
         form.setField("EmailAddressSuffix", "");	// by default

         form.setField("FormDeclare", "On"); // checked

         stamper.setFormFlattening(true);
         		
         stamper.close();
         reader.close();
    }
    @SuppressWarnings("deprecation")
 	protected static void fillFormTerm(InputStream is, OutputStream os) throws IOException, DocumentException {
         PdfReader reader = new PdfReader(is);
         PdfStamper stamper = new PdfStamper(reader, os);
         AcroFields form = stamper.getAcroFields();
 
         form.setField("FormDeclare", "On"); 
         stamper.setFormFlattening(true);
         		
         stamper.close();
         reader.close();
    }
    
    
    public void fillFormTest() throws IOException, DocumentException{
    	String filePath = "d:\\temp\\";
		String fileName = "";
		String outputFileName = "";
		fileName = filePath + "NewProposalsTemplate.pdf";
		readFormFields(fileName);
		outputFileName = filePath + "SPAJ_" + DateUtils.formatDate(new java.util.Date(), "yyyyMMddHHmmss" ) + ".pdf";
		try{			
			fillForm(fileName, outputFileName);
		}catch(Exception ex){
			System.out.println("ex:" + ex.getMessage());
			System.out.println("ex:" + ex.toString());
		}
    }
    public static void fillFormPA() throws IOException, DocumentException{
    	String filePath = "d:\\temp\\";
		String fileName = "";
		String outputFileName = "";
		fileName = filePath + "NewProposalsTemplatePA.pdf";
		readFormFields(fileName);
		outputFileName = filePath + "SPAJ_PA_" + DateUtils.formatDate(new java.util.Date(), "yyyyMMddHHmmss" ) + ".pdf";
		try{
			InputStream is = new FileInputStream(fileName);
			OutputStream os = new FileOutputStream(outputFileName);				
			fillFormPA(is, os);
		}catch(Exception ex){
			System.out.println("ex:" + ex.getMessage());
			System.out.println("ex:" + ex.toString());
		}
    }
    public static void fillFormTerm() throws IOException, DocumentException{
    	String filePath = "d:\\temp\\";
		String fileName = "";
		String outputFileName = "";
		fileName = filePath + "NewProposalsTemplateTerm.pdf";
		readFormFields(fileName);
		outputFileName = filePath + "SPAJ_Term_" + DateUtils.formatDate(new java.util.Date(), "yyyyMMddHHmmss" ) + ".pdf";
		try{
			InputStream is = new FileInputStream(fileName);
			OutputStream os = new FileOutputStream(outputFileName);
			
			fillFormTerm(is, os);
		}catch(Exception ex){
			System.out.println("ex:" + ex.getMessage());
			System.out.println("ex:" + ex.toString());
		}
    }  

	public static void main(String[] args) throws IOException, DocumentException {
		List<PdfAttribute> attributeList=new ArrayList<PdfAttribute>() ;		
		attributeList.add(new PdfAttribute("FirstName","FirstName"));		
		generatePdf("D:\\temp\\NewProposalsTemplatePA.pdf","D:\\temp\\",attributeList);
		fillFormPA();
	}

}*/
