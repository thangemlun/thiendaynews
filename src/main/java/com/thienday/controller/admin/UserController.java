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

import com.thienday.dto.UserDTO;
import com.thienday.service.IRoleService;
import com.thienday.service.IUserService;
import com.thienday.util.MessageUtils;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	
	 @Autowired
	 private IUserService userService;
	 
	 @Autowired
	 private IRoleService roleService;
	 
	 @Autowired
	 private MessageUtils messageUtil;
	 
	 @RequestMapping(value = "/quan-tri/nguoi-dung/danh-sach", method = RequestMethod.GET)
	   public ModelAndView showList(@RequestParam(value = "page") int page ,
			   						@RequestParam(value = "limit", required = false) int limit,HttpServletRequest request
			   						) {
		  UserDTO model = new UserDTO();
		  model.setPage(page);
	      model.setLimit(limit);
	      ModelAndView mav = new ModelAndView("admin/user/list");
	      Pageable pageable = new PageRequest(page - 1 , limit);
	    	  model.setListResult(userService.findAll(pageable));
	    	  model.setTotalItem(userService.getTotalItem());
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
	 @RequestMapping(value = "/quan-tri/nguoi-dung/chinh-sua", method = RequestMethod.GET)
	   public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id ,HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("admin/user/edit");
	      UserDTO model = new UserDTO();
	      if(id != null)
	      {
	    	  model = userService.findById(id) ;
	      }
	      if(request.getParameter("message")!=null)
	      {
	    	 Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
	    	 mav.addObject("message",message.get("message"));
	    	 mav.addObject("alert",message.get("alert"));
	      }
	      mav.addObject("model",model);
	      mav.addObject("roles",roleService.findAll());
	      return mav;
	 }
	 
	 @RequestMapping(value = "/quan-tri/nguoi-dung/tim-kiem",method = RequestMethod.GET)
	   public ModelAndView searchNews(@RequestParam(value = "keyWord" ,required = false) String keyWord,
			   						  @RequestParam(value = "pageSearch" ,required = false) int page,
			   						  @RequestParam(value = "limitSearch" ,required = false) int limit){
	      UserDTO model = new UserDTO();
	      model.setKeyWord(keyWord);
	      model.setPage(page);
	      model.setLimit(limit);
	      ModelAndView mav = new ModelAndView("admin/user/searchlist");
	      if(keyWord != null) {
	    	  Pageable pageable = new PageRequest(page - 1 , limit);
	    	  model.setListResult(userService.listAll(pageable,keyWord));
	    	  model.setTotalItem(userService.getTotalSearchItem(keyWord));
	    	  model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
	      }
	      mav.addObject("model",model);
	      return mav;
	 }
	 
	 
	 
}
