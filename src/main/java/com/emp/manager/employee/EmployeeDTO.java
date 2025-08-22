package com.emp.manager.employee;

public class EmployeeDTO {
	
	/*
	employee_id		사번
	department_id	부서
	worktype_id		근무형태 코드
	position_id		직급 코드
	name			이름
	gender			성별
	birthdate		생년월일
	email			이메일
	address			주소
	employment_date	입사일
	emp_flag		재직 상태 플래그 0=퇴사, 1=재직
	
	<SELECT 검색용>
	address_id		주소 ID
	*/
	
	private String employee_id;
	private int department_id;
	private int worktype_id;
	private int position_id;
	private String name;
	private String gender;
	private String birthdate;
	private String phone_num;
	private String email;
	private String address;
	private String employment_date;
	private int emp_flag;
	private int address_id;
	
	public EmployeeDTO() {}
	
	/* Setter 영역 */
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public void setWorktype_id(int worktype_id) {
		this.worktype_id = worktype_id;
	}

	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmployment_date(String employment_date) {
		this.employment_date = employment_date;
	}

	public void setEmp_flag(int emp_flag) {
		this.emp_flag = emp_flag;
	}

	public void setAddress_id(String address_id) {
		this.address_id = Integer.parseInt(address_id);
	}
	
	/* Getter 영역 */
	public String getEmployee_id() {
		return employee_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public int getWorktype_id() {
		return worktype_id;
	}

	public int getPosition_id() {
		return position_id;
	}

	public String getName() {
		return name;
	}

	public String getGender() {
		return gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getEmployment_date() {
		return employment_date;
	}

	public int getEmp_flag() {
		return emp_flag;
	}
	
	public int getAddress_id() {
		return address_id;
	}
	
}
