package com.emp.manager.employee;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveDTO;
import com.emp.employ.leave.LeaveEmpDTO;

@Mapper
public interface ManagerLeaveMapper {
	
	/* 적립할 연차 직원 검색 */
	EmployeeDTO annualEmp(String name, int department_id);
	
	/* 연차 적립 */
	int annualInsert(LeaveDTO target);
	
	/* 연차적립 대상의 정보 불러오기 */
	EmployeeDTO leaveTarget(LeaveDTO target);
	
	/* 연차 적립 내역 조회 */
	List<LeaveEmpDTO> getLeaveSortList(String search ,String sort, String sortType);
	
}
