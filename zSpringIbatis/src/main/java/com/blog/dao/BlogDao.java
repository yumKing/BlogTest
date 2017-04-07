package com.blog.dao;

import java.util.HashMap;
import java.util.List;

import com.blog.entity.Blog;

public interface BlogDao {

	public List<Blog> getBlogData();
	
	public List<Blog> listBlog(HashMap<String,Object> map);
	
	public Blog findById(int id);
	
	public int getBlogByBlogTypeId(int id);
	
	public int addBlog(Blog blog);
	
	public int updateBlog(Blog blog);
	
	public int deleteById(int id);
	
	public Long getTotal();
}
