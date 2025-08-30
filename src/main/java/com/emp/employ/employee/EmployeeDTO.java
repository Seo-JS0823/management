package com.emp.employ.employee;

import java.time.LocalTime;

import com.emp.employ.atted.AttedDTO;

public class EmployeeDTO {
	
	/*
	employee_id		사번
	password		직원패스워드   : 처음 직원 등록시 자신의 생년월일 YYYYMMDD 형식으로 부여
	department_id	부서코드
	department_name	부서명
	worktype_id		근무형태 코드
	worktype		근무형태 이름
	position_id		직급 코드
	position_name	직급 이름
	manager_name	부서 담당자 이름 : 없으면 '미지정'
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
	private String password;
	
	private int department_id;
	private String department_name;
	
	private int worktype_id;
	private String worktype;
	
	private int position_id;
	private String position_name;
	
	private String manager_name;
	
	private String name;
	private String gender;
	private String birthdate;
	private String phone_num;
	private String email;
	private String address;
	private String employment_date;
	
	private String leave_start_date;
	private String leave_end_date;
	
	private int emp_flag;
	private int address_id;
	
	/* 출근 중복 체크 */
	private boolean startContains = false;
	
	/* 퇴근 중복 체크 */
	private boolean endContains = false;
	
	/* 퇴근체크전 출석체크 여부 */
	private boolean startNot = false;
	
	/* 퇴근 체크 */
	private LocalTime endSuccess;

	/* 출근 체크 */
	private LocalTime attedStartSuccess;
	
	public EmployeeDTO() {}

	public LocalTime getEndSuccess() {
		return endSuccess;
	}
	
	public void setEndSuccess(LocalTime endSuccess) {
		this.endSuccess = endSuccess;
	}
	
	public LocalTime getAttedStartSuccess() {
		return attedStartSuccess;
	}
	
	public void setAttedStartSuccess(LocalTime attedStartSuccess) {
		this.attedStartSuccess = attedStartSuccess;
	}

	public boolean isStartNot() {
		return startNot;
	}

	public void setStartNot(boolean startNot) {
		this.startNot = startNot;
	}

	public boolean isStartContains() {
		return startContains;
	}
	
	public void setStartContains(boolean startContains) {
		this.startContains = startContains;
	}
	
	public boolean isEndContains() {
		return endContains;
	}
	
	public void setEndContains(boolean endContains) {
		this.endContains = endContains;
	}
	
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
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	
	/* Getter 영역 */
	public String getEmployee_id() {
		return employee_id;
	}

	public String getPassword() {
		return password;
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
	
	public String getDepartment_name() {
		return department_name;
	}
	
	public String getWorktype() {
		return worktype;
	}
	
	public String getPosition_name() {
		return position_name;
	}
	
	public String getManager_name() {
		return manager_name;
	}

	public String getLeave_start_date() {
		return leave_start_date;
	}

	public void setLeave_start_date(String leave_start_date) {
		this.leave_start_date = leave_start_date;
	}

	public String getLeave_end_date() {
		return leave_end_date;
	}

	public void setLeave_end_date(String leave_end_date) {
		this.leave_end_date = leave_end_date;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	
}
