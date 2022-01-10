package com.kh.khis.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.chat.model.vo.ChatLog;
import com.kh.khis.chat.model.vo.ChatMember;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public ChatMember findChatMemberByMemberId(String memberId) {
		return session.selectOne("chat.findChatMemberByMemberId", memberId);
	}

	@Override
	public int insertChatMember(ChatMember chatMember) {
		return session.insert("chat.insertChatMember", chatMember);
	}
	
	@Override
	public int insertChatLog(ChatLog chatLog) {
		return session.insert("chat.insertChatLog", chatLog);
	}

	@Override
	public List<ChatLog> findChatLogByChatId(String chatId) {
		return session.selectList("chat.findChatLogByChatId", chatId);
	}

	@Override
	public List<ChatLog> findChatLog(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("chat.findChatLog", rowBounds);
	}

	@Override
	public int updateLastCheck(Map<String, Object> fromMessage) {
		return session.update("chat.updateLastCheck", fromMessage);
	}

	@Override
	public int selectTotalChatList() {
		// TODO Auto-generated method stub
		return session.selectOne("chat.selectTotalChatList");
	}
	
	
	
	
}
