package com.thienday.converter;

import org.springframework.stereotype.Component;

import com.thienday.dto.CategoryDTO;
import com.thienday.entity.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDTO(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		result.setCode(entity.getCode());
		result.setName(entity.getName());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity result = new CategoryEntity();
		result.setName(dto.getName());
		result.setCode(dto.getCode());
		return result;
	}
}
