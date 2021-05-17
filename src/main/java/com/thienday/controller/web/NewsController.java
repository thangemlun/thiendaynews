package com.thienday.controller.web;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thienday.dto.CategoryDTO;
import com.thienday.dto.CommentDTO;
import com.thienday.dto.NewsDTO;
import com.thienday.dto.RateDTO;
import com.thienday.dto.UserDTO;
import com.thienday.service.ICategoryService;
import com.thienday.service.ICommentService;
import com.thienday.service.INewsService;
import com.thienday.service.IRateService;
import com.thienday.service.IRoleService;
import com.thienday.service.IUserService;
import com.thienday.util.MessageUtils;
import com.thienday.util.SecurityUtils;

@Controller(value = "newsControllerOfWeb")
public class NewsController {
	
	@Autowired
	private MessageUtils messageUtil;
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired 
	private IRateService rateService;
	
	private int pageNow ;
	
	
	
	@RequestMapping(value = "/bai-viet", method = RequestMethod.GET )
	   public ModelAndView newsPage(@RequestParam(value = "title" ,required = false) String title,
			   @RequestParam(value = "page") int page,
			   @RequestParam(value = "limit" ,required = false) int limit,
			   HttpServletRequest request,
			   Authentication authentication) {
	      ModelAndView mav = new ModelAndView("web/news");
	      
	      // Phần Model bài viết .
	      
	      NewsDTO model = new NewsDTO();
	      CategoryDTO category = new CategoryDTO();
	      UserDTO author = new UserDTO();
	      category.setListResult(categoryService.findAllCategories());
	      model = newsService.findByTitle(title);
	      String createdTime = new SimpleDateFormat("MM/dd/yyyy HH:mm").format(model.getCreatedDate());
	      author = userService.findByUserName(model.getModifiedBy());
	      this.pageNow = page ;
	      
	      //Phần Comment 
	      CommentDTO commentDTO = new CommentDTO();
	      if(model.getId()!= null)
	      {
	    	  
		      commentDTO.setNewsId(model.getId());
		      commentDTO.setPage(page);
		      commentDTO.setLimit(limit);
		      Pageable pageable = new PageRequest(page - 1, limit);
		      commentDTO.setListResult(commentService.findAll(pageable,commentDTO.getNewsId()));
		      commentDTO.setTotalItem(commentService.getTotalItem(commentDTO.getNewsId()));
		      commentDTO.setTotalPage((int)Math.ceil((double)commentDTO.getTotalItem()/commentDTO.getLimit()));
		      commentDTO.getListResult().forEach(
		    		  (comment)->comment.setListRepliedComment(commentService.listRepliedComment(comment.getId()))
		    		  );
		      commentDTO.getListResult().forEach(
		    		  (comment)->comment.setCountRepliedComments(commentService.countRepliedComments(comment.getId()))
		    		  );
		      commentDTO.getListResult().forEach(
		    		  (comment)->comment.setTimeCommentPosted(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(comment.getCreatedDate()))
		    		  );
		      commentDTO.getListResult().forEach(
		    		  (comment)->comment.getListRepliedComment().forEach(
		    				  (reply) -> reply.setTimeCommentPosted(new SimpleDateFormat("yyyy/MM/dd HH:mm").format(reply.getCreatedDate()))
		    				  )
		    		  );
		      commentDTO.getListResult().forEach(
		    		  (comment) -> comment.setUserRole(roleService.findOneByRoleId(userService.findByUserName(comment.getUserName()).getRoleId()).getCode())
		    		  );
		      
		      
	      }
	      //Phần xử lí thông báo 
	      
	      if(request.getParameter("message")!=null)
	      {
	    	  Map<String,String> message = messageUtil.getMessage(request.getParameter("message"));
		      mav.addObject("message",message.get("message"));
		      mav.addObject("alert",message.get("alert"));
	      }
	      
	      // Phần xử lí Rating .
	      
	      RateDTO rate = new RateDTO();
	      
	      if(model.getId()!= null)
	      {
		      rate.setAllRateNumber(rateService.getAllRatingNews(model.getId()));
		      rate.setRating5Number(rateService.getRatingByRateNumber(model.getId(), 5));
		      rate.setRating4Number(rateService.getRatingByRateNumber(model.getId(), 4));
		      rate.setRating3Number(rateService.getRatingByRateNumber(model.getId(), 3));
		      rate.setRating2Number(rateService.getRatingByRateNumber(model.getId(), 2));
		      rate.setRating1Number(rateService.getRatingByRateNumber(model.getId(), 1));
		      rate.setPerCent5Star(((int)Math.ceil((double)rate.getRating5Number()/rate.getAllRateNumber() * 100)));
		      rate.setPerCent4Star(((int)Math.ceil((double)rate.getRating4Number()/rate.getAllRateNumber() * 100)));
		      rate.setPerCent3Star(((int)Math.ceil((double)rate.getRating3Number()/rate.getAllRateNumber() * 100)));
		      rate.setPerCent2Star(((int)Math.ceil((double)rate.getRating2Number()/rate.getAllRateNumber() * 100)));
		      rate.setPerCent1Star(((int)Math.ceil((double)rate.getRating1Number()/rate.getAllRateNumber() * 100)));
	      }
	      RateDTO ratedUser = new RateDTO();
	      int checkRatedUser = 0  ;
	      if(authentication != null) {
	    	  String userNameInSession = getUserNameInSession(authentication);
	    	  if( rateService.checkRatedUser(userNameInSession,model.getTitle()) != null)
		      {
	    		  ratedUser = rateService.checkRatedUser(userNameInSession, model.getTitle());
		    	  checkRatedUser = 1 ;
		      }
	      }
	      
	      
	      //model ra views
	      mav.addObject("model",model);
	      mav.addObject("createdDate",createdTime);
	      mav.addObject("author",author.getFullName());
	      mav.addObject("categories",category.getListResult());
	      mav.addObject("listComment",commentDTO);
	      mav.addObject("rate",rate);
	      mav.addObject("isRatedUser",checkRatedUser);
	      mav.addObject("ratedUser",ratedUser);
	      mav.addObject("pagenow",this.pageNow);
	      return mav;   
	   }
	
	
	private String getUserNameInSession(Authentication authentication ) {
		String username = null ;
		username = SecurityUtils.getPrincipal().getUserName();
		return username ;
	}
	
}
