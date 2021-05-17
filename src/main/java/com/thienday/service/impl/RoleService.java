package com.thienday.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thienday.converter.RoleConverter;
import com.thienday.dto.RoleDTO;
import com.thienday.entity.RoleEntity;
import com.thienday.repository.RoleRepository;
import com.thienday.service.IRoleService;

@Service
public class RoleService implements IRoleService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private RoleConverter roleConverter;
	
	@Override
	public Map<Long, String> findAll() {
		Map<Long,String> result = new HashMap<>();
		List<RoleEntity> entities = roleRepository.findAll();
		for(RoleEntity item : entities) {
			result.put(item.getId(), item.getName());
		}
		return result;
	}

	@Override
	public RoleDTO findOneByRoleId(Long id) {
		RoleEntity role = roleRepository.findOne(id);
		return roleConverter.toDTO(role);
	}
	
}
