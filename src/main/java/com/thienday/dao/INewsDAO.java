package com.thienday.dao;

import java.util.List;

import com.thienday.model.NewsModel;

public interface INewsDAO extends GenericDAO<NewsModel> {
	List<NewsModel> findAll();
}
