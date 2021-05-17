package com.thienday.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.thienday.dto.RateDTO;
import com.thienday.entity.NewsEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.NewsRepository;
import com.thienday.repository.UserRepository;
import com.thienday.service.IRateService;

@RestController(value = "RateAPIOfWeb")
public class RateAPI {
	
	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired 
	private IRateService rateService;
	
	@PostMapping("/api/rate")
	public RateDTO createRate(@RequestBody RateDTO model ) {
		NewsEntity news = newsRepository.findOneByTitle(model.getNewsTitle());
		UserEntity user = userRepository.findOneByUserName(model.getUserName());
		model.setNewsId(news.getId());
		model.setUserId(user.getId());
		if(model.getId() != null)
		{
			StringBuilder result = new StringBuilder("{ " + model.getRatenumber()+ " , \n ");
			result.append( model.getNewsTitle() + " , \n");
			result.append( model.getUserName()+ " , \n");
			System.out.println(result.toString());
		}
		rateService.save(model);
		return model;
	}
	
	@PutMapping("/api/rate")
	public RateDTO updateRate(@RequestBody RateDTO model ) {
		NewsEntity news = newsRepository.findOneByTitle(model.getNewsTitle());
		UserEntity user = userRepository.findOneByUserName(model.getUserName());
		model.setNewsId(news.getId());
		model.setUserId(user.getId());
		rateService.save(model);
		return model;
	}
	
}
