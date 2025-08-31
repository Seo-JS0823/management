package com.emp.employ.leave;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.emp.employ.employee.EmployeeDTO;

@Mapper
public interface LeaveMapper {
	// 신청서 제출하기 insert
	void insertLeave(LeaveReqDTO leaveReqDTO);
	
	// 직원들 휴가 정보 뽑아오기 select
	List<LeaveReqDTO> getLeaveReqList(int department_id);
	
	// 휴가 신청서 상세정보 뽑아오기 select
	LeaveReqDTO leaveDetail(LeaveReqDTO leaveReqDTO);

	// 본인이 신청한 휴가 기록들을 뽑아오기 select
	List<LeaveReqDTO> getLeaveHistoryList(LeaveReqDTO leaveReqDTO);

	// 본인 휴가신청서 수정 update
	void empLeaveUpdate(LeaveReqDTO leaveReqDTO);
	
	// 승인시 status -> 1 update
	void leaveAgree(LeaveReqDTO leaveReqDTO);
	
	// 승인시 연차 차감 insert
	void leaveAgree2(LeaveReqDTO leaveReqDTO);
	
	// 반려 update
	void leaveRefuse(LeaveReqDTO leaveReqDTO);
	
	// 휴가 신청서에다 남은연차일수 가져오기 select
	LeaveReqDTO getLeave_count(LeaveReqDTO leaveReqDTO);
	
	/* 직원의 연차 정보 불러오기 */
	double leaveRead(EmployeeDTO employee);
	
}
