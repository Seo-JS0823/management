package com.emp.manager.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerLeaveController {
	
	@Autowired
	private ManagerLeaveMapper managerLeaveMapper; 
	
	/* 연차적립 페이지 */
	@GetMapping("/annualCreateView")
	public ModelAndView annualCreateView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/annualCreate");
		return mav;
	}
	
	/* 연차적립 실행 */
	@PostMapping("/annualCreate")
	public ModelAndView annualCreate(LeaveDTO leave, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int annual = managerLeaveMapper.annualInsert(leave);
		
		return mav;
	}

	/* 연차 적립할 직원 검색 */
	@PostMapping("/annualEmp")
	public ModelAndView annualEmp(String name) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = managerLeaveMapper.annualEmp(name);
		if(employee != null) {
			mav.addObject("target", employee);
		}
		
		
		mav.setViewName("manager/annualCreate");
		return mav;		
	}
	
}
