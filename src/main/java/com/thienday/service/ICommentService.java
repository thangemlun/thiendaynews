package com.thienday.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.thienday.dto.CommentDTO;

public interface ICommentService {
	CommentDTO save(CommentDTO commentDTO);
	List<CommentDTO> findAll(Pageable pageable,Long id);
	int getTotalItem(Long id);
	List<CommentDTO> listRepliedComment(long id);
	int countRepliedComments(long id);
}
