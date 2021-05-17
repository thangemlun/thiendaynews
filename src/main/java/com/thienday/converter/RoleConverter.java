package com.thienday.converter;

import org.springframework.stereotype.Component;

import com.thienday.dto.RoleDTO;
import com.thienday.entity.RoleEntity;

@Component
public class RoleConverter  {
	
	public RoleDTO toDTO(RoleEntity entity) {
		RoleDTO result = new RoleDTO();
		result.setCode(entity.getCode());
		result.setId(entity.getId());
		result.setName(entity.getName());
		return result;
	}
	
	public RoleEntity toEntity(RoleDTO dto) {
		RoleEntity result = new RoleEntity();
		result.setCode(dto.getCode());
		result.setName(dto.getName());
		return result;
	}
}
