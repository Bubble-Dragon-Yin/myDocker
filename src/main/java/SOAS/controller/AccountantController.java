package SOAS.controller;

import SOAS.pojo.Emp;
import SOAS.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/acc")
public class AccountantController {
    @Autowired
    EmpService empService;
    @GetMapping("/user_list")
    public String getEmplist(Model model){
        List<Emp> empList = empService.getEmpList();
        model.addAttribute("userList", empList);
        return "accSalaryManagement";
    }

    //---------------update user info -------------------------------
    @PostMapping("/user_echo/{id}")
    public String updateEmp(@PathVariable int id, Model model) {
        Emp emp = empService.findById(id);
//        user.setUpdateDate(LocalDate.now());
        // Check if the user exists
        if (emp == null) {
            // Handle the case where the user is not found
            return "redirect:/acc/user_list";
        }
        // Add the user to the model
        model.addAttribute("userId", emp.getId()); // Pass user ID separately for the form action
        model.addAttribute("username", emp.getUsername());
        model.addAttribute("name", emp.getName());
        model.addAttribute("password", emp.getPassword());
        model.addAttribute("profilePhoto", emp.getProfilePhoto());
        model.addAttribute("gender", emp.getGender());
        model.addAttribute("attendance", emp.getAttendance());
        model.addAttribute("salary", emp.getSalary());
        model.addAttribute("workStatus", emp.getWorkStatus());
        model.addAttribute("sportStatus", emp.getSportStatus());
        model.addAttribute("skillCompStatus", emp.getSkillCompStatus());
        model.addAttribute("partyStatus", emp.getPartyStatus());
        model.addAttribute("registerDate", emp.getRegisterDate());
        return "accEditSalary";
    }

    @PostMapping("/user_update/{id}")
        public String updateSalary(@PathVariable int id, @ModelAttribute Emp updatedEmp) {
        empService.updateSalary(id, updatedEmp);
        log.info("The user with id {} has been updated.", id);
        return "redirect:/acc/user_list";
    }
    // ----- conditional searching -----------
    @GetMapping("/search")
    public String searchEmps( @RequestParam String workStatus,
                              @RequestParam Integer minAttendance,
                              @RequestParam Integer maxAttendance, // Change mixAttendance to maxAttendance
                              @RequestParam String sportStatus,
                              @RequestParam String partyStatus,
                              @RequestParam String skillCompStatus,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate begin,
                              @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate end,
                              Model model) {
        List<Emp> empList = empService.findUserByConditions(workStatus, minAttendance, maxAttendance, sportStatus,
                partyStatus, skillCompStatus, begin, end);
        model.addAttribute("userList", empList);
        return "accSearchResult";
    }
}
