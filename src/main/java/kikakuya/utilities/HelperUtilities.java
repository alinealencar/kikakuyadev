package kikakuya.utilities;

import org.springframework.util.DigestUtils;


public class HelperUtilities {
	public static String toMd5(String data){
		String dataMd5 = DigestUtils.md5DigestAsHex(data.getBytes());
		
		return dataMd5;
	}
}
