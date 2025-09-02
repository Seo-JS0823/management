package com.emp.manager.employee;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.atted.AttedDTO;
import com.emp.employ.employee.EmployeeDTO;
import com.emp.employ.leave.LeaveEmpDTO;

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
	
	/* 퇴사자로 등록 */
	int empExit(String employee_id);
	
	/* 퇴사자로 등록된 직원 이름 조회 */
	String getDelEmp(String employee_id);
	
	/* 실수로 퇴사등록을 잘못했을 경우 복구 */
	int empExitReset(String employee_id);
	
	/* 연차적립 내역 상세 보기 */
	LeaveEmpDTO getAnnualDetail(Integer leave_id);
	
	/* 연차적립 내역 수정 하기 */
	int annaulUpdate(LeaveEmpDTO leave);
	
	/* 연차적립 삭제 */
	int annualDelete(Integer leave_id);
	
	/* 부서별 출/퇴근 조회 */
	List<AttedDTO> getPartAttedList(int department_id, String start, String end, String sort);
	
	/* 부서별 페이징 출/퇴근 조회 */
	List<AttedDTO> getPagingPartAttedList(int department_id, String start, String end, String sort, int offset, int recordSize);
	
	/* 당일 부서 출근한 인원 정보 조회 */
	List<AttedDTO> partEmpList(int department_id);
	
	/* 자기 부서 직원 정보 */
	List<EmployeeDTO> mePartEmpList(int department_id);
	
	/*  */
	int partEmpChg(String employee_id, int department_id);
	
	/* 부서 이동을 위한 직원 SELECT */
	List<EmployeeDTO> getPartEmpList(int department_id);
	
	/* 직원의 부서 이동 UPDATE */
	int empPartChange(int department_id, String employee_id);
	
}











