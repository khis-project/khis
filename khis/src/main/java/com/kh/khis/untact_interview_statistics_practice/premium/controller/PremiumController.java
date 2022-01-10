package com.kh.khis.untact_interview_statistics_practice.premium.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.protobuf.ByteString;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.untact_interview_statistics_practice.premium.model.service.PremiumService;
import com.kh.khis.untact_interview_statistics_practice.premium.model.vo.Premium;

@Slf4j
@Controller
@RequestMapping("/premium")
public class PremiumController {
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	private PremiumService premiumService;
	
	
	@GetMapping("/premium.do")
	public String Premium(HttpSession session, RedirectAttributes redirectAttr, Model model) {
		log.debug("{}", "premium.do 요청!");
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {
			int member_no = member.getMemberNo();
			Premium premium = premiumService.selectPremium(member_no);
			System.out.println("premium : " + premium);
			model.addAttribute("premium", premium);
			return "untact_interview_statistics_practice/premium/premiumForm";
		}
	}
	
	@PostMapping("/insertPremium.do")
	public String insertPremium(@RequestParam String month, @RequestParam String payment, 
			HttpSession session, RedirectAttributes redirectAttr) {
		log.debug("{}", "insertPremium.do 요청!");
		Map<String, Object> map = new HashMap<>();
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {
			int member_no = member.getMemberNo();
			map.put("month", month);
			map.put("payment", payment);
			map.put("member_no", member_no);
			System.out.println("map : "+map);
			int result = premiumService.insertPremium(map);
			redirectAttr.addFlashAttribute("msg",result > 0 ? "프리미엄 회원 추가에 성공하였습니다.":"프리미엄 회원 추가에 실패하였습니다.<br>다시진행해주세요.");
			return "untact_interview_statistics_practice/premium/premiumForm";
		}
	}
	
}


