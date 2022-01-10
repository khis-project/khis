package com.kh.khis.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatMember implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String chatId;
	private String memberId;
	private long lastCheck;
	private String status;
	private Date startDate;
	private Date endDate;
	
}
