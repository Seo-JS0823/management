package com.emp.manager.employee;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeMapper {
	
	/* 직원 등록 */
	public void employeeInsert(EmployeeDTO employee);
	
	
	
}
