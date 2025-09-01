package com.emp.employ.lateness;

public class LatenessDTO {

    private String employee_id;
    private String ness_date;
    private String created_date;
    private int atte_flag;
    private String content;
    private int status;
	/*
	지각/결석/조퇴사유서 DTO
	employee_id : 사번
	created_date: 사유서 작성 날짜
	ness_date   : 발생 날짜
	type        : 신청 타입 (조퇴, 결근. ...)
	content     : 사유서 내용
	status      : 승인/미승인 상태 플래그
	            : 0 = 미승인 , 1 = 승인
	 */
    
    /* 이동할수도 있는 내용들 */
    private String name;
    private String department;
    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

    // 이동하지 않는 항목	
    
    // Getter and Setter for employee_id
    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    // Getter and Setter for ness_date
    public String getNess_date() {
		return ness_date;
	}

	public void setNess_date(String ness_date) {
		this.ness_date = ness_date;
	} 

    // Getter and Setter for content
    public String getContent() {
        return content;
    }


	public void setContent(String content) {
        this.content = content;
    }

    // Getter and Setter for status
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
    	this.status = status;
    }
    
    // Getter and Setter for Atte_flag
    public int getAtte_flag() {
		return atte_flag;
	}

	public void setAtte_flag(int atte_flag) {
		this.atte_flag = atte_flag;
	}

    // Getter and Setter for created_date
	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}


}