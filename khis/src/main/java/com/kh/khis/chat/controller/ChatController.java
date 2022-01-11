package com.kh.khis.chat.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.chat.model.service.ChatService;
import com.kh.khis.chat.model.vo.ChatLog;
import com.kh.khis.chat.model.vo.ChatMember;
import com.kh.khis.interview_management.common.IRManagementUtils;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat.do")
	public String chatPopup(@SessionAttribute("loginMember") Member loginMember, Model model) {
		log.debug("loginMember = {}", loginMember);
		String chatId = null;
 		
		String memberId = loginMember.getId();
		// 1. 채팅방 조회 : chat_member테이블에 해당회원의 레코드가 있는가
		ChatMember chatMember = chatService.findChatMemberByMemberId(memberId);
		log.debug("chatMember = {}", chatMember);
		
		// 2. 첫 접속인 경우 : chat_member테이블에 insert작업
		if(chatMember == null) {
			chatId = IRManagementUtils.getRandomChatId();
			log.debug("chatId = {}", chatId);
			chatMember = new ChatMember(chatId, memberId, 0, "Y", null, null);
			ChatMember chatAdmin = new ChatMember(chatId, "admin", 0, "Y", null, null);
			chatService.insertChatMembers(Arrays.asList(chatMember, chatAdmin));
		}
		// 3. 이미 접속한 경우 : 채팅로그 조회
		else {
			chatId = chatMember.getChatId();
			// @실습문제
			 List<ChatLog> list = chatService.findChatLogByChatId(chatId);
			 log.debug("list = {}", list);
			 model.addAttribute("list", list);
		}
		
		model.addAttribute("chatId", chatId);
		return "/chat/chatPopup";
	}
	
	@GetMapping("/chatLogUpdate.do")
	@ResponseBody
	public List<ChatLog> chatLogUpdate(@RequestParam("chatId") String chatId, Model model) {
		log.debug("chatId = {}", chatId);
		List<ChatLog> list = chatService.findChatLogByChatId(chatId);
		model.addAttribute("list", list);
		
		return list;
		
	}
	
}
