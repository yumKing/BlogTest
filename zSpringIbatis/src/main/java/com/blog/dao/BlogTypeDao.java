package com.blog.dao;

import java.util.HashMap;
import java.util.List;

import com.blog.entity.BlogType;

public interface BlogTypeDao {

	public List<BlogType> getBlogTypeData();
	
	public List<BlogType> listBlogType(HashMap<String,Object> map);
	
	public BlogType findById(int id);
	
	public int addBlogType(BlogType blogType);
	
	public int updateBlogType(BlogType blogType);
	
	public int deleteById(int id);
	
	public Long getTotal();
	
}
