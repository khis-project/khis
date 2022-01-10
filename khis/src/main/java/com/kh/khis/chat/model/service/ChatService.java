package com.kh.khis.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.chat.model.vo.ChatLog;
import com.kh.khis.chat.model.vo.ChatMember;

public interface ChatService {

	ChatMember findChatMemberByMemberId(String memberId);

	int insertChatMembers(List<ChatMember> asList);

	int insertChatLog(ChatLog chatLog);

	List<ChatLog> findChatLogByChatId(String chatId);

	List<ChatLog> findChatLog(int offset, int limit);

	int updateLastCheck(Map<String, Object> fromMessage);

	int selectTotalChatList();

	
}
