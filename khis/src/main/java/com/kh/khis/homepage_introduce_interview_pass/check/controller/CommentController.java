package com.kh.khis.homepage_introduce_interview_pass.check.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.khis.homepage_introduce_interview_pass.check.model.service.CheckService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/check")
public class CommentController {

	@Autowired
	private CheckService checkService;
	
	@GetMapping("/evaluatecomment.do")
	public String commentCheck() {
		
		return "homepage_introduce_interview_pass/evaluatecomment";
		
	}
}
