package com.emp.manager.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveDTO;
import com.emp.employ.leave.LeaveMapper;
import com.emp.employ.leave.LeaveReqDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerLeaveController {
	
	@Autowired
	private ManagerLeaveMapper managerLeaveMapper; 
	
	@Autowired
	private LeaveMapper leaveMapper;
	
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
		
		if(annual > 0) {
			mav.addObject("annualSuccess", "연차가 적립되었습니다.");
		}
		
		mav.setViewName("manager/annualCreate");
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
	
	/* 
	 * 백승목
	 * 관리자 : 직원 휴가 신청리스트 */
	@RequestMapping("/showLeaveReqList")
	public ModelAndView showLRL() {
		ModelAndView mav = new ModelAndView();
		List<LeaveReqDTO> leaveReqList = leaveMapper.getLeaveReqList();
		
		mav.addObject("leaveReqList", leaveReqList);
		mav.setViewName("manager/leaveReqList");
		return mav;
	}
	
	/* 
	 * 백승목
	 * 관리자 : 직원 휴가신청서 상세정보 */
	@RequestMapping("/showLeaveDetail")     //seq
	public ModelAndView leaveDetail(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		leaveReqDTO = leaveMapper.leaveDetail(leaveReqDTO);
		System.out.println("직원의 휴가 상세정보 : " + leaveReqDTO);
		/*
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		if(employee == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		mav.addObject("employee", employee);
		*/
		mav.addObject("leaveDetail", leaveReqDTO);
		mav.setViewName("manager/leaveRead");
		return mav;
	}
	
	/*
	 * 백승목
	 * 관리자 : 휴가 승인
	 */
	@RequestMapping("/leaveAgree") // 필요한값 seq, 넘어온값 : *
	public ModelAndView agree(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		leaveMapper.leaveAgree(leaveReqDTO);
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
	/*
	 * 백승목
	 * 관리자 : 휴가 반려
	 */
	@RequestMapping("/leaveRefuse") // 필요한값 seq, 넘어온값 : *
	public ModelAndView Refuse(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		leaveMapper.leaveRefuse(leaveReqDTO);
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
}
