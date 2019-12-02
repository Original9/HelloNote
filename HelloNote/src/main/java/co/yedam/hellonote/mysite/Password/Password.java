package co.yedam.hellonote.mysite.Password;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Password {

	private static final Logger log = LoggerFactory.getLogger(Password.class);
	
	public static String encryptSimpleTest(String str) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("sitePw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String encStr = encryptor.encrypt(str);
		String decStr = encryptor.decrypt(encStr);
		log.debug(String.format("str : {}, encStr : {}, decStr : {}", str, encStr, decStr));
		return encStr;
	}

	public static String decryptSimpleTest(String encStr) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("sitePw");
		encryptor.setAlgorithm("PBEWithMD5AndDES");
		String decStr = encryptor.decrypt(encStr);
		log.debug(String.format("str : {}, encStr : {}, decStr : {}", encStr, decStr));
		return decStr;
	}
}