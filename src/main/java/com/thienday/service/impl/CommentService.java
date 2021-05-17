package com.thienday.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thienday.converter.CommentConverter;
import com.thienday.dto.CommentDTO;
import com.thienday.entity.CommentEntity;
import com.thienday.repository.CommentRepository;
import com.thienday.repository.NewsRepository;
import com.thienday.repository.UserRepository;
import com.thienday.service.ICommentService;

@Service
public class CommentService implements ICommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private UserRepository userRepository;
 	
	@Autowired
	private CommentConverter commentConverter;
 	
 	
	@Override
	@Transactional //khi thêm sửa xóa dữ liệu phải thêm annotation này để giúp bảo toàn dữ liệu. 
	public CommentDTO save(CommentDTO commentDTO) {
		CommentEntity commentEntity = new CommentEntity();
		CommentEntity repliedComment = new CommentEntity();
		if(commentDTO.getRepliedCommentId() != null)
		{
			repliedComment = commentRepository.findOne(commentDTO.getRepliedCommentId());
		}
		if(commentDTO.getId() != null)
		{
			CommentEntity oldComment = commentRepository.findOne(commentDTO.getId());
			commentEntity = commentConverter.toEntity(oldComment, commentDTO);
			oldComment.setNews(newsRepository.findOne(commentDTO.getNewsId()));
			oldComment.setUser(userRepository.findOne(commentDTO.getUserId()));
		}else
		{
			commentEntity = commentConverter.toEntity(commentDTO);
			commentEntity.setNews(newsRepository.findOne(commentDTO.getNewsId()));
			commentEntity.setUser(userRepository.findOne(commentDTO.getUserId()));
			if(commentDTO.getRepliedCommentId() != null)
			{
				commentEntity.setComment(repliedComment);
			}
		}
		return commentConverter.toDTO(commentRepository.save(commentEntity));
	}


	@Override
	public List<CommentDTO> findAll(Pageable pageable,Long id) {
		List<CommentDTO> models = new ArrayList<>();
		List<CommentEntity> commentEntities = commentRepository.findAll(pageable,id);
		for(CommentEntity item : commentEntities )
		{
			CommentDTO commentDTO = commentConverter.toDTO(item);
			models.add(commentDTO);
		}
		return models;
	}


	@Override
	public int getTotalItem(Long id) {
		// TODO Auto-generated method stub
		return (int)commentRepository.countItemByNewsId(id);
	}


	@Override
	public List<CommentDTO> listRepliedComment(long id) {
		List<CommentDTO> models = new ArrayList<>();
		List<CommentEntity> commentEntities = commentRepository.listRepliedComment(id);
		for(CommentEntity item : commentEntities )
		{
			CommentDTO repliedComment = commentConverter.toDTO(item); 
			models.add(repliedComment);
		}
		return models;
	}


	@Override
	public int countRepliedComments(long id) {
		return commentRepository.countRepliedComments(id);
	}
}
