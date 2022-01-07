package com.kh.khis.untact_interview_statistics_practice.common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class HiSpringUtils {

	/**
	 * 
	 *  
	 * @param cPage
	 * @param numPerPage
	 * @param totalContents
	 * @param url
	 * @return
	 */
	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수 
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바크기 
		int pagebarSize = 5;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		
		
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination justify-content-center\">\n");
		
		// 1.이전
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\" tabindex=\"-1\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		// 2.pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				// 현재페이지인 경우 링크 제공안함.
				pagebar.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>\n");
			}
			else {
				// 현재페이지가 아닌 경우 링크를 제공.
				pagebar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			
			pageNo++;
		}
		
		// 3.다음
		if(pageNo > totalPage) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		pagebar.append("		  </ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		
		return pagebar.toString();
	}

	public static String getPagebarAdmin(int cPage, int numPerPage, int totalContents, String url, String question_kind_url, String admin_approval_url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수 
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을때 링크
		//http://localhost:9090/khis/interviewPractice/interviewPracticeAdmin.do?admin_approval=y
		String delimeter = url.contains("?") ? "&" : "?";
		String url_plus = ("".equals(question_kind_url) ? "" : ("question_kind="+question_kind_url+"&"))+
				("".equals(admin_approval_url) ? "" : ("admin_approval="+admin_approval_url+"&"));
		url = url + delimeter+url_plus+"cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바크기 
		int pagebarSize = 5;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		
		
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination justify-content-center\">\n");
		
		// 1.이전
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\" tabindex=\"-1\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		// 2.pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				// 현재페이지인 경우 링크 제공안함.
				pagebar.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>\n");
			}
			else {
				// 현재페이지가 아닌 경우 링크를 제공.
				pagebar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			
			pageNo++;
		}
		
		// 3.다음
		if(pageNo > totalPage) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		pagebar.append("		  </ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		
		return pagebar.toString();
	}
}
