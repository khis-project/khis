package com.kh.khis.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.khis.chat.model.service.ChatService;
import com.kh.khis.chat.model.vo.ChatLog;
import com.kh.khis.interview_management.common.IRManagementUtils;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat.do")
	public String adminChatList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		int limit = 10;
		int offset = (cPage - 1) * limit;
		List<ChatLog> list = chatService.findChatLog(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		int totalContent = chatService.selectTotalChatList();
		String url = request.getRequestURI();
		String pagebar = IRManagementUtils.getPagebar(cPage, limit, totalContent, url);	
//		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		return "admin/adminChatList";
	}
	
	@GetMapping("/{chatId}/{memberId}/chat.do")
	public String chat(@PathVariable String chatId, @PathVariable String memberId, Model model) {
		List<ChatLog> list = chatService.findChatLogByChatId(chatId);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		// model.addAttribute("memberId", memberId);
		// model.addAttribute("chatId", chatId);
		return "admin/adminChatPopup";
	}
	
}
