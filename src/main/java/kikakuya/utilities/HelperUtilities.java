package kikakuya.utilities;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.springframework.util.DigestUtils;


public class HelperUtilities {
	public static String toMd5(String data){
		return DigestUtils.md5DigestAsHex(data.getBytes());
	}
	
	public static String hashToken(String data) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(data.getBytes(StandardCharsets.UTF_8));
		return new String(hash, "UTF-8");
	}
	
	public static String newUUID() {
		return UUID.randomUUID().toString();
	}
	
	public static String capitalize(String str) {
	    String[] words = str.split(" ");
	    StringBuilder ret = new StringBuilder();
	    for(int i = 0; i < words.length; i++) {
	        ret.append(Character.toUpperCase(words[i].charAt(0)));
	        ret.append(words[i].substring(1));
	        if(i < words.length - 1) {
	            ret.append(' ');
	        }
	    }
	    return ret.toString();
	}
}
