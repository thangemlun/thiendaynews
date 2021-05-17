package com.thienday.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thienday.entity.RateEntity;

public interface RateRepository extends JpaRepository<RateEntity, Long> {

	@Query("SELECT COUNT(r) FROM RateEntity r WHERE r.news.id = ?1 ")
	int countByNewsId(Long id);
	
	@Query("SELECT COUNT(r) FROM RateEntity r WHERE r.news.id = ?1 AND r.rateNumber = ?2 ")
	int countByRateNumberAndNewsId(Long id,int ratenumber);
	
	@Query("SELECT r FROM RateEntity r WHERE r.user.userName = ?1 AND r.news.title = ?2 ")
	RateEntity findRatedUser(String username,String title);
}
