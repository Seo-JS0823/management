package com.emp.employ.atted;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/atted")
public class AttedController {
	
	/*
	 * 전재율
	 * 자신(직원)의 연차 정보 조회
	 * 메서드 이름 : annualRead
	 */
	public ModelAndView annualRead() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	/*
	 * 전재율
	 * 자신(직원)의 출근 체크 로직 실행
	 * 메서드 이름 atteStart
	 */
	public ModelAndView atteStart() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}


	/*
	 * 전재율
	 * 자신(직원)의 퇴근 체크 로직 실행
	 * 메서드 이름 atteEnd
	 */
	public ModelAndView atteEnd() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
