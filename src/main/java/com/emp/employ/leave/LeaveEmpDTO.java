package com.emp.employ.leave;

import lombok.Data;

@Data
public class LeaveEmpDTO {
	
	private Integer leave_id;
	private String name;
	private String department_name;
	private String leave_date;
	private Integer leave_count;
	private String content;
	
}
