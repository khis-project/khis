package com.kh.khis.untact_interview_statistics_practice.statistics.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.untact_interview_statistics_practice.common.HiSpringUtils;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.service.InterviewPracticeService;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.service.StatisticsService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;


@Slf4j
@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	
	@Autowired
	private StatisticsService statisticsService;
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;

	
	@GetMapping("/statistics.do")
	public String Statistics() {
		log.debug("{}", "Statistics.do 요청!");
		return "untact_interview_statistics_practice/statistics/statistics";
	}
	
	@ResponseBody
	@GetMapping("/selectStatisticsKind.do")
	public Map<String,double[]> selectStatisticsKind(@RequestParam String satisticsKind,@RequestParam String co_code, Model model) {
		log.debug("{}", "Statistics.do 요청!");
		// satisticsKind로 바로 보내서 하면 단일값이라고 에러 뜬다. 
		// map으로 보내야 mapper에서 에러 미발생
		Map<String,String> map = new HashMap<String, String>();
		map.put("satisticsKind", satisticsKind);
		map.put("co_code", co_code); // 해당 부분은 후에 co_code를 클릭하면 보내지게 진행
		System.out.println("satisticsKind : " + satisticsKind);
		List<Statistics> statisticsList = statisticsService.selectStatisticsKind(map);
//		INFO : |--------|-----------|----------|------|
//		INFO : |CO_CODE |CAREER_SUM |PASSCHECK |COUNT |
//		INFO : |--------|-----------|----------|------|
//		INFO : |1       |0          |n         |1     |
//		INFO : |1       |4          |y         |1     |
//		INFO : |1       |0          |yn        |7     |		
//		여기서 n/y/yn 순서대로 적용해서 총 3개가 넘어가게끔해야되는데
//		일단 각각의 종류마다 정렬이 되어있고, passcheck도 n y yn순으로 정렬이 되어있으니까 map에 추가해서 뿌려주자.
		boolean kind = "career".equals(satisticsKind); // true면 경력/ false면 나이
		Map<String,double[]> mapkindresult = new HashMap<String, double[]>();
		if(!statisticsList.isEmpty()) { // 받아온 데이터가 null이 아닐때
			double[] test = {0,0,0};
			String mapKey = "";
			int counts = 0;
			for(int i = 0; i < statisticsList.size(); i++) { // list에 담긴 만큼 돌리기.
				String kindKey = (kind ? statisticsList.get(i).getCareer_sum() : statisticsList.get(i).getAge())+"";
				if(i == 0) { // 맨처음일 경우. 즉 i가 0일 경우
					mapKey = kindKey;
				} 
				
				if(!mapKey.equals(kindKey+"")) { // 이전에 저장된 값이 아닐 경우
					for(int ii = 0; ii < 3; ii++) {
						test[ii] = test[ii] !=0 ? test[ii]/counts : 0;
					} // 그 부분에 해당하는 비율 넣기
					mapkindresult.put(mapKey, test);
					
					test = new double[3];//초기화
					counts = 0; //초기화
					
					mapKey = kindKey+""; // 값 다시 추가
				}
				counts += statisticsList.get(i).getCount(); // 각각의 career_sum/age의 전체 회원수를 구하기 위함
				test["n".equals(statisticsList.get(i).getPasscheck()) ? 0 : 
					"y".equals(statisticsList.get(i).getPasscheck()) ? 1 : 2] = statisticsList.get(i).getCount();
				
				if(i == statisticsList.size()-1) {
					for(int ii = 0; ii < 3; ii++) {
						test[ii] = test[ii] !=0 ? test[ii]/counts : 0;
					} // 그 부분에 해당하는 비율 넣기
					mapkindresult.put(mapKey, test);
				}
			}
//			for(Entry<String, double[]> elem : mapkindresult.entrySet()){
//				
//				String key = elem.getKey();
//				double[] value = elem.getValue();
//				
//				System.out.println(key+" : "  +Arrays.toString(value));
//				
//			}
		}
	
		
		model.addAttribute("statisticsList",mapkindresult);
		
		return mapkindresult;
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


