package com.emp.manager.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    
    @GetMapping("/eatDeny")
    public String denyLateness(@RequestParam("employee_id") String employee_id, @RequestParam("ness_date") String ness_date) {

        latenessMapper.updateLatenessStatus(employee_id, ness_date, 0); 
        
        return "redirect:/manage/managerEatView";
    }

    @GetMapping("/eatApprove")
    public String approveLateness(@RequestParam("employee_id") String employee_id, @RequestParam("ness_date") String ness_date) {

        latenessMapper.updateLatenessStatus(employee_id, ness_date, 1);
        
        return "redirect:/manage/managerEatView";
    }
}
