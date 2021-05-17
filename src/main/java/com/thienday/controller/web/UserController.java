package com.thienday.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.UserDTO;
import com.thienday.service.IUserService;
import com.thienday.util.ConvertStringUtils;
import com.thienday.util.MessageUtils;

@Controller(value = "userControllerOfWeb")
public class UserController {
	
	@Autowired 
	private IUserService userService;
	
	@Autowired
	private MessageUtils messageUtil;
	
	@Autowired
	private ConvertStringUtils convertString;
	
	private boolean isUserExisted = false;
	
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	   public ModelAndView registerPage(HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("register");
	      if(request.getParameter("message")!=null)
	      {
	    	  Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
		      mav.addObject("message",message.get("message"));
		      mav.addObject("alert",message.get("alert"));
	      }
	      return mav;
	   }
	 
	 @RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	   public ModelAndView checkRegisterPage(@RequestParam(value = "userName" ,required = false) String userName,
			   @RequestParam(value = "fullName" ,required = false) String fullName,
			   @RequestParam(value = "password",required = false) String password,
			   @RequestParam(value = "passwordConfirm" ,required = false) String passwordConfirm,
			   @RequestParam(value = "status" ,required = false) Integer status,
			   @RequestParam(value = "roleId" ,required = false) Long roleId
			   ,HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView("register");
	      UserDTO model = new UserDTO();
	      if(userName != null)
	      {
	    	  model.setUserName(userName);
	    	  this.isUserExisted = userService.isUserExist(model.getUserName());
	    	  if(isUserExisted == true)
			  {
	    		
			   	return new ModelAndView("redirect:/dang-ky?message=register_account_exist"); 	 
			  }
	    	  else if(isUserExisted == false && password.equals(passwordConfirm) ) {
		    	  model.setFullName(convertString.encodeString(fullName));
		    	  model.setPassword(BCrypt.hashpw(convertString.encodeString(password), BCrypt.gensalt(10)));
		    	  model.setStatus(status);
		    	  model.setRoleId(roleId);
		    	  userService.save(model);	    	  
		      return new ModelAndView("redirect:/dang-ky?message=register_success");
		      }
	    	  else {
	    		  
		    	  return new ModelAndView("redirect:/dang-ky?message=confirm_password_error");
		      }
	      }
	      return mav;
	   }
}
