package com.thinkgem.jeesite.modules.unit;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5工具类
 * 
 * @author wangmiao
 * @date 2014-10-15
 */
public class MD5Util {
	// 十六进制下数字到字符的映射数组
	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/** 对字符串进行MD5加密 */
	public static String md5(String s) {
		if (s != null && !s.isEmpty()) {
			try {
				// 创建具有指定算法名称的信息摘要
				MessageDigest md = MessageDigest.getInstance("MD5");
				// 使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
				byte[] results = md.digest(s.getBytes("UTF-8"));
				// 将得到的字节数组变成字符串返回
				return byteArrayToHexString(results);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	public static String getRKey() {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA");
			return String.format("%s%s%s",
			/**/byteArrayToHexString(md.digest(UUIDUtils.randomUUID().getBytes())),
			/**/byteArrayToHexString(md.digest(UUIDUtils.randomUUID().getBytes())),
			/**/byteArrayToHexString(md.digest(UUIDUtils.randomUUID().getBytes())));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}

	/** 对字节数组进行MD5加密 */
	public static String md5(byte[] s) {
		if (s != null && s.length > 0) {
			try {
				// 创建具有指定算法名称的信息摘要
				MessageDigest md = MessageDigest.getInstance("MD5");
				// 使用指定的字节数组对摘要进行最后更新，然后完成摘要计算
				byte[] results = md.digest(s);
				// 将得到的字节数组变成字符串返回
				return byteArrayToHexString(results);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	public static String md5(String s, String salt) {
		return md5(s.concat(salt));
	}

	/**
	 * 转换字节数组为十六进制字符串
	 * 
	 * @param 字节数组
	 * @return 十六进制字符串
	 */
	private static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	/** 将一个字节转化成十六进制形式的字符串 */
	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
}
