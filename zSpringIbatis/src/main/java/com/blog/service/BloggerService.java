package com.blog.service;

import com.blog.entity.Blogger;

public interface BloggerService {

	public Blogger getById(int id);
	
	public Blogger getByUsername(String username);
	
	public int updateBlogger(Blogger blogger);
}
