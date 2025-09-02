package com.emp.manager.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.notice.NoticeDTO;
import com.emp.employ.notice.NoticeMapper;

@Controller
@RequestMapping("/manage")
public class ManagerNoticeController {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	/* 공지사항 작성 페이지 View */
	@RequestMapping("/noticeReadView")
	 public ModelAndView noticeView(int posting_num) {
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO target = noticeMapper.getNoticeByNum(posting_num);
		
		mav.addObject("notice", target);
		mav.setViewName("manager/noticeDetail");
		return mav;
	}
	
	// 상세정보 페이지에서 수정 버튼 눌렀을때
	@RequestMapping("/noticeUpdateView")
		public ModelAndView UpdateView(int posting_num) {
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO target = noticeMapper.getNoticeByNum(posting_num);
		
		mav.addObject("notice", target);
		mav.setViewName("manager/noticeUpdate");
		return mav;
		
	}
	
	@PostMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(NoticeDTO notice) {
		ModelAndView mav = new ModelAndView();
		
		int updated = noticeMapper.noticeUpdate(notice);
		
		if(updated == 0) {
			System.out.println("업데이트 된 거 없음");
		}
		
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
//	 public String	
//	@RequestMapping("/noticeReade")
	/* 공지사항 작성 INSERT */
	@RequestMapping("/noticeWriteView") // department_id, manager_id
		public ModelAndView writeView(NoticeDTO noticeDTO) {
		
		System.out.println("첫번째: " + noticeDTO);
		
			ModelAndView mav = new ModelAndView();
		mav.addObject("noticeDTO", noticeDTO);
			mav.setViewName("manager/noticeInsert");
		return mav;
	}
	
	@RequestMapping("/noticeWrite") // posting_num, department_name, ...총 8개
	public ModelAndView InsertView(NoticeDTO noticeDTO) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("두번째: " + noticeDTO);
		
		noticeMapper.noticeAdd(noticeDTO);
		mav.setViewName("redirect:/manage/mngindex");
	return mav;
}
	
}
