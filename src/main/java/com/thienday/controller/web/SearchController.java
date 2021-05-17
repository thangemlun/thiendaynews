package com.thienday.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.NewsDTO;
import com.thienday.service.INewsService;

@Controller(value = "searchControllerOfWeb")
public class SearchController {
	
	@Autowired
	private INewsService newsService;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/tim-kiem", method = RequestMethod.GET )
	   public ModelAndView searchPage(@RequestParam(value = "keyWord" ,required = false) String keyWord,
			   @RequestParam(value = "page" ,required = false) int page,
			   @RequestParam(value = "limit" ,required = false) int limit) { 
		  NewsDTO listNews = new NewsDTO();  
		  listNews.setPage(page);
		  listNews.setLimit(limit);
		  ModelAndView mav = new ModelAndView("web/search");
		  Pageable pageable = new PageRequest(page-1, limit);
	      if(keyWord != null) {
	    	  listNews.setListResult(newsService.listAll(pageable, keyWord));
	    	  listNews.setTotalItem(newsService.getTotalSearchItem(keyWord));
	    	  listNews.setTotalPage((int) Math.ceil((double) listNews.getTotalItem() / listNews.getLimit()));
	      } 
	      mav.addObject("listNews",listNews);
	      mav.addObject("keyWord",keyWord);
	      if(keyWord.equals(" ")) {
	    	  return new ModelAndView("redirect:/tim-kiem?keyWord=++&page=1&limit=3");
	      }
	      return mav;
	   }
}
