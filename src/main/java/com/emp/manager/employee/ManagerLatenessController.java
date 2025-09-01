package com.emp.manager.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.emp.employ.lateness.LatenessDTO;
import com.emp.employ.lateness.LatenessMapper;

@Controller
@RequestMapping("/manage")
public class ManagerLatenessController {

	@Autowired
	private LatenessMapper latenessMapper;
	
	// 관리자 페이지
    @GetMapping("/managerEatView")
    public ModelAndView managerEatView(
    	@RequestParam(value = "search_text", required = false) String searchText,
        @RequestParam(value = "status", required = false) Integer status,
        @RequestParam(value = "atte_flag", required = false) Integer atteFlag
    ) {
        ModelAndView mv = new ModelAndView();
        List<LatenessDTO> latenessList;

        if (searchText != null && !searchText.isEmpty() || status != null || atteFlag != null) {
            latenessList = latenessMapper.selectLatenessListByManager(searchText, status, atteFlag);
        } else {
            latenessList = latenessMapper.selectLatenessListAll();
        }

        mv.addObject("LatenessDTOList", latenessList);
        
        mv.setViewName("manager/managerEatView");

        return mv;
    }
    
    @PostMapping("/eatApproveDeny")
    public ModelAndView handleLatenessAction(
        @RequestParam("employee_id") String employee_id, 
        @RequestParam("ness_date") String ness_date, 
        @RequestParam("action") String action
    ) {
        if ("approve".equals(action)) {
            latenessMapper.updateLatenessStatus(employee_id, ness_date, 1);
            LatenessDTO lateness = latenessMapper.searchLatenessDetail(employee_id, ness_date);
            
            if(lateness != null) {

                Integer existingRecordCount = latenessMapper.selectAttendanceCount(employee_id, ness_date);
                
                if(existingRecordCount == null || existingRecordCount == 0) {
                    latenessMapper.insertAttendanceRecord(employee_id, ness_date, lateness.getAtte_flag());
                } else {
                    latenessMapper.updateAttendanceRecord(employee_id, ness_date, lateness.getAtte_flag());
                }
            }
        
        
        }else if ("deny".equals(action)) {
            latenessMapper.updateLatenessStatus(employee_id, ness_date, 0);
        }
        
        ModelAndView mav = new ModelAndView("redirect:/manage/managerEatView");
        return mav;
    }	
}
