package until;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;


public class encrypt {
	public static String toSHA1(String str) {
		String salt = "ijuhgytjkmcbvj'@'fkđodlfju//=-sdw";
		String result = null;

		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest mDigest = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(mDigest.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(toSHA1("123456"));
	}
}
