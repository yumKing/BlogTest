package com.blog.controller.admin;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {

	@Resource
	BloggerService bloggerService;
	
	@RequestMapping("/refreshSystemCache")
	public String refreshSystemCache(HttpServletRequest request,HttpServletResponse response) throws IOException{
		@SuppressWarnings("deprecation")
		ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
		
		//获取博主信息
		Blogger blogger = bloggerService.getById(1);
		blogger.setPassword(null);
		application.setAttribute("blogger", blogger);
		
		
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 退出博客后台
	 */
	@RequestMapping("/logout")
	public String logout(){
		SecurityUtils.getSubject().logout();
		return "redirect:/login.jsp";
	}
	
}
