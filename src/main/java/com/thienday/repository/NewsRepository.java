package com.thienday.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thienday.entity.NewsEntity;

public interface NewsRepository extends JpaRepository<NewsEntity, Long>  {
	
	//Search Section
	@Query("SELECT n FROM NewsEntity n WHERE n.title LIKE %?1%"
			+ " OR n.shortDescription LIKE %?1%"
			+ " OR n.content LIKE %?1%" 
			+ " OR n.category.code LIKE %?1%"
			+ " OR n.category.name LIKE %?1% ORDER BY n.id DESC")
	List<NewsEntity> findAll(Pageable pageable,String keyword);
	
	@Query("SELECT COUNT(n) FROM NewsEntity n WHERE n.title LIKE %?1%"
			+ " OR n.shortDescription LIKE %?1%"
			+ " OR n.content LIKE %?1%"
			+ " OR n.category.code LIKE %?1%"
			+ " OR n.category.name LIKE %?1%")
	int getSearchTotalItem(String keyWord);
	
	@Query("SELECT n FROM NewsEntity n WHERE n.id = (SELECT MAX(x.id) FROM NewsEntity x ) ")
	NewsEntity findNewestNews();

	

	@Query("SELECT n FROM  NewsEntity n WHERE n.category.name LIKE %?1% ORDER BY n.id DESC")
	List<NewsEntity> findAll(String name , Pageable pageable);
	
	NewsEntity findOneByTitle(String title);
	
	@Query("SELECT COUNT(n) FROM NewsEntity n WHERE n.category.code LIKE %?1%")
	int countItemByCategoryCode(String code);
	
	@Query("SELECT n FROM NewsEntity n WHERE n.category.code LIKE %?1% ORDER BY n.id DESC")
	List<NewsEntity> findAllByCategoryCode(String code,Pageable pageable);
	
}
