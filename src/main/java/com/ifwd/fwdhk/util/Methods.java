package com.ifwd.fwdhk.util;

import java.util.regex.Pattern;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.InflaterOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.List;
import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class Methods {

	private final static Logger logger = LoggerFactory.getLogger(Methods.class);
	
//	public static boolean isSimulator() {
//		return true;
//	}
//	
//	
//	
	private boolean simulator;
//	
//	
//	/* properties */
	public boolean isSimulator() {
		return simulator;
	}

	public void setSimulator(boolean simulator) {
		this.simulator = simulator;
	}
	public static boolean isXssAjax(HttpServletRequest request) {
		String referrer = request.getHeader("referer");
		logger.info(referrer);
		if (referrer != null && referrer.contains(request.getServerName())) {
			return false;
		} else {
			return true;
		}		
	}

	public static boolean  isHkid(String hkid){
		
		String strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		// basic check length
		if(hkid == null || hkid == "" || hkid.length() < 8 ){
			return false;
		}
		
		// handling bracket
		if (hkid.charAt(hkid.length()-3) == '(' && hkid.charAt(hkid.length()-1) == ')')
			hkid = hkid.substring(0, hkid.length() - 3) + hkid.charAt(hkid.length() -2);
		
		// convert to upper case
		hkid = hkid.toUpperCase();

		String hkidCharPart;
		String hkidNumPart;
		String hkidCheckDigit;
		String charPart = "";
		String numPart = "";
		String checkDigit = "";
		
		if(hkid.length() == 8){
			hkidCharPart = hkid.substring(0, 1);
			hkidNumPart = hkid.substring(1, 7);
			hkidCheckDigit = hkid.substring(7);
		
			// the character part, numeric part and check digit part
			charPart = Pattern.matches("[A-Z]", hkidCharPart) ? hkidCharPart : "" ;
			numPart = Pattern.matches("[0-9]{6}", hkidNumPart) ? hkidNumPart : "" ;
			checkDigit = Pattern.matches("[A0-9]", hkidCheckDigit) ? hkidCheckDigit : "" ;
		}
		else if(hkid.length() == 9){
			hkidCharPart = hkid.substring(0, 2);
			hkidNumPart = hkid.substring(2, 8);
			hkidCheckDigit = hkid.substring(8);
		
			// the character part, numeric part and check digit part
			charPart = Pattern.matches("[A-Z]{2}", hkidCharPart) ? hkidCharPart : "" ;
			numPart = Pattern.matches("[0-9]{6}", hkidNumPart) ? hkidNumPart : "" ;
			checkDigit = Pattern.matches("[A0-9]", hkidCheckDigit) ? hkidCheckDigit : "" ;			
		}		
//		logger.error("charPart = " + charPart);
//		logger.error("numPart = " + numPart);
//		logger.error("checkDigit = " + checkDigit);
		
		if(charPart == "" || numPart == "" || checkDigit == "")
			return false;
				
      	// calculate the checksum for character part
		int checkSum = 0;
      	if (charPart.length() == 2) {
      		checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
      		checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
      	} else {
      		checkSum += 9 * 36;
      		checkSum += 8 * (10 + strValidChars.indexOf(charPart));
      	}      	
      	
      	// calculate the checksum for numeric part
      	for (int i = 0, j = 7; i < numPart.length(); i++, j--)
      		checkSum += j * Integer.parseInt(String.valueOf(numPart.charAt(i)));
		
      	// verify the check digit
      	int remaining = checkSum % 11;
      	Integer verify = remaining == 0 ? 0 : 11 - remaining;
      	
      	//logger.error("verify = " + verify + ", checkDigit = " + checkDigit);
      	
      	return ((verify.toString().compareTo(checkDigit) == 0) || (verify == 10 && checkDigit.compareTo("A") == 0 ));
      				
	}	
	
	
	
	
	/* encryption and decryption */
	public static String encryptStr(String message) throws Exception {
		byte[] encryptedByte =  Methods.encrypt(message);
		return new sun.misc.BASE64Encoder().encode(encryptedByte);
	}
    public static byte[] encrypt(String message) throws Exception {
        final MessageDigest md = MessageDigest.getInstance("md5");
        final byte[] digestOfPassword = md.digest("HG58YZ3CR9"
                                        .getBytes("utf-8"));
        final byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
        for (int j = 0, k = 16; j < 8;) {
                        keyBytes[k++] = keyBytes[j++];
        }

        final SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        final IvParameterSpec iv = new IvParameterSpec(new byte[8]);
        final Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key, iv);

        final byte[] plainTextBytes = message.getBytes("utf-8");
        final byte[] cipherText = cipher.doFinal(plainTextBytes);
        // final String encodedCipherText = new sun.misc.BASE64Encoder()
        // .encode(cipherText);

        return cipherText;
    }

    public static String decryptStr(String message) throws Exception{
    	final byte[] decBtye = new sun.misc.BASE64Decoder().decodeBuffer(message);
    	return decrypt(decBtye);
    }
    public static String decrypt(byte[] message) throws Exception {
        final MessageDigest md = MessageDigest.getInstance("md5");
        final byte[] digestOfPassword = md.digest("HG58YZ3CR9"
                                        .getBytes("utf-8"));
        final byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
        for (int j = 0, k = 16; j < 8;) {
                        keyBytes[k++] = keyBytes[j++];
        }

        final SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        final IvParameterSpec iv = new IvParameterSpec(new byte[8]);
        final Cipher decipher = Cipher.getInstance("DESede/CBC/PKCS5Padding");
        decipher.init(Cipher.DECRYPT_MODE, key, iv);

        // final byte[] encData = new
        // sun.misc.BASE64Decoder().decodeBuffer(message);
        final byte[] plainText = decipher.doFinal(message);

        return new String(plainText, "UTF-8");
    }

	
    public static String toGiBooleanOptIn(Boolean bln){
    	if(bln == null)
    		return null;
    	else{
    		if(bln)
    			return "N";	//opposite value against UI for optIn
    		else
    			return "Y";	//opposite value against UI for optIn
    	}
    		
    }
    
    
    public static <T> boolean isNullOrEmpty(List<T> lst){
    	if(lst != null && !lst.isEmpty())
    		return false;
    	else
    		return true;
    }
    
    public static String customFormat(String pattern, String value ) {
        DecimalFormat myFormatter = new DecimalFormat(pattern);
        String output = myFormatter.format(value);
        
        return output;
     }
    

    public static String encodeBase64File(String path) throws Exception {
        File  file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int)file.length()];
        inputFile.read(buffer);
        inputFile.close();
        return new sun.misc.BASE64Encoder().encode(buffer);
    }

    public static void decoderBase64File(String base64Code,String targetPath) throws Exception {
        byte[] buffer = new sun.misc.BASE64Decoder().decodeBuffer(base64Code);
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();
    }
    
    public static void toFile(String base64Code,String targetPath) throws Exception {
        byte[] buffer = base64Code.getBytes();
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();
    }


    public static String file2String(File file) throws Exception{  
        StringBuffer sb = new StringBuffer();  
        FileInputStream in = new FileInputStream(file);  
        int b;  
        char ch;  
        while((b=in.read())!=-1){  
            ch = (char)b;  
            sb.append(ch);  
        }  
        in.close();  
        String oldString = new String(sb);  
          
        String newString = compressData(oldString);  
          
        return newString;  
    }  
      

    public static File string2File(String oldString,String filePath) throws Exception{  
        File file = new File(filePath);  
        if(file.exists()){  
            System.out.println("file exist");  
            return null;  
        }else{  
            file.createNewFile();  
        }  
        FileOutputStream out = new FileOutputStream(file);  
          
        String newString = decompressData(oldString);  
          
        char[] str = newString.toCharArray();  
        for(char ch:str){  
            byte b = (byte)ch;  
            out.write(b);  
        }  
        out.close();  
        return file;  
    }  
      

    public static String compressData(String data) {  
        try {  
            ByteArrayOutputStream bos = new ByteArrayOutputStream();  
            DeflaterOutputStream zos = new DeflaterOutputStream(bos);  
            zos.write(data.getBytes());  
            zos.close();  
            return new String(getenBASE64inCodec(bos.toByteArray()));  
        } catch (Exception ex) {  
            ex.printStackTrace();  
            return "ZIP_ERR";  
        }  
    }  
    

    public static String decompressData(String encdata) {  
        try {  
            ByteArrayOutputStream bos = new ByteArrayOutputStream();  
            InflaterOutputStream zos = new InflaterOutputStream(bos);  
            zos.write(getdeBASE64inCodec(encdata));   
            zos.close();  
            return new String(bos.toByteArray());  
        } catch (Exception ex) {  
            ex.printStackTrace();  
            return "UNZIP_ERR";  
        }  
    }  
      

    public static String getenBASE64inCodec(byte [] b) {  
        if (b == null)  
            return null;  
        return new String((new Base64()).encode(b));  
    }  
      

    public static byte[] getdeBASE64inCodec(String s) {  
        if (s == null)  
            return null;  
        return new Base64().decode(s.getBytes());  
    }  
    
    public static String formatMobile(String mobile) {
    	mobile = mobile.replace("+", "").replace("(", "").replace(") ", "").replace(")", "").trim();
    	String str = mobile.replace(" ", "");
    	if(str.length()==11 && str.indexOf("852")==0){
    		mobile = mobile.substring(3).trim();
    	}
		return mobile;
    	
    }
}


/*
@Test  
public void testStringBase64() throws Exception{  
    String str = "hello";  
    String oldStr = Base64UTIL.compressData(str);  
    String newStr = Base64UTIL.decompressData(oldStr);  
    System.out.println("base64 source：："+str);  
    System.out.println("base64 compress：："+oldStr);  
    System.out.println("base64 decompress：："+newStr);  
}  
  

@Test  
public void testFileBase64() throws Exception{  
    File oldFile = new File("/home/samforit/Pictures/321.doc");   
    String comStr = Base64UTIL.file2String(oldFile);  
    System.out.println(comStr);  
    File newFile = Base64UTIL.string2File(comStr, "/home/samforit/Pictures/123.doc");  
}  
*/
