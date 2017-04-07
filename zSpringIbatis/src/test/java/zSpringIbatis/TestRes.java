package zSpringIbatis;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;

public class TestRes {

	private ApplicationContext ac ;
	
	@Resource
	BloggerService bloggerService;
	
	
	@Test
	public void test1(){
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		bloggerService = (BloggerService) ac.getBean("bloggerService");
		Blogger result = bloggerService.getById(1);
		System.out.println(result.getUserName()+"=="+result.getPassword());
		System.out.println("===");
	}
}
