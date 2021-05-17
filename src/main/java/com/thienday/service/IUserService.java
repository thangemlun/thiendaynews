package com.thienday.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.thienday.dto.UserDTO;

public interface IUserService {
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO findById(Long id);
	UserDTO save(UserDTO userDTO);
	void delete(long[] ids);
	int getTotalSearchItem(String keyWord);
	List<UserDTO> listAll(Pageable pageable ,String keyword);
	boolean isUserExist(String userName);
	UserDTO findByUserName(String username);
}
