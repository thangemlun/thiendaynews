package com.thienday.controller.web;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.CategoryDTO;
import com.thienday.dto.NewsDTO;
import com.thienday.service.ICategoryService;
import com.thienday.service.INewsService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private INewsService newsService;
	
	@Autowired 
	private ICategoryService categoryService; 
	
	 @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	   public ModelAndView homePage() {
	      ModelAndView mav = new ModelAndView("web/home");
	      CategoryDTO categoryMenu = new CategoryDTO();
	      categoryMenu.setListResult(categoryService.findAllCategories());
	      NewsDTO newestNews = new NewsDTO();
	      newestNews = newsService.findNewestNews();
	      mav.addObject("newestNews",newestNews);
	      
	      //Category thanh menu
	      
	      mav.addObject("categoryMenu",categoryMenu);
	      
	      
	      //Chia category theo ô 
	    
	      
	      NewsDTO newsModelTheThao = new NewsDTO();
	      CategoryDTO categoryTheThao = new CategoryDTO();
	      categoryTheThao = categoryService.findOne((long)1);
	      newsModelTheThao.setListResult(newsService.findAll(categoryTheThao.getName()));
	      newsModelTheThao.getListResult().forEach(
	    		  (news)->news.setTimeNewsPosted(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(news.getCreatedDate())));
	      mav.addObject("categoryTheThao",categoryTheThao);
	      mav.addObject("newsModelTheThao",newsModelTheThao);
	      

	      NewsDTO newsModelChinhTri = new NewsDTO();
	      CategoryDTO categoryChinhTri = new CategoryDTO();
	      categoryChinhTri = categoryService.findOne((long)2);
	      newsModelChinhTri.setListResult(newsService.findAll(categoryChinhTri.getName()));
	      newsModelChinhTri.getListResult().forEach(
	    		  (news)->news.setTimeNewsPosted(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(news.getCreatedDate())));
	      mav.addObject("categoryChinhTri",categoryChinhTri);
	      mav.addObject("newsModelChinhTri",newsModelChinhTri);

	      NewsDTO newsModelThoiSu = new NewsDTO();
	      CategoryDTO categoryThoiSu = new CategoryDTO(); 
	      categoryThoiSu = categoryService.findOne((long)3);
	      newsModelThoiSu.setListResult(newsService.findAll(categoryThoiSu.getName()));
	      newsModelThoiSu.getListResult().forEach(
	    		  (news)->news.setTimeNewsPosted(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(news.getCreatedDate())));
	      mav.addObject("categoryThoiSu",categoryThoiSu);
	      mav.addObject("newsModelThoiSu",newsModelThoiSu);
	      
	      return mav;
	   }
	 
	 @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	   public ModelAndView logInPage() {
	      ModelAndView mav = new ModelAndView("login");
	      return mav;
	   }
	 
	 @RequestMapping(value = "/thoat", method = RequestMethod.GET)
	   public ModelAndView loOutPage(HttpServletRequest request , HttpServletResponse response ) {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
	      return new ModelAndView("redirect:/trang-chu");
	   }
	 
	 @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
		public ModelAndView accessDenied() {
			return new ModelAndView("redirect:/dang-nhap?accessDenied");
		}
}
