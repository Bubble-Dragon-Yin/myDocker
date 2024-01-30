package SOAS.controller;
import SOAS.pojo.Admin;
import SOAS.service.AdminService;
import SOAS.service.EmpService;
import SOAS.pojo.Emp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    EmpService empService;
    @Autowired
    AdminService adminService;


    @GetMapping("/user_list")
    public String getUserList(Model model) {
        List<Emp> empList = empService.getEmpList();
        model.addAttribute("userList", empList);
        return "empManagement";
    }

    /* ----------------Add user-------------------------- */
    @GetMapping("/user_add")
    public String add() {return "empAdd";}

    @PostMapping("/user_add")
    public String addEmp(@ModelAttribute Emp emp) {
        empService.addEmp(emp);
        return "redirect:/admin/user_list";
    }
    /* ------------------------------------------------------ */


    @PostMapping("/user_delete/{id}")
    public String delete(@PathVariable int id) {
        empService.deleteById(id);
        log.info("The user with id {} has been deleted.", id);
        return "redirect:/admin/user_list";
    }

//---------------User login------------
    @GetMapping("/login/form")
    public String showLoginForm() {
        return "userLogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        Emp emp = empService.findUserByUsernameAndPassword(username, password);
        Admin admin = adminService.findAdminByUsernameAndPassword(username,password);


        if (admin != null) {
            // Successful login
            // You might want to store user information in session or use Spring Security
            /* 先返回Admin home page */
            session.setAttribute("loggedInUser", admin);
            return "redirect:/admin/homeAdmin";
        } else if(emp != null){
            // User login
            session.setAttribute("loggedInUser", emp);
            System.out.println("User logged in: " + emp.getUsername());
            return "redirect:/";
        } else {
            // Failed login
            model.addAttribute("errorMessage", "User doesn't exist");
            return "error";
        }
    }
//-----------------user logout-----------------------------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 获取用户角色
        Object loggedInUserObj = session.getAttribute("loggedInUser");

        // 清除登录信息
        session.removeAttribute("loggedInUser");

        // 根据用户类型判断并决定注销后的跳转路径
        if (loggedInUserObj instanceof Admin) {
            // Admin 注销，重定向到 Admin 的首页
            return "redirect:/admin/homeAdmin";
        } else if (loggedInUserObj instanceof Emp) {
            // User 注销，重定向到 User 登录页面
            return "redirect:/";
        } else {
            // 其他情况，重定向到默认路径
            return "redirect:/";
        }
    }

//---------------update user info -------------------------------
    @PostMapping("/user_echo/{id}")
    public String update(@PathVariable int id, Model model) {
        Emp emp = empService.findById(id);
//        user.setUpdateDate(LocalDate.now());
        // Check if the user exists
        if (emp == null) {
            // Handle the case where the user is not found
            return "redirect:/admin/user_list";
        }
        // Add the user to the model
        model.addAttribute("userId", emp.getId()); // Pass user ID separately for the form action
        model.addAttribute("username", emp.getUsername());
        model.addAttribute("name", emp.getName());
        model.addAttribute("password", emp.getPassword());
        model.addAttribute("profilePhoto", emp.getProfilePhoto());
        model.addAttribute("gender", emp.getGender());
        model.addAttribute("attendance", emp.getAttendance());
        model.addAttribute("workStatus", emp.getWorkStatus());
        model.addAttribute("sportStatus", emp.getSportStatus());
        model.addAttribute("skillCompStatus", emp.getSkillCompStatus());
        model.addAttribute("partyStatus", emp.getPartyStatus());
        model.addAttribute("registerDate", emp.getRegisterDate());
        return "empUpdate";
    }

    @PostMapping("/user_update/{id}")
    public String updateEmp(@PathVariable int id, @ModelAttribute Emp updatedEmp) {
        empService.updateEmp(id, updatedEmp);
        log.info("The user with id {} has been updated.", id);
        return "redirect:/admin/user_list";
    }
}
