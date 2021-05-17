package com.thienday.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.NewsDTO;
import com.thienday.service.ICategoryService;
import com.thienday.service.INewsService;
import com.thienday.util.MessageUtils;

@Controller(value = "newsControllerOfAdmin")
public class NewsController {
	 @Autowired
	 private INewsService newsService;
	 
	 @Autowired
	 private ICategoryService categoryService;
	 
	 @Autowired
	 private MessageUtils messageUtil;
	 
	 @RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	   public ModelAndView showList(@RequestParam(value = "page") int page ,
			   						@RequestParam(value = "limit", required = false) int limit,HttpServletRequest request
			   						) {
		  NewsDTO model = new NewsDTO();
		  model.setPage(page);
	      model.setLimit(limit);
	      ModelAndView mav = new ModelAndView("admin/news/list");
	      Pageable pageable = new PageRequest(page - 1 , limit);
	    	  model.setListResult(newsService.findAll(pageable));
	    	  model.setTotalItem(newsService.getTotalItem());
	    	  model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
	      if(request.getParameter("message")!=null)
	      {
	    	 Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message",message.get("message"));
	    	 mav.addObject("alert",message.get("alert"));
	      }
	      mav.addObject("model",model);
	      return mav;
	   }
	 @RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	   public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id ,HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("admin/news/edit");
	      NewsDTO model = new NewsDTO();
	      if(id != null)
	      {
	    	  model = newsService.findById(id) ;
	      }
	      if(request.getParameter("message")!=null)
	      {
	    	 Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message",message.get("message"));
	    	 mav.addObject("alert",message.get("alert"));
	      }
	      mav.addObject("model",model);	
	      mav.addObject("categories",categoryService.findAll());
	      return mav;
	 }
	 
	 @RequestMapping(value = "/quan-tri/bai-viet/tim-kiem",method = RequestMethod.GET)
	   public ModelAndView searchNews(@RequestParam(value = "keyWord" ,required = false) String keyWord,
				  @RequestParam(value = "pageSearch" ,required = false) int page,
				  @RequestParam(value = "limitSearch" ,required = false) int limit ){
	      NewsDTO model = new NewsDTO();
	      model.setKeyWord(keyWord);
	      model.setPage(page);
	      model.setLimit(limit);
	      ModelAndView mav = new ModelAndView("admin/news/searchlist");
	      if(keyWord != null) {
	    	  Pageable pageable = new PageRequest(page - 1 , limit);
	    	  model.setListResult(newsService.listAll(pageable,keyWord));
	    	  model.setTotalItem(newsService.getTotalSearchItem(keyWord));
	    	  model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
	      }
	      mav.addObject("model",model);
	      return mav;
	 }
}
