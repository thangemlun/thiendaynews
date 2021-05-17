package com.thienday.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.thienday.dto.UserDTO;
import com.thienday.entity.RoleEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.RoleRepository;

@Component
public class UserConverter {
	@Autowired
	private RoleRepository roleRepository;
	
	public UserDTO toDTO(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setId(entity.getId());
		result.setUserName(entity.getUserName());
		result.setFullName(entity.getFullName());
		result.setPassword(entity.getPassword());
		result.setStatus(entity.getStatus());
		entity.getRoles().forEach(
				(role)->result.setRoleId(role.getId())
				);
		return result;
	}
//	BCrypt.hashpw(entity.getPassword(), BCrypt.gensalt(12))
	
	public UserEntity toEntity(UserDTO dto) {
		List<RoleEntity>roles = new ArrayList<>();
		RoleEntity role = roleRepository.findOne(dto.getRoleId());
		roles.add(role);
		UserEntity result = new UserEntity();
		result.setFullName(dto.getFullName());
		result.setPassword(dto.getPassword());
		result.setStatus(dto.getStatus());
		result.setUserName(dto.getUserName());
		result.setRoles(roles);
		return result;
	}
	
	public UserEntity toEntity(UserEntity result ,UserDTO userDTO ) {
		List<RoleEntity>roles = new ArrayList<>();
		RoleEntity role = roleRepository.findOne(userDTO.getRoleId());
		roles.add(role);
		result.setFullName(userDTO.getFullName());
		result.setPassword(userDTO.getPassword());
		result.setUserName(userDTO.getUserName());
		result.setStatus(userDTO.getStatus());
		result.setRoles(roles);
		return result;
	}
}
