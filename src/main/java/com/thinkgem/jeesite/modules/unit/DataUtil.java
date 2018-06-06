package com.thinkgem.jeesite.modules.unit;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

//import com.alibaba.fastjson.JSONObject;

public class DataUtil {

	public static void main(String[] args) {
          //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
          //System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
          Map<String,String> map=getDate();
          System.out.println(map);
	}
	
	public static Map<String,String> getDate() {
		//获取加拿大28数据
        JSONObject jsonObject= httpRequest("http://e.apiplus.net/newly.do?token=t07b32eda9745e4c4k&code=cakeno&format=json", "GET");
        //System.out.println("jsonObject:"+jsonObject);
        Map map=new HashMap();
        if(jsonObject==null) {
        	System.out.println("null");
        	map.put("status", "fail!");
        	return map;
        }
        String data=jsonObject.getString("data");
        //所有数据
        JSONArray ja=JSONArray.parseArray(data);
        //最近一组数据
        JSONObject first =(JSONObject) ja.get(0);
        //开奖号码opencode 字符串  01,09,12,13,20,24,27,30,45,46,47,49,51,55,56,59,62,69,76,79
        String opencode=first.getString("opencode");
        String[] code= opencode.split(",");
        //取2/5/8/11/14/17开奖号码相加的末尾数最为开奖号码第一个数字
        Integer one=Integer.parseInt(code[1])+Integer.parseInt(code[4])+Integer.parseInt(code[7])+Integer.parseInt(code[10])+Integer.parseInt(code[13])+Integer.parseInt(code[16]);
        Integer onelast=one%10;
        //取3/6/9/12/15/18开奖号码相加的末尾数最为开奖号码第一个数字
        Integer two=Integer.parseInt(code[2])+Integer.parseInt(code[5])+Integer.parseInt(code[8])+Integer.parseInt(code[11])+Integer.parseInt(code[14])+Integer.parseInt(code[17]);
        Integer twolast=two%10;
        //取4/7/10/13/16/19/开奖号码相加的末尾数最为开奖号码第一个数字
        Integer three=Integer.parseInt(code[3])+Integer.parseInt(code[6])+Integer.parseInt(code[9])+Integer.parseInt(code[12])+Integer.parseInt(code[15])+Integer.parseInt(code[18]);
        Integer threelast=three%10;
        map.put("status", "success!");
        map.put("result", onelast+twolast+threelast);
        map.put("resultcode", onelast+"+"+twolast+"+"+threelast);
        return map;
	}
	public static JSONObject httpRequest(String requestUrl, String requestMethod) {
        JSONObject jsonObject = null;
        StringBuffer buffer = new StringBuffer();
        try {
            URL url = new URL(requestUrl);
            // http协议传输
            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
            httpUrlConn.setDoOutput(true);
            httpUrlConn.setDoInput(true);
            httpUrlConn.setUseCaches(false);
            // 设置请求方式（GET/POST）
            httpUrlConn.setRequestMethod(requestMethod);

           // if ("GET".equalsIgnoreCase(requestMethod))
                httpUrlConn.connect();
            // 将返回的输入流转换成字符串
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            // 释放资源
            inputStream.close();
            inputStream = null;
            httpUrlConn.disconnect();
            //System.out.println("all:"+buffer);
            //jsonObject = JSONObject.fromObject(buffer.toString());
            jsonObject = JSONObject.parseObject(buffer.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return jsonObject;
    }
}
