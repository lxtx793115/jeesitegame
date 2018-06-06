package com.thinkgem.jeesite.modules.unit;

import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author chenye
 * 2018-04-01  验证工具类
 */
public final class ValidateUtils {
	public static String randomUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	public static boolean isNum(String str){
        //带小数的
        Pattern pattern = Pattern.compile("^[-+]?[0-9]+(\\.[0-9]+)?$");
        if(pattern.matcher(str).matches()){
            //数字
            return true;
        } else {
            //非数字
            return false;
        }
	}
	public static boolean isCode(String str){
        //带小数的
        Pattern pattern = Pattern.compile("^[-+]?[0-9]+(\\.[0-9]+)?$");
        if(pattern.matcher(str).matches()&&str.length()==4){
            //数字
            return true;
        } else {
            //非数字
            return false;
        }
	}
	
	/**
	 * 验证是否为字母汉字
	 * @param str
	 * @return
	 */
	public static boolean isNumLetter(String str){
        //带小数的
        Pattern pattern = Pattern.compile("[A-Za-z0-9]");
        if(pattern.matcher(str).matches()){
            //数字
            return true;
        } else {
            //非数字
            return false;
        }
	}
	public static boolean isUserName(String str){
		//4-18字母的组合，最少一个字母
		String USR_REGX = "^[\u4E00-\u9FA5A-Za-z][\u4E00-\u9FA5A-Za-z0-9]{4,18}+$";
		if((str).matches(USR_REGX)){
			//数字
			return true;
		} else {
			//非数字
			return false;
		}
	}
	public static void main(String[] args) {
		System.out.println(isUserName("A111111"));
	}
	
	/**验证是否用户名
	 * @param str
	 * @return
	 */
	public static boolean isUsername(String str){
        //带小数的
        Pattern pattern = Pattern.compile("[A-Za-z0-9]");
        if(pattern.matcher(str).matches()&&str.length()>=4&&str.length()<=18){
            //数字
            return true;
        } else {
            //非数字
            return false;
        }
	}
	/**
	 * 是否手机号
	 * @param str
	 * @return
	 */
	public static boolean isMobile(final String str) {  
	     Pattern p = null;  
	     Matcher m = null;  
	     boolean b = false;  
	     p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号  
	     m = p.matcher(str);  
	     b = m.matches();  
	     return b;  
	 }  
	/**
	 * 验证字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isNull(String str){
        if(""==str||str==null){
            return false;
        } else {
            return true;
        }
	}
	
	
}
