package com.emp.employ.leave;

import lombok.Data;

@Data
public class LeaveDTO {
	/*
	직원에 해당하는 연차 DTO
	employee_id : 사번
	leave_date  : 연차를 적립한 날짜
	leave_type  : 'ACCUMULATE' : 적립, 'USE' : 사용
	leave_count : 연차 적립 / 연차 사용
	atted_date  : 한 달 만근으로 할 시
	content     : 연차 적립 사유
	 */
	private String employee_id;
	private String leave_date;
	private String leave_type;
	private int leave_count;
	private String atted_date;
	private String content;
	
}
