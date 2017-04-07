package com.blog.service.impls;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogTypeDao;
import com.blog.entity.BlogType;
import com.blog.service.BlogTypeService;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

	@Resource
	BlogTypeDao blogTypeDao;

	@Override
	public List<BlogType> listBlogType(HashMap<String,Object> map) {
		return blogTypeDao.listBlogType(map);
	}

	@Override
	public int deleteBlogType(int id) {
		return blogTypeDao.deleteById(id);
	}

	@Override
	public int addBlogType(BlogType blogType) {
		return blogTypeDao.addBlogType(blogType);
	}

	@Override
	public int updateBlogType(BlogType blogType) {
		return blogTypeDao.updateBlogType(blogType);
	}

	@Override
	public List<BlogType> getBlogTypeData() {
		return blogTypeDao.getBlogTypeData();
	}

	@Override
	public Long getTotal() {
		return blogTypeDao.getTotal();
	}

	@Override
	public BlogType findById(int id) {
		return blogTypeDao.findById(id);
	}

}
