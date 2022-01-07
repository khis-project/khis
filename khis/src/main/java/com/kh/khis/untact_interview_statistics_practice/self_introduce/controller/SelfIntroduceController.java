package com.kh.khis.untact_interview_statistics_practice.self_introduce.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletResponse;


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

@Slf4j
@Controller
@RequestMapping("/selfIntroduce")
public class SelfIntroduceController {
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;

	
	@GetMapping("/selfIntroduce.do")
	public String selfIntroduce() {
		log.debug("{}", "selfIntroduce.do 요청!");
		return "untact_interview_statistics_practice/self_introdution/self_introdution";
	}
	
	@ResponseBody
	/* @PostMapping("/introduceExtraction.do") */
	@RequestMapping(value= "/introduceExtraction.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String imgExtraction(@RequestParam(value="file_url",defaultValue="") String file_url, Model model,  HttpServletResponse response) throws FileNotFoundException,IOException {
		log.debug("{}", "pdfExtraction.do 요청!");
		log.debug("file_url : " + file_url);
		try {
			if(file_url != "" || !"".equals(file_url))
			{
				String text = detectText(file_url);
				if(text != null) {	
					URLEncoder.encode(text , "UTF-8"); // 한글 깨짐으로 인한 인코딩 추가
					response.setCharacterEncoding("utf-8"); // 한글 깨짐으로 인한 인코딩 추가
					model.addAttribute("text", text); // 자기소개서 저장
				}
				return text;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private static String detectText(String filePath) throws Exception {
        List<AnnotateImageRequest> requests = new ArrayList<>();
        String html = "";
        ImageSource imgSource = ImageSource.newBuilder().setImageUri(filePath).build();
//        ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
        Image img = Image.newBuilder().setSource(imgSource).build();
        Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
        AnnotateImageRequest request =
                AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
        requests.add(request);

	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
	        BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	        List<AnnotateImageResponse> responses = response.getResponsesList();

	        for (AnnotateImageResponse res : responses) {
	            if (res.hasError()) {
	                log.debug("Error = {} ", res.getError().getMessage());
	                return null;
	            }

	            int index = 0;
	            // For full list of available annotations, see http://g.co/cloud/vision/docs
	            for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
	            	if(index == 0){
	            		html += annotation.getDescription() + " ";	            		
	            		index ++;
	            	}
	            }
	        }
	    }
	    return html;
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


