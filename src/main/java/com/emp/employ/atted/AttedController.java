package com.emp.employ.atted;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/atted")
public class AttedController {
	
	@Autowired
	private AttedService attedService;
	
	@Autowired
	private AttedMapper attedMapper;
	
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
	@PostMapping("/atteStart")
	public ModelAndView atteStart(AttedDTO atted, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		/* 당일 출석체크 했는지? */
		AttedDTO contains = attedMapper.atteEndContains(atted);
		
		/* 출석체크한 직원이 관리자인지 확인 */
		boolean manager = session.getAttribute("valueManager") != null;
		
		/* 당일 출석체크를 했었으면 실행 */
		if(contains != null) {
			/* 관리자인 경우 관리자 페이지로 */
			if(manager) {
				mav.addObject("startContains", employee.getName());
				mav.setViewName("manager/manager");
				return mav;
			}
			
			/* 직원인 경우 직원 페이지로 */
			mav.addObject("startContains", employee.getName());
			mav.setViewName("emp/empDash");
			return mav;
		}
		
		
		
		AttedDTO target = atted;
		attedService.atteStartFlag(target);
		attedMapper.atteStart(target);
		
		/* 출석체크한 사람이 관리자라면 관리자 페이지로 이동 */
		if(manager) {
			mav.addObject("attedStartSuccess", target);
			mav.addObject("manager", employee);
			mav.setViewName("manager/manager");
			return mav;
		}
		
		
		mav.addObject("attedStartSuccess", target);
		mav.addObject("employee", employee);
		mav.setViewName("emp/empDash");
		return mav;
	}


	/*
	 * 전재율
	 * 자신(직원)의 퇴근 체크 로직 실행
	 * 메서드 이름 atteEnd
	 */
	@PostMapping("/atteEnd")
	public ModelAndView atteEnd(AttedDTO atted, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		/* 로그인한 사람이 아니라면 [인터셉터에서 걸어둬서 없어도 되는 로직이지만 설명을 위해] */
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		/* 출석체크한 직원이 관리자인지 확인 */
		boolean manager = session.getAttribute("valueManager") != null;
		
		/* 퇴근체크를 했었는지 확인 */
		int stop = attedMapper.atteEndStop(atted);
		if(stop > 0) {
			if(manager) {
				mav.addObject("endContains", employee.getName());
				mav.setViewName("manager/manager");
				return mav;
			}
			
			mav.addObject("endContains", employee.getName());
			mav.setViewName("emp/empDash");
			return mav;
		}
		
		AttedDTO target = atted;
		AttedDTO atte_start = attedMapper.atteEndContains(atted);

		/* 퇴근체크 버튼을 눌렀는데 당일 출석체크를 하지 않은 경우 */
		if(atte_start == null) {
			if(manager) {
				mav.addObject("startNot", true);
				mav.setViewName("manager/manager");
				return mav;
			}
			
			mav.addObject("startNot", true);
			mav.setViewName("emp/empDash");
			return mav;
		}
		
		target.setAtte_start(atte_start.getAtte_start());
		
		attedService.atteEndFlag(target);
		
		/* 출석 체크를 했었다면 Update 실행 */
		attedMapper.atteEndUpdate(target);
		
		if(manager) {
			mav.addObject("endSuccess", target);
			mav.addObject("manager", employee);
			mav.setViewName("manager/manager");
			return mav;
		}
		
		mav.addObject("endSuccess", target);
		mav.addObject("employee", employee);
		mav.setViewName("emp/empDash");
		return mav;
	}
	
}
