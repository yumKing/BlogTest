package com.blog.controller.admin;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.BlogType;
import com.blog.entity.PageBean;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import com.blog.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {

	@Resource
	BlogTypeService blogTypeService;
	
	@Resource
	BlogService blogService;
	
	@RequestMapping("/all")
	public String getBlogType(HttpServletResponse response) throws IOException{
		
		List<BlogType> blogTypeList = blogTypeService.getBlogTypeData();
		
		HashMap<String,Object> result = new HashMap<>();
		
		if(blogTypeList == null){
			result.put("success", false);
		}else{
			result.put("blogTypeList", blogTypeList);
			result.put("success", true);
		}
		
		ResponseUtil.write(response, result);
		
		return null;
	}
	
	
	/**
	 * 分页查询
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/list")
	public String listBlogType( @RequestParam(value="page",required=false) String page,
								@RequestParam(value="rows",required=false) String rows,
								HttpServletResponse response) throws IOException{
		
		PageBean pb = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		HashMap<String,Object> pagelist = new HashMap<>();
		
		pagelist.put("start",pb.getStart());
		pagelist.put("pageSize", pb.getPageSize());
		
		List<BlogType> listBlogType = blogTypeService.listBlogType(pagelist);
		Long total = blogTypeService.getTotal();
		
		JSONObject result = new JSONObject();
		JSONArray arrys = new  JSONArray(listBlogType);
		result.put("rows", arrys);
		result.put("total", total);
		
		ResponseUtil.write(response, result);
		
		return null;
	}
	
	@RequestMapping("/save")
	public String saveBlogType(BlogType blogType,HttpServletResponse response) throws IOException{
		
		int resultNum = 0;
		
		if(blogType.getId() == null){
			resultNum = blogTypeService.addBlogType(blogType);
		}else{
			resultNum = blogTypeService.updateBlogType(blogType);
		}
		
		JSONObject result = new JSONObject();
		
		if(resultNum > 0){
			result.put("success", true);
		}else{
			result.put("success",false);
		}
		
		ResponseUtil.write(response, result);
		
		return null;
	}
	
	@RequestMapping("/delete")
	public String deleteBlogType(@RequestParam(value="ids" , required = false) String ids,HttpServletResponse response) throws IOException{
		
		String[] idstr = ids.split(",");
		
		JSONObject result = new JSONObject();
		for(int i = 0;i<idstr.length;i++){
			//因为博客和分类相关连，要删除分类，必须先删博客
			if(blogService.getByTypeId(Integer.parseInt(idstr[i])) > 0){
				result.put("exist", "该类别下有博客,不能删除");
			}
			else{
				blogTypeService.deleteBlogType(Integer.parseInt(idstr[i]));
			}
			
			result.put("success", true);
			
			ResponseUtil.write(response, result);
		}
		
		
		return null;
	}
	
}
