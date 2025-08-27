package com.emp.manager.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerLeaveController {
	
	@Autowired
	private ManagerLeaveMapper managerLeaveMapper; 
	
	/* 연차적립 실행 */
	@PostMapping("/annualCreate")
	public ModelAndView annualCreate(String year_month, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		/* 당월 연차가 적립되었는지 확인 */
		String yyyymm = year_month.substring(0, 7);
		
		int annualContains = managerLeaveMapper.annualContains(yyyymm);
		if(annualContains > 0) {
			mav.addObject("annualBTN", true);
			mav.addObject("manager", manager);
			mav.addObject("annualContains", yyyymm + "에 이미 " + annualContains + " 명의 연차 정보가 업데이트 되어있습니다.");
			mav.setViewName("manager/manager");
			return mav;
		}
		
		/* 업데이트된 직원수가 리턴된다. */
		int leave_upd_cnt =  managerLeaveMapper.annualCreate(year_month);
		
		mav.addObject("annualBTN", true);
		mav.addObject("manager", manager);
		mav.addObject("leave_upd_cnt", leave_upd_cnt);
		mav.setViewName("manager/manager");
		return mav;
	}

}
