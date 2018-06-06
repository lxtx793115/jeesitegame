package com.thinkgem.jeesite.common.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传类
 * @author liuzh
 * @date 2018-4-26
 */
@Controller
@RequestMapping("/file")
public class FileController {
	/**
	 * 文件上传相关代码
	 * @param file 文件
	 * @param request
	 * @param webPath 相对路径
	 * @return
	 */
    @RequestMapping(value = "upload")
    @ResponseBody
    public Map<String, Object> upload(@RequestParam(value = "file") MultipartFile file,HttpServletRequest request,
    		String webPath) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	result.put("status", "fail");
    	
        if (file.isEmpty()) {
        	result.put("message", "文件为空！");
            return result;
        }
        Map<String, String> map = new HashMap<String, String>();
        // 获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名为：" + fileName);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        System.out.println("上传的后缀名为：" + suffixName);
        //相对路径
        webPath = "\\dynamic\\" + webPath + "\\";
        // 文件上传后的路径
        String filePath = request.getSession().getServletContext().getRealPath("/") + webPath;
        // 解决中文问题，liunx下中文路径，图片显示问题
        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            map.put("url", webPath + fileName);
            map.put("path", dest.getPath());
            result.put("status", "success");
            result.put("message", "上传成功！");
            result.put("data", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    /**
     * 删除图片
     * @param name
     * @param request
     * @return
     */
	@RequestMapping(value = "/del")
	@ResponseBody
	public Map<String, Object> deleteImg(@RequestParam("name") String name, HttpServletRequest request) {

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "fail");
		result.put("massage", "删除失败");
		
		String path = request.getSession().getServletContext().getRealPath("/") + name;

		File file = new File(path);

		System.out.println("删除文件：" + file.getPath());

		try {

			if (file.isFile()) {

				file.delete();

				result.put("status", "success");
				result.put("massage", "删除成功");
				result.put("data", name);
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
