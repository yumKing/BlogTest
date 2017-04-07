package com.blog.controller.admin;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.ResponseUtil;

/**
 * 后台博主controller管理
 * @author jinyang
 *
 */
@Controller
@RequestMapping("/admin/blogger")
public class BloggerAdminController {

	@Resource
	BloggerService bloggerService;
	
	/**
	 * 修改博主密码
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(@RequestParam("password") String password,HttpServletResponse response) throws IOException{
		
		Blogger blogger = new Blogger();
//		String passwordMd5 = CryptographyUtil.md5(password, "javacoder");
		blogger.setPassword(password);
		
		int resultCount = bloggerService.updateBlogger(blogger);
		JSONObject result = new JSONObject();
		
		if(resultCount > 0){
			result.put("success", true);
		}
		else{
			result.put("success", false);
		}
		
		ResponseUtil.write(response, result);
		
		return null;
		
	}
	
}
