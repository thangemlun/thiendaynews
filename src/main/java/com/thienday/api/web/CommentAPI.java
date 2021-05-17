package com.thienday.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.thienday.dto.CommentDTO;
import com.thienday.entity.CommentEntity;
import com.thienday.entity.NewsEntity;
import com.thienday.entity.UserEntity;
import com.thienday.repository.CommentRepository;
import com.thienday.repository.NewsRepository;
import com.thienday.repository.UserRepository;
import com.thienday.service.ICommentService;

@RestController(value = "CommentAPIOfWeb")
public class CommentAPI {
	
	@Autowired
	NewsRepository newsRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CommentRepository commentRepository;
	
	@Autowired
	ICommentService commentService;
	
	@PostMapping("/api/comment")
	public CommentDTO createComment(@RequestBody CommentDTO commentDTO ) {
		NewsEntity newsEntity = newsRepository.findOneByTitle(commentDTO.getNewsTitle());
		UserEntity userEntity = userRepository.findOneByUserName(commentDTO.getUserName());
		if(commentDTO.getRepliedCommentId() != null)
		{
			CommentEntity commentEntity = commentRepository.findOne(commentDTO.getRepliedCommentId());
			commentDTO.setRepliedCommentId(commentEntity.getId());
		}
 		commentDTO.setNewsId(newsEntity.getId());
		commentDTO.setUserId(userEntity.getId());
		if(commentDTO != null )
		{
			StringBuilder result = new StringBuilder("{ " + commentDTO.getContent()+ " , \n ");
			result.append( commentDTO.getNewsTitle() + " , \n");
			result.append( commentDTO.getUserName()+ " , \n");
			result.append( commentDTO.getNewsId()+ " , \n");
			result.append(commentDTO.getRepliedCommentId() + "\n }");
			System.out.println(result.toString());
		}
		commentService.save(commentDTO);
		return commentDTO;
	}
}
