package com.thienday.service;

import java.util.List;
import java.util.Map;

import com.thienday.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	CategoryDTO findOne(Long id);
	List<CategoryDTO> findAllCategories();
	CategoryDTO findOneByCode(String code);
}
