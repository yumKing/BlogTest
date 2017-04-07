package com.blog.service;


import java.util.HashMap;
import java.util.List;

import com.blog.entity.Blog;


public interface BlogService {

	public List<Blog> listBlog(HashMap<String,Object> map);
	
	public List<Blog> getBlogData();
	
	public Blog findById(int id);
	
	public int getByTypeId(int id);
	
	public int addBlog(Blog blog);
	
	public int updateBlog(Blog blog);
	
	public int deleteById(int id);
	
	public Long getTotal();
}
