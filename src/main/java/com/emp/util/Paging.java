package com.emp.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Paging<T> {

	private Map<String, Integer> paging = new HashMap<>();
	
	private List<T> list = new ArrayList<>();
	
	private String keyword;
	
	private String searchType;
	
	public Paging(int nowPage, int recordSize, int totalRecordSize, int pageSize, int option) {
		list = Collections.emptyList();
		
		if(nowPage < 1) {
			nowPage = 1;
		}
		if(recordSize < 1) {
			recordSize = 10;
		}
		if(totalRecordSize < 1) {
			System.err.println("DB에서 조회한 목록수가 없습니다.");
			return;
		}
		if(pageSize < 1) {
			pageSize = 10;
		}
		if(option > 2) {
			option = 1;
		}
		
		/* Map 등록 */
		init(nowPage, recordSize, totalRecordSize, pageSize);
		
		if(option == 1) {
			option1(nowPage, recordSize, totalRecordSize, pageSize);
		}
		if(option == 2) {
			option2(nowPage, recordSize, totalRecordSize, pageSize);
		} 
	}
	
	private void init(int nowPage, int recordSize, int totalRecordSize, int pageSize) {
		int totalPage = (int) Math.ceil((double) totalRecordSize / (double) recordSize);
		if(nowPage >= totalPage) {
			paging.put("nowPage", totalPage);
		} else {
			paging.put("nowPage", nowPage);			
		}
		
		paging.put("recordSize", recordSize);
		paging.put("totalRecordSize", totalRecordSize);
		paging.put("pageSize", pageSize);
		
		/* offset 계산 */
		int offset =  (nowPage - 1) * recordSize;
		if(offset < 0) {
			offset = 0;
		}
		paging.put("offset", offset);
	}
	
	/* 1칸씩 이동 */
	private void option1(int nowPage, int recordSize, int totalRecordSize, int pageSize) {
		/* start & end 계산 */
		int totalPage = (int) Math.ceil((double) totalRecordSize / (double) recordSize);
		
		int start = nowPage - (pageSize / 2);
		
	    if (start < 1) {
	        start = 1;
	    }
	    
	    int end = start + pageSize - 1;
	    
	    if (end > totalPage) {
	        end = totalPage;
	        start = end - pageSize + 1;
	        if (start < 1) {
	            start = 1;
	        }
	    }
		
		paging.put("start", start);
		paging.put("end", end);
		paging.put("totalPage", totalPage);
	}
	
	/* pageSize만큼 이동 */
	private void option2(int nowPage, int recordSize, int totalRecordSize, int pageSize) {
		/* start & end 계산 */
		int totalPage = (int) Math.ceil((double) totalRecordSize / (double) recordSize);
		
		int start = ((nowPage - 1) / pageSize) * pageSize + 1;
		if(start < 0) {
			start = 1;
		}
		
		int end = start + pageSize - 1;
		if(end > totalPage) {
			end = totalPage;
		}
		paging.put("start", start);
		paging.put("end", end);
		paging.put("totalPage", totalPage);
	}
	
	public void setList(List<T> list) {
		this.list = list;
	}
	
	public List<T> getList(){
		if(this.list.size() < 1) {
			System.err.println("Paging(getList()) : 리스트 사이즈가 1보다 작습니다.");
		}
		return list;
	}
	
	public Map<String, Integer> getPagingMap() {
		return this.paging;
	}
	
	public void setKeyword(String keyword) {
		if(keyword != null && !keyword.isBlank()) {
			this.keyword = keyword.trim();
		} else {
			System.err.println("검색 문자열이 비어있습니다.");
		}
	}
	
	public void setSearchType(String searchType) {
		if(searchType != null && !searchType.isBlank()) {
			this.searchType = searchType.trim();
		} else {
			System.err.println("검색 옵션 문자열이 비어있습니다.");
		}
	}
	
	public String getKeyword() {
		return this.keyword;
	}
	
	public String getSearchType() {
		return this.searchType;
	}
	
	/* Paging 관련 Getter */
	public int getNowPage() {
		return this.paging.get("nowPage");
	}
	
	public int getRecordSize() {
		return this.paging.get("recordSize");
	}
	
	public int getTotalRecordSize() {
		return this.paging.get("totalRecordSize");
	}
	
	public int getPageSize() {
		return this.paging.get("pageSize");
	}
	
	public int getOffset() {
		return this.paging.get("offset");
	}
	
	public int getStart() {
		return this.paging.get("start");
	}
	
	public int getEnd() {
		return this.paging.get("end");
	}
	
	public int getTotalPage() {
		return this.paging.get("totalPage");
	}
	
}
