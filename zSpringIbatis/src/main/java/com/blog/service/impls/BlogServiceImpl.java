package com.blog.service.impls;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogDao;
import com.blog.entity.Blog;
import com.blog.service.BlogService;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Resource
	BlogDao blogDao;
	
	@Override
	public Blog findById(int id) {
		return blogDao.findById(id);
	}

	@Override
	public int getByTypeId(int id) {
		return blogDao.getBlogByBlogTypeId(id);
	}

	@Override
	public int addBlog(Blog blog) {
		return blogDao.addBlog(blog);
	}

	@Override
	public int updateBlog(Blog blog) {
		return blogDao.updateBlog(blog);
	}

	@Override
	public int deleteById(int id) {
		return blogDao.deleteById(id);
	}

	@Override
	public List<Blog> listBlog(HashMap<String,Object> map) {
		return blogDao.listBlog(map);
	}

	@Override
	public List<Blog> getBlogData() {
		return blogDao.getBlogData();
	}

	@Override
	public Long getTotal() {
		return blogDao.getTotal();
	}

}
