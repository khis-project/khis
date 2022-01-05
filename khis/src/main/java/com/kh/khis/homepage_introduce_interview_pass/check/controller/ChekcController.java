package com.kh.khis.homepage_introduce_interview_pass.check.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.khis.homepage_introduce_interview_pass.check.model.service.CheckService;
import com.kh.khis.homepage_introduce_interview_pass.check.model.vo.Check;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/check")
public class ChekcController {

	@Autowired
	private CheckService checkService;
	
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/checkList.do")
	public String checkList( 
			@RequestParam(defaultValue = "1") int cPage, 
			Model model, 
			HttpServletRequest request
		) {
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 전체게시물 목록(첨부파일 개수)
		List<Check> list = CheckService.selectcheckList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. 전체게시물수 totalContent
		int totalContent = checkService.selecCheckTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		/*
		 * String url = request.getRequestURI(); String pagebar =
		 * HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		 * log.debug("pagebar = {}", pagebar); model.addAttribute("pagebar", pagebar);
		 */
		
		return "homepage_introduce_interview_pass/passCheck";
	}
}
