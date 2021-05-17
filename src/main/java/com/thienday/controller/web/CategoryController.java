package com.thienday.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.CategoryDTO;
import com.thienday.dto.NewsDTO;
import com.thienday.service.ICategoryService;
import com.thienday.service.INewsService;

@Controller(value = "categoryControllerOfWeb")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private INewsService newsService;
	
	@RequestMapping(value = "/danh-muc", method = RequestMethod.GET )
	   public ModelAndView categoryPage(@RequestParam(value = "code" ,required = false) String code,
			   @RequestParam(value = "page" ,required = false) int page,
			   @RequestParam(value = "limit" ,required = false) int limit) {
		  CategoryDTO category = new CategoryDTO();   
		  NewsDTO listNews = new NewsDTO();  
		  category = categoryService.findOneByCode(code);
		  listNews.setPage(page);
		  listNews.setLimit(limit);
		  ModelAndView mav = new ModelAndView("web/category");
		  Pageable pageable = new PageRequest(page-1, limit);
	      if(code != null) {
	    	  listNews.setListResult(newsService.findAllByCategoryCode(pageable, code));
	    	  listNews.setTotalItem(newsService.getTotalItemByCategory(code));
	    	  listNews.setTotalPage((int) Math.ceil((double) listNews.getTotalItem() / listNews.getLimit()));
	      }
	      mav.addObject("listNews",listNews);
	      mav.addObject("category",category);
	      return mav;
	   }
}
