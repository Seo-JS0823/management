package com.emp.manager.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.atted.AttedDTO;
import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveEmpDTO;
import com.emp.util.EmployeeID;
import com.emp.util.Paging;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage")
public class ManagerEmployeeController {

	@Autowired
	private MngEmployeeMapper mngEmpMapper;
	
	@Autowired
	private ManagerLeaveMapper leaveMapper;
	
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
		
		/* 퇴근 체크 알림 */
		if(manager.getEndSuccess() != null) {
			mav.addObject("endSuccess", manager.getEndSuccess());
			manager.setEndSuccess(null);
		}
		
		/* 출석 체크 알림 */
		if(manager.getAttedStartSuccess() != null) {
			mav.addObject("attedStartSuccess", manager.getAttedStartSuccess());
			manager.setAttedStartSuccess(null);
		}
		
		/* 당일 부서별 출근한 직원수 */
		int nowWorkEmpCount = mngEmpMapper.nowPartEmpCount(manager.getDepartment_id());
		
		/* 당일 부서별 출근한 직원 정보 */
		List<AttedDTO> partEmpList = mngEmpMapper.partEmpList(manager.getDepartment_id());
		
		if(partEmpList.size() != 0) {
			mav.addObject("partEmp", partEmpList);
		}
		
		/* 자기 부서 직원수 */
		int departAllEmpCount = mngEmpMapper.departAllEmpCount(manager.getDepartment_id());
		/* 출근율 퍼센테이지 */
		String per = String.format("%.1f", ((double) nowWorkEmpCount / (double) departAllEmpCount) * 100);
		/* 당일 기준 담당자의 부서별 휴가자 인원 구하기 */
		int nowLeaveEmp = mngEmpMapper.nowLeaveEmp(manager);
		
		System.out.println(nowLeaveEmp);
		
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
		
		if(search.startsWith("퇴")) {
			search = "퇴사";
		}
		
		/* 직원검색 리스트 조회 */
		List<EmployeeDTO> empList = mngEmpMapper.searchEmp(search);
		
		if(search.startsWith("퇴")) {
			mav.addObject("exit", true);
		}
		
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
	public ModelAndView empExit(String employee_id) {
		ModelAndView mav = new ModelAndView();
		
		int del = mngEmpMapper.empExit(employee_id);
		
		String delName = mngEmpMapper.getDelEmp(employee_id);
		
		if(del > 0) {
			mav.addObject("del", delName);
		}
		
		mav.setViewName("manager/empList");
		return mav;
	}
	
	/* 퇴사등록 철회 */
	@PostMapping("/empExitReset")
	public ModelAndView empExitReset(String employee_id) {
		ModelAndView mav = new ModelAndView();
		
		int reset = mngEmpMapper.empExitReset(employee_id);
		
		String resetName = mngEmpMapper.getDelEmp(employee_id);
		
		if(reset > 0) {
			mav.addObject("reset", resetName);
		}
		
		mav.setViewName("manager/empList");
		return mav;
	}
	
	/* 연차 적립 내역 조회 페이지 */
	@GetMapping("/annualReadView")
	public ModelAndView annualReadView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("manager/leaveHistory");
		return mav;
	}
	
	/* 연차 적립 내역 조회 search sort sortType */
	@PostMapping("/annualRead")
	public ModelAndView annualRead(String search, String sort, String sortType) {
		ModelAndView mav = new ModelAndView();
		
		List<LeaveEmpDTO> getLeaveList = leaveMapper.getLeaveSortList(search, sort, sortType);
		
		mav.addObject("leaves", getLeaveList);
		mav.setViewName("manager/leaveHistory");
		return mav;
	}
	
	/* 연차 적립 내역 상세보기 View */
	@GetMapping("/annualUpdateView")
	public ModelAndView annualUpdateView(Integer leave_id) {
		ModelAndView mav = new ModelAndView();
		
		LeaveEmpDTO leaveTarget = mngEmpMapper.getAnnualDetail(leave_id);
		
		mav.addObject("annual", leaveTarget);
		mav.addObject("leave_id", leave_id);
		mav.setViewName("manager/annualDetail");
		return mav;
	}
	
	/* 연차 적립 */
	@PostMapping("/annualUpdate")
	public ModelAndView annualUpdate(LeaveEmpDTO leave) {
		ModelAndView mav = new ModelAndView();
		
		int upCount = mngEmpMapper.annaulUpdate(leave);
		
		
		LeaveEmpDTO leaveTarget = mngEmpMapper.getAnnualDetail(leave.getLeave_id());
		
		if(upCount > 0) {
			mav.addObject("clear", leaveTarget.getName());			
		}
		
		mav.addObject("annual", leaveTarget);
		mav.setViewName("manager/annualDetail");
		return mav;
	}
	
	/* 연차 삭제 */
	@PostMapping("/annualDel")
	public ModelAndView annualDelete(Integer leave_id) {
		ModelAndView mav = new ModelAndView();
		
		mngEmpMapper.annualDelete(leave_id);
		
		mav.setViewName("redirect:/manage/annualReadView");
		return mav;
	}
	
	/* 부서별 출퇴근 기록부 View */
	@GetMapping("/attedListView")
	public ModelAndView departAttedView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		mav.addObject("manager", manager);
		mav.setViewName("manager/departAttedList");
		return mav;
	}
	
	/* 부서별 출퇴근 기록부 페이징 search */
	@RequestMapping("/partAttedList")
	public ModelAndView partAttedList(HttpSession session, int nowPage, String start, String end, String sort) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		List<AttedDTO> employees = mngEmpMapper.getPartAttedList(manager.getDepartment_id(), start, end, sort);
		
		/* 출력된 것 없을 때 */
		if(employees.size() == 0) {
			mav.addObject("zero", "검색된 기록이 없습니다.");
			mav.setViewName("manager/departAttedList");
			return mav;
		}
		
		Paging<AttedDTO> paging = null;
		
		int offset = 0;
		int recordSize = 5;
		
		List<AttedDTO> pagingList = null;
		
		Map<String, Integer> pagingNum = null;
		
		if(employees.size() != 0) {
			int totalRecordSize = employees.size();
			paging = new Paging<>(nowPage, 15, totalRecordSize, 5, 1);
			
			offset = paging.getOffset();
			recordSize = paging.getRecordSize();
			
			pagingList = mngEmpMapper.getPagingPartAttedList(manager.getDepartment_id(), start, end, sort, offset, recordSize);
			
			paging.setList(pagingList);
			
			pagingNum = paging.getPagingMap();
			
			mav.addObject("sort", sort);
			mav.addObject("employees", pagingList);
			mav.addObject("start", start);
			mav.addObject("end", end);
			mav.addObject("manager", manager);
			mav.addObject("paging", pagingNum);
		}
		
		mav.setViewName("manager/departAttedList");
		return mav;
	}
	
	/* 관리자 변경 View */
	@GetMapping("/managerChangeView")
	public ModelAndView managerChangeView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		List<EmployeeDTO> list = mngEmpMapper.mePartEmpList(manager.getDepartment_id());
		
		if(list.size() != 0) {
			mav.addObject("employees", list);					
		}
		
		mav.setViewName("manager/change");
		return mav;
	}
	
	/* 관리자 변경 로직 */
	@PostMapping("/empPartChg")
	public ModelAndView empPartChg(HttpSession session, String employee_id) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		int department_id = manager.getDepartment_id();
		
		int updated = mngEmpMapper.partEmpChg(employee_id, department_id);
		
		if(updated != 0) {
			session.invalidate();
			mav.addObject("partChg", "담당자가 변경 되었습니다. 다시 로그인 하세요.");
			mav.setViewName("index/login");
			return mav;			
		}
		
		mav.addObject("partNoChg", "오류로 인해 부서 담당자를 변경할 수 없습니다.");
		mav.setViewName("manage/change");
		return mav;
	}
	
	/* 직원 부서 이동 페이지 */
	@GetMapping("/empPartChangeView")
	public ModelAndView empPartChangeView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO manager = (EmployeeDTO) session.getAttribute("manager");
		
		List<EmployeeDTO> list = mngEmpMapper.getPartEmpList(manager.getDepartment_id());
		
		mav.addObject("partEmps", list);
		mav.setViewName("manager/empPartChange");
		return mav;
	}
	
	/* 직원의 부서 이동 실행 */
	@PostMapping("/empPartChange")
	public ModelAndView empPartChange(int department_id, String employee_id) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(department_id);
		System.out.println(employee_id);
		
		int updated = mngEmpMapper.empPartChange(department_id, employee_id);
		
		if(updated != 0) {
			mav.addObject("clear", "해당 직원의 부서 정보가 변경되었습니다.");
		}
		
		mav.setViewName("manager/empPartChange");
		return mav;
	}
	
}
