package com.thienday.service;

import java.util.Map;

import com.thienday.dto.RoleDTO;

public interface IRoleService {
	Map<Long,String> findAll();
	RoleDTO findOneByRoleId(Long id);
}
