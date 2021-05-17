package com.thienday.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thienday.converter.CategoryConverter;
import com.thienday.dto.CategoryDTO;
import com.thienday.entity.CategoryEntity;
import com.thienday.repository.CategoryRepository;
import com.thienday.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {
	
	@Autowired 
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity item : entities)
		{
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

	@Override
	public CategoryDTO findOne(Long id) {
		CategoryEntity categoryEntity = categoryRepository.findOne((long)id);
		return categoryConverter.toDTO(categoryEntity);
	}

	@Override
	public List<CategoryDTO> findAllCategories() {
		List<CategoryEntity> entities = categoryRepository.findAll();
		List<CategoryDTO> models = new ArrayList<>();
		for(CategoryEntity item : entities ) {
			CategoryDTO categoryDTO = categoryConverter.toDTO(item);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	public CategoryDTO findOneByCode(String code) {
		CategoryEntity entity = categoryRepository.findOneByCode(code);
		return categoryConverter.toDTO(entity) ;
	}
}
