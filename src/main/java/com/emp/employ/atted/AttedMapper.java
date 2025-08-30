package com.emp.employ.atted;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;

@Mapper
public interface AttedMapper {
	
	/* 출석 체크 로직 */
	void atteStart(AttedDTO atted);
	
	/* 퇴근 체크하기 전에 출석 체크 했는지 확인 */
	/* 이거 당일 출석 체크 했는지 확인할 때도 씀 */
	/* 1 = 출석 체크했음 , 0 = 출석 체크 안했음 */
	AttedDTO atteEndContains(AttedDTO atted);
	
	/* 퇴근 체크 로직 : UPDATE */
	void atteEndUpdate(AttedDTO atted);
	
	/* 퇴근 체크 중복 막기 */
	int atteEndStop(AttedDTO atted);
	
	/* 당일 출근한 시간 조회 */
	String attedNowStart(EmployeeDTO employee);
	
	/* 올해 근무한 일수 계산 */
	int allWorkCount(EmployeeDTO employee);
	
	/* 직원 본인의 출/퇴근 기록 조회 */
	List<AttedDTO> getAttedList(String start, String end, int search, String employee_id);
	
	/* 직원 본인의 페이징 출/퇴근 기록 조회 */
	List<AttedDTO> getPagingAttedList(String start, String end, String employee_id, String sort, int search,int offset, int recordSize);
}
