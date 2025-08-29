package com.emp.manager.employee;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	/* 로그인한 담당자 */
	int hrPart(EmployeeDTO employee);
	
	/* 검색어 입력 직원 목록 조회 */
	List<EmployeeDTO> searchEmp(String search);
	
	/* 당일 출근 인원 카운트 */
	int nowWorkEmpCount();
	
	/* 부서별 출근 인원 카운트 */
	int nowPartEmpCount(int department_id);
	
	/* 총 직원 수 카운트 */
	int allEmpCount();
	
	/* 자기 부서 직원수 카운트 */
	int departAllEmpCount(int department_id);
	
	/* 당일 기준 담당자 부서별 휴가나가있는 인원 조회 */
	int nowLeaveEmp(EmployeeDTO manager);
	
	/* 관리자의 휴가 승인 대기건 조회 */
	int leaveAgreeCount(EmployeeDTO employee);
	
	/* 휴가기록 모두 조회 */
	List<EmployeeDTO> allLeaveEmp();
	
	/* 월별 휴가자 조회 */
	List<EmployeeDTO> monthLeaveEmp(String start, String end);
	
}
