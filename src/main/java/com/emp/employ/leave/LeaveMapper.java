package com.emp.employ.leave;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;

@Mapper
public interface LeaveMapper {
	void insertLeave(LeaveReqDTO leaveReqDTO);

	List<LeaveReqDTO> getLeaveReqList();

	LeaveReqDTO leaveDetail(LeaveReqDTO leaveReqDTO);

	void deleteLeave(int seq);

	LeaveReqDTO insertLeaveHistory(LeaveReqDTO leaveReqDTO);

	List<LeaveReqDTO> getLeaveHistoryList(LeaveReqDTO leaveReqDTO);

	void empLeaveUpdate(LeaveReqDTO leaveReqDTO);

	void leaveAgree(LeaveReqDTO leaveReqDTO);

	void leaveRefuse(LeaveReqDTO leaveReqDTO);
	
	/* 직원의 연차 정보 불러오기 */
	double leaveRead(EmployeeDTO employee);
	
}
