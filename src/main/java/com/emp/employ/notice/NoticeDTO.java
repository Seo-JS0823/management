package com.emp.employ.notice;

public class NoticeDTO {
    private int posting_num;
    private int department_id;
    private String department_name;
    private String manager_id;
    private String manager_name;
    private String title;
    private String content;
    private String posting_date;

    
    public NoticeDTO() {}

	public int getPosting_num() {
		return posting_num;
	}

	public void setPosting_num(int posting_num) {
		this.posting_num = posting_num;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPosting_date() {
		return posting_date;
	}

	public void setPosting_date(String posting_date) {
		this.posting_date = posting_date;
	}

	@Override
	public String toString() {
		return "NoticeDTO [posting_num=" + posting_num + ", department_id=" + department_id + ", department_name="
				+ department_name + ", manager_id=" + manager_id + ", manager_name=" + manager_name + ", title=" + title
				+ ", content=" + content + ", posting_date=" + posting_date + "]";
	}


    
    
}
