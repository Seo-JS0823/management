package com.emp.employ.atted;

public class AttendanceDTO {
	/*
	출퇴근 기록 DTO
	
	currentDate : 현재 날짜
	employee_id : 사번
	atte_start  : 출근한 시각
	atte_end    : 퇴근한 시각
	work_time   : 당일 총 근무 시간
	atte_flag   : 근무 상태 플래그
				  0 = 정상출근
				  1 = 정상퇴근
				  2 = 조퇴
				  3 = 지각
				  4 = 결석
				  
	atte_flag   : 현재 시간 9시 넘어서 출석 체크가 되면 지각 처리
				: 정해진 퇴근 시간까지 출석 체크가 되지 않으면 결근 처리
				: 정해진 퇴근 시간이후 퇴근 체크가 되면 정상퇴근 처리
				: 정해진 출근 시간이전 출석 체크가 되면 정상출근 처리
	
	조퇴한 시간은 삭제
	 */
}
