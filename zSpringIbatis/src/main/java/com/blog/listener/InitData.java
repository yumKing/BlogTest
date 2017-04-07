package com.blog.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.blog.entity.Blog;
import com.blog.entity.BlogType;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;


/**
 * 在tomcat服务器启动时的一系列的数据初始化,并将结果存入到application域中，等待前端页面调用
 * 
 * @author jinyang
 *
 */
@Component
public class InitData implements ServletContextListener,ApplicationContextAware{

	private static ApplicationContext applicationContext;
	
	/* 
	 * 初始化
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println(applicationContext);
		//获取servlet上下文
		ServletContext application = sce.getServletContext();
		
		/* =======================初始化BlogTypeSerivce========================= */
		//根据spring的上下文获取blogTypeService	
		BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
		List<BlogType> blogTypeData = blogTypeService.getBlogTypeData();
		//将结果存入application域中
		application.setAttribute("blogTypeList", blogTypeData);
		/* ==================================================================== */
		
		
		/* =======================初始化BloggerSerivce========================== */
		//TODO
		/* ==================================================================== */
		
		
		/* =======================初始化BlogSerivce========================== */
//		BlogService blogService = (BlogService) applicationContext.getBean("blogService");
//		List<Blog> blogData = blogService.getBlogData();
//		//将结果存入application域中
//		application.setAttribute("blogList", blogData);
		/* ==================================================================== */
		
		
		/* =======================初始化CommentSerivce========================== */
		//TODO
		/* ==================================================================== */
		
		
		/* =======================初始化LinkSerivce========================== */
		//TODO
		/* ==================================================================== */
		
	}
	
	/* 
	 * 设置全局变量applicationContext
	 */
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		InitData.applicationContext = applicationContext;
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	

	
	
}
