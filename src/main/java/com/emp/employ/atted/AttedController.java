package com.emp.employ.atted;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.util.Paging;

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
				employee.setStartContains(true);
				session.setAttribute("manager", employee);
				mav.setViewName("redirect:/manage/mngindex");
				return mav;
			}
			
			/* 직원인 경우 직원 페이지로 */
			employee.setStartContains(true);
			session.setAttribute("employee", employee);
			mav.setViewName("redirect:/emp/empView");
			return mav;
		}
		
		AttedDTO target = atted;
		attedService.atteStartFlag(target);
		attedMapper.atteStart(target);
		
		/* 출석체크한 사람이 관리자라면 관리자 페이지로 이동 */
		if(manager) {
			employee.setAttedStartSuccess(target.getAtte_start());
			session.setAttribute("manager", employee);
			mav.setViewName("redirect:/manage/mngindex");
			return mav;
		}
		
		employee.setAttedStartSuccess(target.getAtte_start());
		session.setAttribute("employee", employee);
		mav.setViewName("redirect:/emp/empView");
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
				employee.setEndContains(true);
				mav.setViewName("redirect:/manage/mngindex");
				return mav;
			}
			
			employee.setEndContains(true);
			mav.setViewName("redirect:/emp/empView");
			return mav;
		}
		
		AttedDTO target = atted;
		AttedDTO atte_start = attedMapper.atteEndContains(atted);

		/* 퇴근체크 버튼을 눌렀는데 당일 출석체크를 하지 않은 경우 */
		if(atte_start == null) {
			if(manager) {
				employee.setStartNot(true);
				mav.setViewName("redirect:/manage/mngindex");
				return mav;
			}
			
			employee.setStartNot(true);
			mav.setViewName("redirect:/emp/empView");
			return mav;
		}
		
		target.setAtte_start(atte_start.getAtte_start());
		
		attedService.atteEndFlag(target);
		
		/* 출석 체크를 했었다면 Update 실행 */
		attedMapper.atteEndUpdate(target);
		
		if(manager) {
			employee.setEndSuccess(target.getAtte_end());
			session.setAttribute("manager", employee);
			mav.setViewName("redirect:/manage/mngindex");
			return mav;
		}
		
		employee.setEndSuccess(target.getAtte_end());
		session.setAttribute("employee", employee);
		mav.setViewName("redirect:/emp/empView");
		return mav;
	}
	
	/* 직원 자신의 출/퇴근 기록 페이지 보여주기 */
	@GetMapping("/empAttedView")
	public ModelAndView empAttedView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		mav.addObject("emp", employee);
		mav.setViewName("emp/empAttedList");
		return mav;
	}
	
	/* 직원 자신의 출/퇴근 기록 검색 */
	@RequestMapping("/empAttedList")
	public ModelAndView empAttedList(int nowPage ,String start, String end, String sort, Integer search,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(search == null) {
			search = 1;
		}
		
		EmployeeDTO employee = (EmployeeDTO) session.getAttribute("employee");
		
		List<AttedDTO> getAttedList = attedMapper.getAttedList(start, end, search, employee.getEmployee_id());
		
		Paging<AttedDTO> paging = null;
		
		int offset = 0;
		int recordSize = 5;
		
		List<AttedDTO> pagingList = null;
		
		Map<String, Integer> pagingNum = null;
		if(getAttedList.size() != 0) {
			int totalRecordSize = getAttedList.size();
			paging = new Paging<>(nowPage, 10, totalRecordSize, 5, 1); 
			
			offset = paging.getOffset();
			recordSize = paging.getRecordSize();
			
			pagingList = attedMapper.getPagingAttedList(start, end, employee.getEmployee_id(), sort, search, offset, recordSize);
			
			paging.setList(pagingList);
			
			pagingNum = paging.getPagingMap();
			
			mav.addObject("sort", sort);
			mav.addObject("search", search);
			mav.addObject("emp", employee);
			mav.addObject("start", start);
			mav.addObject("end", end);
			mav.addObject("list", pagingList);
			mav.addObject("paging", pagingNum);
		} else {
			mav.addObject("zero", "검색된 기록이 없습니다.");
		}
		
		mav.setViewName("emp/empAttedList");
		return mav;
	}
	
}
