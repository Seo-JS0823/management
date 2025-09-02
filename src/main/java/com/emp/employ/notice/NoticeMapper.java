package com.emp.employ.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
	
	List<NoticeDTO> getNoticeList(int department_id);
	
	void noticeInsert(NoticeDTO notice);


	void noticeAdd(NoticeDTO noticeDTO);
	
	NoticeDTO getNoticeByNum(int posting_num);
	
	int noticeUpdate(NoticeDTO noticeDTO);
}
