package com.thienday.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.thienday.dto.NewsDTO;

public interface INewsService {
	List<NewsDTO> findAll(Pageable pageable);
	int getTotalItem();
	NewsDTO findById(Long id);
	NewsDTO save(NewsDTO newsDTO);
	void delete(long[] ids);
	int getTotalSearchItem(String keyWord);
	List<NewsDTO> listAll(Pageable pageable ,String keyword);
	NewsDTO findByTitle(String title);
	NewsDTO findNewestNews();
	List<NewsDTO> findAll(String name);
	int getTotalItemByCategory(String code);
	List<NewsDTO> findAllByCategoryCode(Pageable pageable,String code);
}	
