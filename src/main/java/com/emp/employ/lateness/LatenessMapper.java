package com.emp.employ.lateness;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LatenessMapper {

	 void insertLateness(LatenessDTO latenessDTO);

	List<LatenessDTO> selectLatenessListByEmployee_id(String employee_id);

	 void deleteEat(LatenessDTO latenessDTO);

	List<LatenessDTO> getLatenessList();

	void deleteLateness(LatenessDTO latenessDTO);
	LatenessDTO selectLatenessByEmployee_idAndNess_date(
			@Param("employee_id") String employee_id,
			@Param("ness_date") String ness_date
		);

	public void updateLateness(
		    @Param("latenessDTO") LatenessDTO latenessDTO,
		    @Param("originalNessDate") String originalNessDate
		);
	public void updateLatenessNew(
		    @Param("ness_date") String nessDate,
		    @Param("content") String content,
		    @Param("atte_flag") int atteFlag,
		    @Param("employee_id") String employeeId,
		    @Param("originalNessDate") String originalNessDate
		);

	List<LatenessDTO> selectLatenessListByEmployee_idAndStatusAndAtte_flag(
			@Param("employee_id") String employee_id,
			@Param("status") Integer status,
			@Param("atte_flag") Integer atte_flag
	);
	
	void updateLatenessStatus
	(@Param("employee_id") String employee_id, 
	 @Param("ness_date") String ness_date, 
	 @Param("status") Integer status);

	List<LatenessDTO> selectLatenessListAll();

    List<LatenessDTO> selectLatenessListByManager(
            @Param("searchText") String searchText,
            @Param("status") Integer status,
            @Param("atte_flag") Integer atteFlag
        );

    void updateLatenessStatusAndReason(
    		@Param("employeeId") String employeeId, 
    		@Param("nessDate") String nessDate, 
    		@Param("status") int status, 
    		@Param("reason") String reason);

	LatenessDTO searchLatenessDetail(String employee_id, String ness_date);

	void insertAttendanceRecord(String employee_id, String ness_date, int atte_flag);

	void updateAttendanceRecord(String employee_id, String ness_date, int atte_flag);

	Integer selectAttendanceCount(String employee_id, String ness_date);



}