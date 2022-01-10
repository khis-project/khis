package com.kh.khis.chat.model.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatLog extends ChatLogEntity implements Serializable {
	
	private int unreadCount;
	private Type type; // MESSAGE...

	public ChatLog(int no, String chatId, String memberId, String msg, long logTime, int unreadCount) {
		super(no, chatId, memberId, msg, logTime);
		this.unreadCount = unreadCount;
	}

	@Override
	public String toString() {
		return "ChatLog [" + super.toString() + ", unreadCount=" + unreadCount + "]";
	}
	
	
	
	
}
