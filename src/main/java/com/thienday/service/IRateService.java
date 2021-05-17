package com.thienday.service;

import com.thienday.dto.RateDTO;

public interface IRateService {
	RateDTO save(RateDTO dto);
	int getAllRatingNews(Long id);
	int getRatingByRateNumber(Long id , int ratenumber);
	RateDTO checkRatedUser(String username,String title);
	
}
