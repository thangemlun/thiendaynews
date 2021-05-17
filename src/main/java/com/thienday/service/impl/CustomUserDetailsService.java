package com.thienday.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.thienday.constant.SystemConstant;
import com.thienday.dto.MyUser;
import com.thienday.entity.RoleEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired 
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		if(userEntity == null ) {
			throw new UsernameNotFoundException("User not found !");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity role : userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(),userEntity.getFullName(), true , true , true, true, authorities );
		return myUser;
	}

}
