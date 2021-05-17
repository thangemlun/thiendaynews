package com.thienday.converter;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.thienday.dto.CommentDTO;
import com.thienday.entity.CommentEntity;

@Component
public class CommentConverter {
		
	/*
	 * @Autowired private DateDiffUtils dateDiff;
	 */
	public CommentDTO toDTO(CommentEntity entity)
	{
		CommentDTO result = new CommentDTO() ;
		result.setId(entity.getId());
		result.setContent(entity.getContent());
		result.setNewsId(entity.getNews().getId());
		result.setNewsTitle(entity.getNews().getTitle());
		result.setUserId(entity.getUser().getId());
		result.setUserName(entity.getUser().getUserName());
		if(entity.getComment() != null)
		{
			result.setRepliedCommentId(entity.getComment().getId());
		}
		result.setCreatedDate(getTimestamp(entity.getCreatedDate()));
		/*
		 * try {
		 * result.setTimePosted(dateDiff.getCreatedDaysDiff(entity.getCreatedDate())); }
		 * catch (ParseException e) { e.printStackTrace(); }
		 */
		return result;
	}
	
	public CommentEntity toEntity(CommentDTO dto)
	{	
		CommentEntity result = new CommentEntity();
		
		result.setContent(dto.getContent());
		
		return result ;
	}
	
	public CommentEntity toEntity(CommentEntity result,CommentDTO dto) {
		result.setContent(dto.getContent());
		return result;
	}
	
	public static Timestamp getTimestamp(Date date) {
        return date == null ? null : new java.sql.Timestamp(date.getTime());
    }
	
}
