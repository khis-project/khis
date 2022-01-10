package com.kh.khis.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.chat.model.dao.ChatDao;
import com.kh.khis.chat.model.vo.ChatLog;
import com.kh.khis.chat.model.vo.ChatMember;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Override
	public ChatMember findChatMemberByMemberId(String memberId) {
		return chatDao.findChatMemberByMemberId(memberId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertChatMembers(List<ChatMember> chatMembers) {
		int result = 0;
		for(ChatMember chatMember : chatMembers) {
			result = chatDao.insertChatMember(chatMember);
		}
		return result;
	}

	@Override
	public int insertChatLog(ChatLog chatLog) {
		return chatDao.insertChatLog(chatLog);
	}

	@Override
	public List<ChatLog> findChatLogByChatId(String chatId) {
		return chatDao.findChatLogByChatId(chatId);
	}

	@Override
	public List<ChatLog> findChatLog(int offset, int limit) {
		return chatDao.findChatLog(offset, limit);
	}

	@Override
	public int updateLastCheck(Map<String, Object> fromMessage) {
		return chatDao.updateLastCheck(fromMessage);
	}

	@Override
	public int selectTotalChatList() {
		// TODO Auto-generated method stub
		return chatDao.selectTotalChatList();
	}

	

	
	
}
