package com.emp.employ.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@GetMapping("/noticeReadView")
	public ModelAndView noticeReadView(int posting_num) {
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO notice = noticeMapper.getNoticeByNum(posting_num);
		
		mav.addObject("notice", notice);
		mav.setViewName("emp/empNotice");
		return mav;
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           