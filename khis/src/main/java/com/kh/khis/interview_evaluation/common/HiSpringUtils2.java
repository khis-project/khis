package com.kh.khis.interview_evaluation.common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class HiSpringUtils2 {
	
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
		System.out.println("cPage = " + cPage);
		System.out.println("numPerPage = " + numPerPage);
		System.out.println("totalContents = " + totalContents);
		// 전체페이지수 
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		System.out.println("totalPage = " + totalPage);
		// 페이지번호를 클릭했을때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바크기 
		int pagebarSize = 3;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		System.out.println("pageStart = " + pageStart);
		int pageEnd = pageStart + pagebarSize - 1;
		System.out.println("pageEnd = " + pageEnd);
		
		int pageNo = pageStart;
		
		/*
		 	<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" aria-label="Previous" tabindex="-1">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
			</nav>
			<script>
			const paging = (cPage) => {
				location.href = url + cPage;
			}
			</script>
		 */
		
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination pagination-sm justify-content-center\">\n");
		
		// 1.이전
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "			      <a class=\"page-link\" href=\"#\" aria-label=\"이전\" tabindex=\"-1\">\r\n"
					+ "			        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "			        <span>이전</span>\r\n"
					+ "			      </a>\r\n"
					+ "			    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "			      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "			        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "			        <span>이전</span>\r\n"
					+ "			      </a>\r\n"
					+ "			    </li>\n");
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
					+ "			      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"다음\">\r\n"
					+ "			        <span>다음</span>\r\n"
					+ "			        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "			      </a>\r\n"
					+ "			    </li>\n");
		}
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "			      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"다음\">\r\n"
					+ "			        <span>다음</span>\r\n"
					+ "			        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "			      </a>\r\n"
					+ "			    </li>\n");
		}
		
		pagebar.append("		</ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		
		return pagebar.toString();
	}

	public static String getRenamedFilename(String originalFilename) {
		// 확장자 가져오기
		String ext = "";
		int dot = originalFilename.lastIndexOf(".");
		if(dot > -1)
			ext = originalFilename.substring(dot); // .txt .jpg .png
					
		// 형식지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		DecimalFormat df = new DecimalFormat("000"); // 30 -> 030
					
		// 새파일명
		return sdf.format(new Date()) + df.format(Math.random() * 999) + ext;
	}

	/**
	 * chat_dfslk23lskd341
	 * 
	 * @return
	 */
	public static String getRandomChatId() {
		Random rnd = new Random();
		StringBuffer sb = new StringBuffer();
		sb.append("chat_");
		
		for(int i = 0; i < 15; i++) {
			if(rnd.nextBoolean()) {
				// 영문자 : 대문자 65~90, 소문자 97~122
				boolean isUpperCase = rnd.nextBoolean();
				char ch = (char)((isUpperCase ? 65 : 97) + rnd.nextInt(26));
				sb.append(ch);
			}
			else {
				// 숫자
				sb.append(rnd.nextInt(10));
			}
		}
		
		return sb.toString();
	}

}
