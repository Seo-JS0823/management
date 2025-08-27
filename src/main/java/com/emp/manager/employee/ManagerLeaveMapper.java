package com.emp.manager.employee;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveDTO;

@Mapper
public interface ManagerLeaveMapper {
	
	/* 적립할 연차 직원 검색 */
	EmployeeDTO annualEmp(String name);
	
	/* 연차 적립 */
	int annualInsert(LeaveDTO target);
	
}
