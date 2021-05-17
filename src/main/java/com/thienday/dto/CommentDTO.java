package com.thienday.dto;

import java.util.ArrayList;
import java.util.List;

public class CommentDTO extends AbstractDTO<CommentDTO> {
	
	private String content ;
	private String newsTitle;
	private Long newsId ;
	private Long userId ;
	private String userName;
	private String userRole;
	private Long repliedCommentId;
	private int countRepliedComments;
	private String timeCommentPosted;
	
	public List<CommentDTO> listRepliedComment = new ArrayList<>(); 
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public Long getNewsId() {
		return newsId;
	}
	public void setNewsId(Long newsId) {
		this.newsId = newsId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getRepliedCommentId() {
		return repliedCommentId;
	}
	public void setRepliedCommentId(Long repliedCommentId) {
		this.repliedCommentId = repliedCommentId;
	}
	public List<CommentDTO> getListRepliedComment() {
		return listRepliedComment;
	}
	public void setListRepliedComment(List<CommentDTO> listRepliedComment) {
		this.listRepliedComment = listRepliedComment;
	}
	public int getCountRepliedComments() {
		return countRepliedComments;
	}
	public void setCountRepliedComments(int countRepliedComments) {
		this.countRepliedComments = countRepliedComments;
	}	
	public String getTimeCommentPosted() {
		return timeCommentPosted;
	}
	public void setTimeCommentPosted(String timeCommentPosted) {
		this.timeCommentPosted = timeCommentPosted;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

}
