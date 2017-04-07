package com.blog.dao;


import com.blog.entity.Blogger;

public interface BloggerDao {

	public Blogger getById(int id);
	
	public Blogger getByUsername(String username);
	
	public int updateBlogger(Blogger blogger);
}
