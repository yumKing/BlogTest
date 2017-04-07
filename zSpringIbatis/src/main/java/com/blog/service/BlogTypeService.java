package com.blog.service;

import java.util.HashMap;
import java.util.List;

import com.blog.entity.BlogType;

public interface BlogTypeService {

	public int addBlogType(BlogType blogType);
	
	public int updateBlogType(BlogType blogType);
	
	public List<BlogType> listBlogType(HashMap<String,Object> map);
	
	public BlogType findById(int id);
	
	public int deleteBlogType(int id);
	
	public List<BlogType> getBlogTypeData();
	
	public Long getTotal();
}
