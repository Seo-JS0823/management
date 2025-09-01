package com.emp.employ.leave;

import lombok.Data;

@Data
public class LeaveEmpDTO {
	
	private int leave_id;
	private String name;
	private String department_name;
	private String manager_name;
	private String position_name;
	private String employment_date;
	private String leave_date;
	private int leave_count;
	private String content;
	
}
