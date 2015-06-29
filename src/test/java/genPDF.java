import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import org.apache.http.client.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;



public class genPDF {
	
	
	
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
		
		fillFormPA();
	}

}
