package com.thienday.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thienday.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity , Long> {
	RoleEntity findOneByCode(String code);
}
