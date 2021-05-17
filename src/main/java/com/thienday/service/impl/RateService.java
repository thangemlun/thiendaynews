package com.thienday.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thienday.converter.RateConverter;
import com.thienday.dto.RateDTO;
import com.thienday.entity.NewsEntity;
import com.thienday.entity.RateEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.NewsRepository;
import com.thienday.repository.RateRepository;
import com.thienday.repository.UserRepository;
import com.thienday.service.IRateService;

@Service
public class RateService implements IRateService {

	@Autowired 
	private NewsRepository newsRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RateRepository rateRepository;
	
	@Autowired 
	private RateConverter rateConverter;
	
	@Override
	@Transactional
	public RateDTO save(RateDTO dto) {
		// TODO Auto-generated method stub
		RateEntity rateEntity = new RateEntity();
		NewsEntity news = new NewsEntity();
		news = newsRepository.findOne(dto.getNewsId());
		UserEntity user = new UserEntity();
		user = userRepository.findOne(dto.getUserId());
		if(dto.getId() != null) {
			RateEntity oldRate = rateRepository.findOne(dto.getId());
			rateEntity = rateConverter.toEntity(oldRate, dto);
			rateEntity.setNews(news);
			rateEntity.setUser(user);
		}else {
			rateEntity = rateConverter.toEntity(dto);
			rateEntity.setNews(news);
			rateEntity.setUser(user);		
		}
		return rateConverter.toDTO(rateRepository.save(rateEntity));
	}

	@Override
	public int getAllRatingNews(Long id) {
		// TODO Auto-generated method stub
		return (int)rateRepository.countByNewsId(id);
	}


	@Override
	public int getRatingByRateNumber(Long id, int ratenumber) {
		// TODO Auto-generated method stub
		return rateRepository.countByRateNumberAndNewsId(id, ratenumber);
	}

	@Override
	public RateDTO checkRatedUser(String username,String title) {
		RateEntity ratedUser = rateRepository.findRatedUser(username,title);
		if(ratedUser != null)
		{
			return rateConverter.toDTO(ratedUser);
		}else 
			return null ;
		
	}
	
	
	
}
