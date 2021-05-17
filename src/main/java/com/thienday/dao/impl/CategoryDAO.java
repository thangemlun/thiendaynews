package com.thienday.dao.impl;

import com.thienday.dao.ICategoryDAO;
import com.thienday.mapper.CategoryMapper;
import com.thienday.model.CategoryModel;

import java.util.List;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {
	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(Long id) {
		String sql = "SELECT * FROM category WHERE id = ? ";
		List<CategoryModel> categories = query(sql, new CategoryMapper(), id);
		return categories.isEmpty() ? null : categories.get(0);
	}

	@Override
	public CategoryModel findOneByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = ? ";
		List<CategoryModel> categories = query(sql, new CategoryMapper(), code);
		return categories.isEmpty() ? null : categories.get(0);
	}

}