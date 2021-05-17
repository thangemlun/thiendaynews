package com.thienday.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thienday.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String code);
}
