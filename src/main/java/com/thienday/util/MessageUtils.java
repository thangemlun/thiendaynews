package com.thienday.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtils {
	public Map<String,String> getMessage(String message){
		Map<String ,String> result = new HashMap<>();
  	  if(message.equals("update_success")){
		 result.put("message","Update success !");
		 result.put("alert","success");
	  }else if(message.equals("insert_success")){
			 result.put("message","Insert success !");
			 result.put("alert","success");
	  }else if(message.equals("error_system")){
			 result.put("message","Error system !");
			 result.put("alert","danger");
	  }else if(message.equals("delete_success")) {
		  result.put("message","Delete success !");
		  result.put("alert","success");
	  }else if(message.equals("register_success")) {
		  result.put("message","Bạn đã tạo tài khoản thành công");
		  result.put("alert","success");
	  }else if(message.equals("register_account_exist")) {
		  result.put("message","Tên tài khoản đã tồn tại !");
		  result.put("alert","danger");
	  }else if(message.equals("confirm_password_error")) {
		  result.put("message","Xác nhận mật khẩu sai !");
		  result.put("alert","danger");
	  }else if(message.equals("create_comment_error")) {
		  result.put("message","Cập nhật bình luận bị lỗi !");
		  result.put("alert","danger");
	  }else if(message.equals("create_comment_success")) {
		  result.put("message","Bình luận đã được cập nhật !");
		  result.put("alert","success");
	  }else if(message.equals("rate_news_success")) {
		  result.put("message","Đánh giá bài viết thành công !");
		  result.put("alert","success");
	  }else if(message.equals("rate_news_error")) {
		  result.put("message","Đánh giá bài viết bị lỗi !");
		  result.put("alert","danger");
	  }
  	  
		return result;
	}
}
