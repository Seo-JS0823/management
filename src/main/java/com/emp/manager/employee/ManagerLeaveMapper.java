package com.emp.manager.employee;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ManagerLeaveMapper {
	
	// annualCreate 연차 적립 실행
	int annualCreate(@Param("year_month") String year_month);
	
	// 당월 연차가 적립되었는지 확인
	int annualContains(@Param("year_month") String year_month);
}
