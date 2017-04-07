package com.blog.service.impls;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BloggerDao;
import com.blog.entity.Blogger;
import com.blog.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

	@Resource
	private BloggerDao bloggerDao;
	
	/* 
	 * 通过id查询blogger信息
	 */
	@Override
	public Blogger getById(int id) {
		return bloggerDao.getById(id);
	}

	/* 
	 * 通过用户名查询blogger信息
	 */
	@Override
	public Blogger getByUsername(String username) {
		return bloggerDao.getByUsername(username);
	}

	/* 
	 * 更新blogger信息
	 */
	@Override
	public int updateBlogger(Blogger blogger) {
		return bloggerDao.updateBlogger(blogger);
	}
	

}
