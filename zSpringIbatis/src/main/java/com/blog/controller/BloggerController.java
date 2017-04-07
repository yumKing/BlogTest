package com.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.CryptographyUtil;

/**
 * @descrption 博主controller前台，不需要认证
 * @author jinyang
 *
 */
@Controller
@RequestMapping("/blogger")
public class BloggerController {

	@Resource
	private BloggerService bloggerService;
	
	@RequestMapping("/login")
	public String login(Blogger blogger,HttpServletRequest request){
		/*Blogger bloggerSel = bloggerService.selectBloggerById(1);
		System.out.println(bloggerSel.getUserName()+"===="+bloggerSel.getPassword());
		if(bloggerSel.getUserName().equals(blogger.getUserName()) && bloggerSel.getPassword().equals(blogger.getPassword())){
			return "index";
		}
		else{
			return "login";
		}*/
		
		Subject subject = SecurityUtils.getSubject();//获取当前登录的主体
		String newPassword = CryptographyUtil.md5(blogger.getPassword(), "javacoder");//密码MD5加密
		System.out.println("加密后的密码："+newPassword);//暂时不将加密内容写入
		//将用户信息封装到token
		UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUserName(),blogger.getPassword());
		try{
			subject.login(token);//会调用MyRealm中的doGetAuthenticationInfo方法进行认证
			return "redirect:/admin/main.jsp";
		}catch(AuthenticationException e){
//			e.printStackTrace();
			request.setAttribute("blogger", blogger);
			request.setAttribute("errorInfo", "用户名或密码错误");
			return "login";
		}
		
	}
}
