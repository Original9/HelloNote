package co.yedam.hellonote.mysite.Password;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// MySite등록시 비밀번호 DB에 암호화 시키고 사용자가 눌러서확인시엔 복호화 시키는 클래스 
public class Password {

	private static final Logger log = LoggerFactory.getLogger(Password.class);
	// 암호화
	public static String encryptSimpleTest(String str) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("sitePw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String encStr = encryptor.encrypt(str);
		log.debug(String.format("str : %s, encStr : %s", str, encStr));
		return encStr;
	}

	// 복호화
	public static String decryptSimpleTest(String encStr) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("sitePw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String decStr = encryptor.decrypt(encStr);
		//log.debug(String.format("str : %s, encStr : %s, decStr : %s", encStr, decStr));
		return decStr;
	}
}