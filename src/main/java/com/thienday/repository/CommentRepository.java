package com.thienday.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.thienday.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Long> {
	@Query(" SELECT c FROM CommentEntity c WHERE c.news.id = ?1 AND c.comment.id IS NULL " )
	public List<CommentEntity>findAll(Pageable pageable, long id);
	
	@Query("SELECT COUNT(c) FROM CommentEntity c WHERE c.news.id = ?1 AND c.comment.id IS NULL")
	int countItemByNewsId(Long id);
	
	@Query("SELECT c FROM CommentEntity c WHERE c.comment.id = ?1")
	public List<CommentEntity>listRepliedComment(long id); 
	
	@Query("SELECT COUNT(c) FROM CommentEntity c WHERE c.comment.id = ?1")
	int countRepliedComments(long id);
	
}
