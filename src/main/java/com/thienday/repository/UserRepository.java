package com.thienday.repository;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thienday.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>  {
	@Query("SELECT u FROM UserEntity u  WHERE u.userName LIKE %?1%"
			+ " OR u.fullName LIKE %?1%"
			+ " OR u.status LIKE %?1%" )
	List<UserEntity> findAll(Pageable pageable,String keyword);
	
	@Query("SELECT COUNT(u) FROM UserEntity u  WHERE u.userName LIKE %?1%"
			+ " OR u.fullName LIKE %?1%"
			+ " OR u.status LIKE %?1%")
	int getTotalSearchItem(String keyWord);
	
	UserEntity findOneByUserNameAndStatus(String name ,int status);
	UserEntity findOneByUserName(String name);
}
