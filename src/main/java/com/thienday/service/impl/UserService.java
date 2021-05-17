package com.thienday.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thienday.converter.UserConverter;
import com.thienday.dto.UserDTO;
import com.thienday.entity.RoleEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.RoleRepository;
import com.thienday.repository.UserRepository;
import com.thienday.service.IUserService;

@Service
public class UserService implements IUserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserConverter userConverter;
	
	@Override
	public List<UserDTO> findAll(Pageable pageable) {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll(pageable).getContent() ;
		for(UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDTO(item);
			models.add(userDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int)userRepository.count();
	}

	@Override
	public UserDTO findById(Long id) {
		UserEntity userEntity = userRepository.findOne(id);
		return userConverter.toDTO(userEntity);
	}

	@Override
	@Transactional
	public UserDTO save(UserDTO userDTO) {
		List<RoleEntity> roles = new ArrayList<>();
		RoleEntity roleEntity = roleRepository.findOne(userDTO.getRoleId());
		UserEntity userEntity = new UserEntity();
		if(userDTO.getId() != null)
		{
			UserEntity oldUser = userRepository.findOne(userDTO.getId());
			roles.add(roleEntity);
			oldUser.setRoles(roles);
			userEntity = userConverter.toEntity(oldUser, userDTO);	
		}else {
			roles.add(roleEntity);
			userEntity.setRoles(roles);
			userEntity = userConverter.toEntity(userDTO); 
		}
		return userConverter.toDTO(userRepository.save(userEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id : ids)
		{
			userRepository.delete(id);
		}
	}
	
	@Override
	public int getTotalSearchItem(String keyWord) {
		return userRepository.getTotalSearchItem(keyWord);
	}
	
	@Override
	public List<UserDTO> listAll(Pageable pageable,String keyword) {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll(pageable,keyword);
		for(UserEntity item : entities)
		{
			UserDTO userDTO = userConverter.toDTO(item);
			models.add(userDTO);
		}
		return models;
	}
	
	

	@Override
	public boolean isUserExist(String userName) {
		UserEntity userEntity = userRepository.findOneByUserName(userName);
		if(userEntity != null)
		{
			return true;
		}else {
			return false;
		}
	}

	@Override
	public UserDTO findByUserName(String username) {
		UserEntity userEntity = userRepository.findOneByUserName(username);
		return userConverter.toDTO(userEntity);
	}
	
}
