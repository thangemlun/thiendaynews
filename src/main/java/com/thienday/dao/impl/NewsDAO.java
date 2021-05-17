package com.thienday.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.thienday.dao.INewsDAO;
import com.thienday.mapper.NewsMapper;
import com.thienday.model.NewsModel;

@Repository
public class NewsDAO extends AbstractDAO<NewsModel> implements INewsDAO {
	@Override
	public List<NewsModel> findAll() {
		String sql = "SELECT * FROM news";
		return query(sql, new NewsMapper());
	}
}