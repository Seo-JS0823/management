package com.emp.employ.leave;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	/* 
	 * 백승목
	 * 휴가 / 초과근무 View 보여주기
	 * 메서드 이름 : leaveView 
	 */
	@GetMapping("/leaveView")
	public ModelAndView leaveView() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 로직
	 * 메서드 이름 : leaveCreate
	 */
	public ModelAndView leaveCreate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	
	/*
	 * 백승목
	 * 휴가 신청 내역 조회
	 * 메서드 이름 : leaveRead
	 */
	public ModelAndView leaveRead() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 내역 수정
	 * 메서드 이름 : leaveUpdate
	 */
	public ModelAndView leaveUpdate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 내역 삭제
	 * 메서드 이름 : leaveDelete
	 */
	public ModelAndView leaveDelete() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 초과 근무 신청
	 * 메서드 이름 : overCreate
	 */
	public ModelAndView overCreate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/*
	 * 백승목
	 * 초과 근무 신청 내역 조회
	 * 메서드 이름 : overRead
	 */
	public ModelAndView overRead() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	/*
	 * 백승목
	 * 초과 근무 신청 내역 수정
	 * 메서드 이름 : overUpdate
	 */
	public ModelAndView overUpdate() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 초과 근무 신청 내역 삭제
	 * 메서드 이름 : overDelete
	 */
	public ModelAndView overDelete() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	/*
	 * 백승목
	 * 직원이 작성한 초과 근무 내역 수정 View
	 * 메서드 이름 : overUpdateView
	 */
	@GetMapping("/overUpdateView")
	public ModelAndView overUpdateView() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
}
