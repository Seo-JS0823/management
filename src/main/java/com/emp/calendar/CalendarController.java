package com.emp.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.manager.employee.MngEmployeeMapper;

@RestController
public class CalendarController {
	
	@Autowired
	private MngEmployeeMapper mngEmpMapper;
	
	@GetMapping("/api/leaveList")
	public List<EmployeeDTO> leaveList(String start, String end) {
		
		String startDate = start.substring(0, 10);
		
		String endDate = end.substring(0, 10);
		
		return mngEmpMapper.monthLeaveEmp(startDate, endDate);
	}
}
