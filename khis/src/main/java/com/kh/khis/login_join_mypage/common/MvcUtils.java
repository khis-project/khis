package com.kh.khis.login_join_mypage.common;

/**
 *
 *
 */
public class MvcUtils {
	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();

		// 전체 페이지수
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);

		// 페이지 번호를 클릭했을 때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /mvc/admin/memberList?cPage=

		// 페이지 바 크기 : 5
		int pagebarSize = 5;

		/*
		 *     1 2 3 4 5 다음
		 * 이전 6 7 8 9 10 다음
		 * 이전 11 12
		 *
		 * pageStart : 시작하는 pageNo - cPage와 pagebarSize에 의해 결정
		 *
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart  + pagebarSize - 1;

		int pageNo = pageStart;

		// 1. 이전
		if(pageNo == 1) {

		} else {
			pagebar.append("<a href='" + url + (pageNo - 1) + "'>이전</a>\n");
		}
		// 2. pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				// 현재 페이지인 경우 링크를 제공하지 않는다
				pagebar.append("<span class = 'cPage'>" + pageNo + "</span>\n");
			} else {
				// 현재 페이지가 아닌 경우 링크를 제공한다.
				pagebar.append("<a href='" + url + pageNo + "'>" + pageNo + "</a>\n");

			}
			pageNo++;
		}
		// 3. 다음
		if (pageNo > totalPage) {

		} else {
			pagebar.append("<a href='" + url + pageNo + "'>다음</a>\n");
		}
		return pagebar.toString();
	}
}
