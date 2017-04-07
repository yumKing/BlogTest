package com.blog.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.Blog;
import com.blog.entity.PageBean;
import com.blog.service.BlogService;
import com.blog.utils.DateJsonValueProcessor;
import com.blog.utils.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

	@Resource
	BlogService blogService;
	
	@RequestMapping("/list")
	public String listBlog(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, HttpServletResponse response)
			throws IOException {

		PageBean pb = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		HashMap<String, Object> pagelist = new HashMap<>();

		pagelist.put("start", pb.getStart());
		pagelist.put("pageSize", pb.getPageSize());

		List<Blog> listBlog = blogService.listBlog(pagelist);
		
		Long total = blogService.getTotal();

		JSONObject result = new JSONObject();
//		JSONArray arrys = new JSONArray(listBlog);
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray arrys = JSONArray.fromObject(listBlog, jsonConfig);
		
		result.put("rows", arrys);
		result.put("total", total);

		ResponseUtil.write(response, result);

		return null;
	}

	@RequestMapping("/save")
	public String saveBlog(Blog blog, HttpServletResponse response) throws IOException {

		JSONObject result = new JSONObject();

		if (blog.getId() == null) {
			blogService.addBlog(blog);
		} else {
			blogService.updateBlog(blog);
		}

		result.put("success", true);
		ResponseUtil.write(response, result);

		return null;
	}
	
	@RequestMapping("/delete")
	public String deleteBlog(@RequestParam(value="rows", required = false) String rows,HttpServletResponse response) throws IOException{
		
		String[] ids = rows.split(",");
		JSONObject result = new JSONObject();
		for(int i = 0; i < ids.length ;i++){
			blogService.deleteById(Integer.parseInt(ids[i]));
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		
		return null;
	}

}
