package com.ifwd.fwdhk.util;

import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.ifwd.fwdhk.controller.UserRestURIConstants;



public class EncryptionUtils {
	
	public static String APP_ID = UserRestURIConstants.APP_ID;//"5302428092";
	
	private final static String KEY_MAC = "HmacSHA512";
	
	private final static String PUBLIC_KEY = UserRestURIConstants.PUBLIC_KEY;//"MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAhIC0IfCJMuKjQGNn5RNl5PTfkJexbL0S6BCMLz9xnHJNugZl5Es4Q7WZBD3yZRadIMgl5f/bhX+0qxOzUZW3j4lc/4Y0qWxkHJUD1q4ACB2caI0IZIOc557wIPVrclBpsV4sThWBuiCn2USUHEHjPLGGRvTKhX7VKzqOyDi2xm1VMj/EMtSiWdBFCISMKX4CSBLAzoNWAKx9wUiFVv3nYM8rNxRujE0Pn8kjk40tA4DhwFJa5cPz6i+/Jk87+Vrq6vcHIJD89cCppzPcLIJy0ZSOm8N6J3oZxEKCLq8TMcGewszMgaC/+RoGT6PK4iCV7FsT7f//0JfXZEjono6W9ADWxZY8E+ML1RomNqgOCB8OndaJd8Ko5kKlGraodHmbSl9sUHLQ0RnglRq3QkhbZjDCQwKl/apq51448bdDYHm5zJVinBlQf8ant9/Y6EZLCN3aklMnXuZL3+8D3NoZm3xJpu/ZO1ZyVVqc5+T1ZoHEOkWAz5MsgT2LQdxOi2HtzA6Du5WIeR2P8FRSJe2RNpQsKOE47pexvfVRxJGaRiA+xcN1/ZsEl0HpvVJ3OlvM98Gp6Lb+ibJDoe5mXkLOLV5jkWp4QSi88rq/Pqfx2Uy4nLXrvbQs10zhSEGWmZT5/8daAwgE7j+qFb/hBvxXWy34LQ5ndlxvSKbFOirRY+8CAwEAAQ==";
	
	private final static String API_KEI=UserRestURIConstants.API_KEI;//"mBPboCOJ/HITwkNRd9iCWuXxZbgbLqQlHhHNs4dY/yJB0YnL3chyqiUWUHuz88Rj7AC7i2wCZyC98hJs1jFZnQ==";
	
	public static String encryptByRSA(String source) throws Exception{
		System.out.println("source:\n"+source);
    	PublicKey key = null;
        KeyFactory e = KeyFactory.getInstance("RSA");
        X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(PUBLIC_KEY));
        key = e.generatePublic(publicKeySpec);

        Cipher rsa = Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding", "SunJCE");
        rsa.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedByte = rsa.doFinal(source.getBytes());

        Base64 base64 = new Base64(0, (byte[])null, false);
        String encryptedBase64String = base64.encodeToString(encryptedByte);
        System.out.println("RSA encrypted:\n" + encryptedBase64String);
        return encryptedBase64String;
    }
	
	
	public static String encryptByHMACSHA512(String source) {
		System.out.println("source:\n"+source);
		String result = "";
		byte[] bytesKey = API_KEI.getBytes();
		final SecretKeySpec secretKey = new SecretKeySpec(bytesKey, KEY_MAC);
		try {
			Mac mac = Mac.getInstance(KEY_MAC);
			mac.init(secretKey);
			final byte[] macData = mac.doFinal(source.getBytes());
			//byte[] hex = new Hex().encode(macData);
			//result = new String(hex, "ISO-8859-1");
			result=Base64.encodeBase64String(macData);
			System.out.println("HMACSHA512 encrypted:\n" + result);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		}
		return result;
	}

	
}