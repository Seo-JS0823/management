package com.emp.manager.employee;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;

@Mapper
public interface MngEmployeeMapper {
	
	/* 직원 등록 */
	void employeeInsert(EmployeeDTO employee);
	
	
	/* 이미 등록된 직원인지 검증 */
	int employeeEquals(EmployeeDTO employee);
	
	/* 관리자 회원가입 */
	void managerInsert(EmployeeDTO employee);
	
	/* 부서 담당자가 있는지 확인 1 = 있다 , 0 = 없다 */
	int managerContains(EmployeeDTO employee);
	
	/* 부서 담당자 변경 */
	void managerUpdate(EmployeeDTO employee);
	
	/* 직원 DELETE */
	int employeeDelete(EmployeeDTO employee);
}
