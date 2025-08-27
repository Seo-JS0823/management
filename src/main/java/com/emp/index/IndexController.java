package com.emp.index;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.employee.EmployeeMapper;
import com.emp.manager.employee.MngEmployeeMapper;
import com.emp.util.EmployeeID;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@Autowired
	private MngEmployeeMapper mngEmpMapper;
	
	/* 루트 경로 */
	@GetMapping("/")
	public ModelAndView indexView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		boolean valueManager = session.getAttribute("valueManager") != null;
		boolean valueEmployee = session.getAttribute("valueEmployee") != null;
		
		/*
		if(valueManager) {
			mav.setViewName("redirect:/manage/mngindex");
			return mav;
		}
		
		if(valueEmployee) {
			mav.setViewName("redirect:/emp/empView");
			return mav;
		}
		*/
		
		mav.setViewName("index/login");
		return mav;
	}
	
	/* 회원가입 페이지 경로 */
	@GetMapping("/joinView")
	public ModelAndView joinView() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("index/join");
		return mav;
	}
	
	/* 로그인 실행 */
	@PostMapping("/login")
	public ModelAndView login(EmployeeDTO employee, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO target = empMapper.login(employee);
		int manager = empMapper.managerEquals(employee);
		
		/* 존재하지 않는 직원일시 다시 로그인 페이지로 보내기 */
		if(target == null) {
			session.invalidate();
			mav.addObject("notEmp", "존재하지 않는 직원입니다.");
			mav.setViewName("index/login");
			return mav;
		}
		
		/* 로그인한 직원이 인사담당자인 경우 연차 적립 버튼생성 */
		int hrPart = mngEmpMapper.hrPart(target);
		if(hrPart == 1) {
			session.setAttribute("valueManager", true);
			session.setAttribute("valueEmployee", true);
			session.setAttribute("manager", target);
			session.setAttribute("employee", target);
			mav.addObject("annualBTN", true);
			mav.addObject("manager", target);
			mav.setViewName("manager/manager");
			return mav;
		}
		
		/* 로그인한 유저가 담당자인 경우 보여주는 페이지 */
		/* 담당자도 직원 기능을 사용할 수 있으니 "employee" session을 넣는다. */
		if(manager != 0) {
			session.setAttribute("valueManager", true);
			session.setAttribute("valueEmployee", true);
			session.setAttribute("manager", target);
			session.setAttribute("employee", target);
			mav.addObject("manager", target);
			mav.setViewName("manager/manager");
			return mav;
		}
		
		/* 로그인한 유저가 직원인 경우 보여주는 페이지 */
		session.setAttribute("valueEmployee", true);
		session.setAttribute("employee", target);
		mav.addObject("employee", target);
		mav.setViewName("emp/empDash");
		return mav;
	}
	
	/* 회원가입 실행 */
	@PostMapping("/join")
	public ModelAndView join(EmployeeDTO employee) {
		ModelAndView mav = new ModelAndView();
		
		/* 이미 등록되어 있을 경우 */
		int equals = mngEmpMapper.employeeEquals(employee);
		if(equals != 0) {
			mav.addObject("equals", "이미 등록된 직원입니다.");
			mav.setViewName("index/join");
			return mav;
		}
		
		/* 사번 코드 생성 + 비밀번호 생성 */
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
		
		/* 우선 직원으로 등록 */
		mngEmpMapper.employeeInsert(employee);
		
		/* 해당 직원을 부서장으로 지정하기 부서 담당자가 존재하는지 확인 */
		int managerContains = mngEmpMapper.managerContains(employee);
		if(managerContains == 1) {
			mngEmpMapper.employeeDelete(employee);
			mav.addObject("empDelete", "부서장이 존재합니다. 담당 부서장에게 변경을 요청하세요.");
			mav.setViewName("index/join");
			return mav;
		}
		
		/* 부서 담당자가 없을 경우 부서장 변경 로직 실행 */
		mngEmpMapper.managerUpdate(employee);
		
		/* 로그인 페이지 모달창에 보여줄 부여된 사번코드와 비밀번호 */
		mav.addObject("managerSuccess", "사번코드는 " + employee.getEmployee_id() + 
				" 입니다. <br>비밀번호는 자신의 생년월일 8자리 " + employee.getPassword() + " 입니다.");
		mav.setViewName("index/login");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
