package co.yedam.hellonote.user.password;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Password {

	private static final Logger log = LoggerFactory.getLogger(Password.class);
	// 암호화
	public static String encryptSimpleTest(String str) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("pw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String encStr = encryptor.encrypt(str);
		log.debug(String.format("str : %s, encStr : %s", str, encStr));
		return encStr;
	}

	// 복호화
	public static String decryptSimpleTest(String encStr) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("pw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String decStr = encryptor.decrypt(encStr);
		//log.debug(String.format("str : %s, encStr : %s, decStr : %s", encStr, decStr));
		return decStr;
	}
}