package com.thienday.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.thienday.dto.NewsDTO;
import com.thienday.service.INewsService;

@RestController(value = "NewsAPIOfAdmin" )
public class NewsAPI {
	
	@Autowired 
	private INewsService newsService;
	
	@PostMapping("/api/news")
	public NewsDTO createNews(@RequestBody NewsDTO newsDTO) {
		if(newsDTO != null)
		{
			StringBuilder result = new StringBuilder("{ " + newsDTO.getCategoryCode() + " , ");
			result.append( newsDTO.getTitle() + " , ");
			result.append( newsDTO.getShortDescription() + " , ");
			result.append( newsDTO.getContent() + " , ");
			result.append( newsDTO.getModifiedDate() + " , ");
			result.append( newsDTO.getCreatedDate() + " , ");
			result.append( newsDTO.getCreatedBy() + " , ");
			result.append( newsDTO.getModifiedBy() + " , ");
			result.append( newsDTO.getThumbnail() + " } ");
			System.out.println(result.toString());
		}
		newsService.save(newsDTO);
		return newsDTO;
	}
	
	@PutMapping("/api/news")
	public NewsDTO updateNews(@RequestBody NewsDTO newsDTO) {
		if(newsDTO != null)
		{
			StringBuilder result = new StringBuilder("{ " + newsDTO.getCategoryCode() + " , ");
			result.append( newsDTO.getTitle() + " , ");
			result.append( newsDTO.getShortDescription() + " , ");
			result.append( newsDTO.getContent() + " , ");
			result.append( newsDTO.getModifiedDate() + " , ");
			result.append( newsDTO.getCreatedDate() + " , ");
			result.append( newsDTO.getCreatedBy() + " , ");
			result.append( newsDTO.getModifiedBy() + " , ");
			result.append( newsDTO.getThumbnail() + " } ");
			System.out.println(result.toString());
		}
		newsService.save(newsDTO);
		return newsDTO;
	}
	
	@DeleteMapping("/api/news")
	public void deleteNews(@RequestBody long[] ids) {
		newsService.delete(ids);
	}
}
