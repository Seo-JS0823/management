package com.emp.manager.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.util.EmployeeID;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerEmployeeController {

	@Autowired
	private MngEmployeeMapper mngEmpMapper;
	
	/* 관리자 메인 페이지 보여주기 - 서주성 - */
	@GetMapping("/mngindex")
	public ModelAndView manageForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		if(manager == null) {
			session.invalidate();
			mav.setViewName("redirect:/");
			return mav;
		}
		
		/* 출석 중복 여부 확인 */
		if(manager.isStartContains()) {
			mav.addObject("startContains", manager.getName());
			manager.setStartContains(false);
		}
		
		/* 퇴근 중복 여부 확인 */
		if(manager.isEndContains()) {
			mav.addObject("endContains", manager.getName());
			manager.setEndContains(false);
		}
		
		/* 퇴근체크 전 출석체크 여부 확인 */
		if(manager.isStartNot()) {
			mav.addObject("startNot", true);
			manager.setStartNot(false);
		}
		
		/* 당일 부서별 출근한 직원수 */
		int nowWorkEmpCount = mngEmpMapper.nowPartEmpCount(manager.getDepartment_id());
		/* 자기 부서 직원수 */
		int departAllEmpCount = mngEmpMapper.departAllEmpCount(manager.getDepartment_id());
		/* 출근율 퍼센테이지 */
		String per = String.format("%.1f", ((double) nowWorkEmpCount / (double) departAllEmpCount) * 100);
		/* 당일 기준 담당자의 부서별 휴가자 인원 구하기 */
		int nowLeaveEmp = mngEmpMapper.nowLeaveEmp(manager);
		/* 담당 부서의 휴가 승인 대기건 조회 */
		int leaveAgreeCount = mngEmpMapper.leaveAgreeCount(manager);
		
		
		mav.addObject("leaveAgreeCount", leaveAgreeCount);
		mav.addObject("nowLeaveEmp", nowLeaveEmp);
		mav.addObject("per", per);
		mav.addObject("allEmpCount", departAllEmpCount);
		mav.addObject("nowWorkEmpCount", nowWorkEmpCount);
		mav.addObject("manager", manager);
		mav.setViewName("manager/manager");
		return mav;
	}
	
	/* 직원 등록 페이지 보여주기 - 서주성 - */
	@GetMapping("/empView")
	public ModelAndView empForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/empCreate");
		return mav;
	}
	
	/* 직원 등록 실행 - 서주성 - */
	@PostMapping("/empCreate")
	public ModelAndView empC(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(employee.getName());
		
		int equals = mngEmpMapper.employeeEquals(employee);
		if(equals != 0) {
			mav.addObject("equals", "이미 등록된 직원입니다.");
			mav.setViewName("manager/empCreate");
			return mav;
		}
		
		String id = "";
		String password = "";
		try {
			id = employee.getDepartment_id() + EmployeeID.createEmpID(
					new SimpleDateFormat("yyyy-mm-dd").parse(employee.getBirthdate()),
					new SimpleDateFormat("yyyy-mm-dd").parse(employee.getEmployment_date()));
			password = employee.getBirthdate().replaceAll("-", "");
			
		} catch (ParseException e) {
			e.printStackTrace();
			throw new IllegalStateException("Parsing Error : " + e.getMessage());
		}
		employee.setEmployee_id(id);
		employee.setPassword(password);
		
		mngEmpMapper.employeeInsert(employee);
		
		/* 보여줄 페이지 */
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
	/* 직원 목록 페이지 보여주기 */
	@GetMapping("/empListView")
	public ModelAndView empListView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/empList");
		return mav;
	}
	
	/* 직원 검색 */
	@PostMapping("/empList")
	public ModelAndView empList(String search) {
		ModelAndView mav = new ModelAndView();
		
		/* 직원검색 리스트 조회 */
		List<EmployeeDTO> empList = mngEmpMapper.searchEmp(search);
		
		
		mav.addObject("count", empList.size() + " 명");
		mav.addObject("target", empList);
		mav.setViewName("manager/empList");
		return mav;
	}
	
	/* 휴가자 조회 페이지 */
	@GetMapping("/nowLeaveView")
	public ModelAndView nowLeave() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/leaveNow");
		return mav;
	}
	
	/* 퇴사자로 등록 */
	@PostMapping("/empExit")
	public ModelAndView empExit(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/manage/mngindex");
		return mav;
	}
	
}
