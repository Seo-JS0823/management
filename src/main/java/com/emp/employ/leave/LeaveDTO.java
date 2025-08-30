package com.emp.employ.leave;

public class LeaveDTO {
	/*
	직원에 해당하는 연차 DTO
	leave_id    : 적립ID
	employee_id : 사번
	leave_date  : 연차를 적립한 날짜
	leave_type  : 'ACCUMULATE' : 적립, 'USE' : 사용
	leave_count : 연차 적립 / 연차 사용
	content     : 연차 적립 사유
	work_month  : 한 달 만근으로 할 시
	 */
	private int leave_id;
	private String employee_id;
	private String leave_date;
	private String leave_type;
	private int leave_count;
	private String work_month;
	private String content;
	
	public LeaveDTO() {}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}

	public String getLeave_type() {
		return leave_type;
	}

	public void setLeave_type(String leave_type) {
		this.leave_type = leave_type;
	}

	public int getLeave_count() {
		return leave_count;
	}

	public void setLeave_count(int leave_count) {
		this.leave_count = leave_count;
	}

	public String getWork_month() {
		return work_month;
	}

	public void setWork_month(String work_month) {
		this.work_month = work_month;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLeave_id() {
		return leave_id;
	}

	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}
	
	
	
}
