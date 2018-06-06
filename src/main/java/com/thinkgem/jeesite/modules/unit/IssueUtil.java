package com.thinkgem.jeesite.modules.unit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class IssueUtil {
	
	public static String getIssue(String [] args) {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");//如2016-08-10 20:40  
		Date olddate=new Date(118, 4, 20, 0, 0, 0);
		Date nowdate=new Date();		
		String fromDate = simpleFormat.format(olddate);  
		String toDate = simpleFormat.format(nowdate);  
		try {
			long from= simpleFormat.parse(fromDate).getTime();
			long to  = simpleFormat.parse(toDate).getTime();  
			int days = (int) ((to - from)/(1000 * 60 * 60 * 24));  
			int s = (int) ((to - from)/(1000 ));  
			System.out.println(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		return null;
	}
	public static void main(String[] args) {
		getIssue(null);
		//timer1();
	}
	public static void timer1() {
	   Timer timer = new Timer();
	     timer.schedule(new TimerTask() {
	       public void run() {
	    	   timer1();
	           System.out.println("-------设定要指定任务--------");
	       }
	     }, 1000);// 设定指定的时间time,此处为2000毫秒
	   }
}
