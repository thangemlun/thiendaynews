package com.thienday.dao;

import java.util.List;

import com.thienday.mapper.RowMapper;

public interface GenericDAO<T> {
	@SuppressWarnings("hiding")
	<T> List<T> query(String sql,RowMapper<T> rowMapper,Object... parameters);//<T> List<T> l� Java Generic
	 void update (String sql , Object... parameters);
	 Long insert(String sql , Object... parameters);
	 int count(String sql,Object... parameters );
}
