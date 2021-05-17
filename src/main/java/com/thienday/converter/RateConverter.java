package com.thienday.converter;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.thienday.dto.RateDTO;
import com.thienday.entity.RateEntity;

@Component
public class RateConverter {

	public RateDTO toDTO(RateEntity entity) {
		RateDTO result = new RateDTO();
		result.setId(entity.getId());
		result.setRatenumber(entity.getRateNumber());
		result.setNewsId(entity.getNews().getId());
		result.setNewsTitle(entity.getNews().getTitle());
		result.setUserId(entity.getUser().getId());
		result.setUserName(entity.getUser().getUserName());
		result.setCreatedDate(getTimestamp(entity.getCreatedDate()));
		return result;
	} 
	
	public RateEntity toEntity(RateDTO dto) {
		RateEntity result = new RateEntity();
		result.setRateNumber(dto.getRatenumber());
		return result;
	}
	
	public RateEntity toEntity(RateEntity result,RateDTO dto) {
		result.setRateNumber(dto.getRatenumber());
		return result;
	}
	
	public static Timestamp getTimestamp(Date date) {
        return date == null ? null : new java.sql.Timestamp(date.getTime());
    }
}
