package com.kh.khis.untact_interview_statistics_practice.untact_interview.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.service.UntactInterviewService;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/untactInterview")
public class UntactInterviewController {
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */
	@Autowired
	private UntactInterviewService untactInterviewService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/zoom.do")
	public String Zoom(Model model) {
		log.debug("{}", "/memo.do 요청!");
		log.debug("{} {}", untactInterviewService, untactInterviewService.getClass());
		List<Zoom> zoomList = untactInterviewService.selectZoomList();
		model.addAttribute("zoomList", zoomList);
		return "untact_interview_statistics_practice/untact_interview/zoomEnroll";
	}
	
	

	@PostMapping("zoomEnroll.do")
	public String insertZoom(@ModelAttribute Zoom zoom, RedirectAttributes redirectAttributes) {
		//test 데이터
		zoom.setZoom_no(1);
		zoom.setMember_no(1);
		zoom.setCo_code(1);
		log.debug("zoom = {}",zoom);
		try {
			int result = untactInterviewService.insertZoom(zoom);
			String msg = result > 0 ? "zoom api 등록 성공!" : "zoom api 등록 실패!";
			redirectAttributes.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error("zoom api 정보 등록 오류", e);
			throw e;
		}
		return "redirect:/untactInterview/zoom.do";
	}
	/**
	 * URL Resource
	 * - 외부자원
	 * - 웹크롤링
	 * 
	 * @return
	 */
	@GetMapping(
		value = "/resource.do",
		produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource resource(HttpServletResponse response) {
		Resource resource = resourceLoader.getResource("https://docs.oracle.com/javase/8/docs/api/java/io/File.html");
		log.debug("resource = {}", resource);
		response.addHeader("Content-Disposition", "attachment; filename=File.html");
		return resource;
	}
	
}




