package com.ifwd.fwdhk.util;

import java.util.regex.Pattern;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.InflaterOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

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
    
    /**
     * <p>将文件转成base64 字符串</p>
     * @param path 文件路径
     * @return
     * @throws Exception
     */
    public static String encodeBase64File(String path) throws Exception {
        File  file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int)file.length()];
        inputFile.read(buffer);
        inputFile.close();
        return new sun.misc.BASE64Encoder().encode(buffer);
    }
    /**
     * <p>将base64字符解码保存文件</p>
     * @param base64Code
     * @param targetPath
     * @throws Exception
     */
    public static void decoderBase64File(String base64Code,String targetPath) throws Exception {
        byte[] buffer = new sun.misc.BASE64Decoder().decodeBuffer(base64Code);
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();
    }
    /**
     * <p>将base64字符保存文本文件</p>
     * @param base64Code
     * @param targetPath
     * @throws Exception
     */ 
    
    public static void toFile(String base64Code,String targetPath) throws Exception {
        byte[] buffer = base64Code.getBytes();
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();
    }

    /** 
     * 对文件进行编码 
     * @param file 需要编码的问家 
     * @return 对文件进行base64编码后的字符串 
     * @throws Exception 
     */  
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
        //将buffer转化为string  
        String oldString = new String(sb);  
          
        //使用base64编码  
        String newString = compressData(oldString);  
          
        return newString;  
    }  
      
    /** 
     * 对文件进行解码 
     * @param oldString 需要解码的字符串 
     * @param filePath  将字符串解码到filepath文件路径 
     * @return  返回解码后得到的文件 
     * @throws Exception 
     */  
    public static File string2File(String oldString,String filePath) throws Exception{  
        File file = new File(filePath);  
        if(file.exists()){  
            System.out.println("文件已经存在，不能将base64编码转换为文件");  
            return null;  
        }else{  
            file.createNewFile();  
        }  
        FileOutputStream out = new FileOutputStream(file);  
          
        //对oldString进行解码  
        String newString = decompressData(oldString);  
          
        //将问件内容转为byte[]  
        char[] str = newString.toCharArray();  
        for(char ch:str){  
            byte b = (byte)ch;  
            out.write(b);  
        }  
        out.close();  
        return file;  
    }  
      
    /** 
     * 使用base64编码字符串 
     * @param data 
     * @return 编码后的字符串 
     */  
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
    
    /** 
     * 使用base64解码字符串 
     * @param encdata 
     * @return 解码后的字符串 
     */  
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
      
      
    /** 
     * 调用apache的编码方法 
     */  
    public static String getenBASE64inCodec(byte [] b) {  
        if (b == null)  
            return null;  
        return new String((new Base64()).encode(b));  
    }  
      
    /** 
     * 调用apache的解码方法 
     */  
    public static byte[] getdeBASE64inCodec(String s) {  
        if (s == null)  
            return null;  
        return new Base64().decode(s.getBytes());  
    }  
    
    
}


/*//base64字符串测试  
@Test  
public void testStringBase64() throws Exception{  
    String str = "我们都是中国人";  
    String oldStr = Base64UTIL.compressData(str);  
    String newStr = Base64UTIL.decompressData(oldStr);  
    System.out.println("base64原串：："+str);  
    System.out.println("base64编码：："+oldStr);  
    System.out.println("base64解码：："+newStr);  
}  
  
//base64文件测试  
@Test  
public void testFileBase64() throws Exception{  
    File oldFile = new File("/home/samforit/Pictures/321.doc");   
    String comStr = Base64UTIL.file2String(oldFile);  
    System.out.println(comStr);  
    File newFile = Base64UTIL.string2File(comStr, "/home/samforit/Pictures/123.doc");  
}  */
