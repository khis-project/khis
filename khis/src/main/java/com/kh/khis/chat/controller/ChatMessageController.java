package com.kh.khis.chat.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.kh.khis.chat.model.service.ChatService;
import com.kh.khis.chat.model.vo.ChatLog;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatMessageController {

	@Autowired
	private ChatService chatService;
	
	/**
	 *  /app/chat/chat_1234
	 *  -> @MessageMapping(/chat/chat_1234)
	 *  -> @SendTo(/chat/chat_1234) : SimpleBroker에 전달
	 *  
	 *  database chat_log 테이블에 insert처리
	 *  
	 * @param chatId
	 * @param chatLog
	 * @return
	 */
	@MessageMapping("/chat/{chatId}")
	@SendTo(value={"/chat/{chatId}", "/chat/admin", "/chat/irHead"})
	public ChatLog chatLog(@DestinationVariable String chatId, ChatLog chatLog) {
		log.debug("chatId = {}", chatId);
		log.debug("chatLog = {}", chatLog);
		
		int result = chatService.insertChatLog(chatLog);
		
		return chatLog;
	}
	
	@MessageMapping("/lastCheck")
	@SendTo(value={"/chat/admin", "/chat/irHead"})
	public Map<String, Object> lastCheck(Map<String, Object> lastCheck){
		log.debug("lastCheck = {}", lastCheck);
		// db chat_member.last_check update
		int result = chatService.updateLastCheck(lastCheck);
		return lastCheck;
	}
	
	
	
	
}
