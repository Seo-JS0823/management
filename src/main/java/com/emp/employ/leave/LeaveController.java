package com.emp.employ.leave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	@Autowired
	private LeaveMapper leaveMapper;
	
	@Autowired
	private OtMapper otMapper;
	
	/* 
	 * 백승목
	 * 휴가 / 초과근무 View 보여주기
	 * 메서드 이름 : leaveView 
	 */
	@RequestMapping("/leaveView")
	public ModelAndView leaveView(String employee_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO target = (EmployeeDTO) session.getAttribute("employee");
		
		System.out.println(employee_id);
		
		mav.addObject("employee_id",employee_id);
		mav.addObject("employee",target);
		mav.setViewName("emp/leaveReq");
		return mav;
	}
	
	/*
	 * 백승목
	 * 휴가 신청 로직
	 * 메서드 이름 : leaveCreate
	 */
	@RequestMapping("/leaveReqFinish")
	public ModelAndView leaveCreate(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		System.out.println(leaveReqDTO);
			
		// 신청 누르면 leave_history 테이블에 값추가(status=0) 
		leaveMapper.insertLeave(leaveReqDTO);
		
		mav.setViewName("redirect:/emp/empView");
		return mav;
	}

	
	/*
	 * 백승목
	 * 휴가 신청 내역 조회
	 * 메서드 이름 : leaveRead
	 */
	@RequestMapping("/leaveReqHistoryList") //employee_id - hidden 으로 employee_id 를 넘겨줘야함 혹 session
	public ModelAndView leaveReqHistoryList(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		// 본인이 신청한 휴가기록들 갖고오기 leaveHistoryList = seq, employee_id, leave_date, status
		List<LeaveReqDTO> leaveHistoryList = leaveMapper.getLeaveHistoryList(leaveReqDTO);
		System.out.println("본인 휴가신청 리스트" + leaveHistoryList);
		
		mav.addObject("leaveHistoryList", leaveHistoryList);
		mav.setViewName("emp/leaveHistoryList");
		return mav;
	}
	
	/*
	 * 백승목
	 * 직원 : 본인 해당 휴가신청서 상세정보 페이지 이동
	 */ 
	@RequestMapping("/leaveReqHistory")         // seq
	public ModelAndView leaveHistory(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		// 신청서 작성한거 상세정보 가져오기 leaveReqDTO = *
		leaveReqDTO = leaveMapper.leaveDetail(leaveReqDTO);
		
		mav.addObject("leaveReqDTO",leaveReqDTO);
		mav.setViewName("emp/empLeaveUpdate");
		return mav;
	}
	
	/*
	 * 백승목
	 * 직원 : 휴가 신청 내역 수정
	 * 메서드 이름 : leaveUpdate
	 */
	// 직원이 수정
	@RequestMapping("/leaveUpdate")              // *
	public ModelAndView leaveUpdate(LeaveReqDTO leaveReqDTO) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("휴가 수정값 : " + leaveReqDTO);
		leaveMapper.empLeaveUpdate(leaveReqDTO);
		
		mav.setViewName("redirect:/");
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
