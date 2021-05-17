package com.thienday.dto;

public class RateDTO extends AbstractDTO<RateDTO> {
	
	private Integer ratenumber ;
	private String newsTitle;
	private String userName;
	private Long newsId ;
	private Long userId ;
	private Integer allRateNumber;
	private Integer rating5Number;
	private Integer rating4Number;
	private Integer rating3Number;
	private Integer rating2Number;
	private Integer rating1Number;
	private Integer perCent5Star;
	private Integer perCent4Star;
	private Integer perCent3Star;
	private Integer perCent2Star;
	private Integer perCent1Star;
	

	public Integer getRatenumber() {
		return ratenumber;
	}
	public void setRatenumber(Integer ratenumber) {
		this.ratenumber = ratenumber;
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
	public Integer getAllRateNumber() {
		return allRateNumber;
	}
	public void setAllRateNumber(Integer allRateNumber) {
		this.allRateNumber = allRateNumber;
	}
	
	public Integer getRating5Number() {
		return rating5Number;
	}
	public void setRating5Number(Integer rating5Number) {
		this.rating5Number = rating5Number;
	}
	public Integer getRating4Number() {
		return rating4Number;
	}
	public void setRating4Number(Integer rating4Number) {
		this.rating4Number = rating4Number;
	}
	public Integer getRating3Number() {
		return rating3Number;
	}
	public void setRating3Number(Integer rating3Number) {
		this.rating3Number = rating3Number;
	}
	public Integer getRating2Number() {
		return rating2Number;
	}
	public void setRating2Number(Integer rating2Number) {
		this.rating2Number = rating2Number;
	}
	public Integer getRating1Number() {
		return rating1Number;
	}
	public void setRating1Number(Integer rating1Number) {
		this.rating1Number = rating1Number;
	}
	public Integer getPerCent5Star() {
		return perCent5Star;
	}
	public void setPerCent5Star(Integer perCent5Star) {
		this.perCent5Star = perCent5Star;
	}
	public Integer getPerCent4Star() {
		return perCent4Star;
	}
	public void setPerCent4Star(Integer perCent4Star) {
		this.perCent4Star = perCent4Star;
	}
	public Integer getPerCent3Star() {
		return perCent3Star;
	}
	public void setPerCent3Star(Integer perCent3Star) {
		this.perCent3Star = perCent3Star;
	}
	public Integer getPerCent2Star() {
		return perCent2Star;
	}
	public void setPerCent2Star(Integer perCent2Star) {
		this.perCent2Star = perCent2Star;
	}
	public Integer getPerCent1Star() {
		return perCent1Star;
	}
	public void setPerCent1Star(Integer perCent1Star) {
		this.perCent1Star = perCent1Star;
	}
	
}
