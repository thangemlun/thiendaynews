package com.thienday.dto;

public class NewsDTO extends AbstractDTO<NewsDTO> {
	private String title;
	private String thumbnail;
	private String shortDescription;
	private String content;
	private Long categoryId;
	private String categoryCode;
	private String timeNewsPosted;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getTimeNewsPosted() {
		return timeNewsPosted;
	}
	public void setTimeNewsPosted(String timeNewsPosted) {
		this.timeNewsPosted = timeNewsPosted;
	}
}
