package com.emp.employ.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.atted.AttedDTO;
import com.emp.employ.atted.AttedMapper;
import com.emp.employ.leave.LeaveMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeMapper empMapper;
	
	@Autowired
	private LeaveMapper leaveMapper;
	
	@Autowired
	private AttedMapper attedMapper;
	
	/* 직원 메인 페이지 */
	@GetMapping("/empView")
	public ModelAndView empView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		
		if(target == null) {
			session.invalidate();
			mav.setViewName("/");
			return mav;
		}
		
		/* 출석 중복 여부 확인 */
		if(target.isStartContains()) {
			mav.addObject("startContains", target.getName());
			target.setStartContains(false);
		}
		
		/* 퇴근 중복 여부 확인 */
		if(target.isEndContains()) {
			mav.addObject("endContains", target.getName());
			target.setEndContains(false);
		}
		
		/* 퇴근체크 전 출석체크 여부 확인 */
		if(target.isStartNot()) {
			mav.addObject("startNot", true);
			target.setStartNot(false);
		}
		
		/* 연차 계산 */
		double leave = leaveMapper.leaveRead(target);
		
		/* 출근한 시간 계산 */
		String work_start = attedMapper.attedNowStart(target);
		
		/* 올해 근무한 일수 계산 */
		int allWork = attedMapper.allWorkCount(target);
		
		mav.addObject("allWork", allWork);
		mav.addObject("work_start", work_start);
		mav.addObject("leave", leave);
		mav.addObject("employee", target);
		mav.setViewName("emp/empDash");
		return mav;
	}
	
	/* 직원 정보 업데이트 페이지 */
	@GetMapping("/empUpdateView")
	public ModelAndView empUpdateView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		if(target == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		mav.addObject("employee", target);
		mav.setViewName("emp/empUpdate");
		return mav;
	}
	
	/* 직원 정보 업데이트 실행 */
	@PostMapping("/empUpdate")
	public ModelAndView empUpdate(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		empMapper.empUpdate(employee);
		
		mav.setViewName("redirect:/emp/empView");
		return mav;
	}
	
}
