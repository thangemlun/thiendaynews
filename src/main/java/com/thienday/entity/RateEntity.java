package com.thienday.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rate")
public class RateEntity extends BaseEntity {
	
	@Column(name = "ratenumber")
	private Integer rateNumber ;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "news_id")
	private NewsEntity news ;

	public Integer getRateNumber() {
		return rateNumber;
	}

	public void setRateNumber(Integer rateNumber) {
		this.rateNumber = rateNumber;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public NewsEntity getNews() {
		return news;
	}

	public void setNews(NewsEntity news) {
		this.news = news;
	}
	
	
	
}
