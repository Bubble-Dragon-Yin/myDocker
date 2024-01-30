package SOAS.controller;
import SOAS.service.AccountantService;
import SOAS.pojo.Accountant;
import SOAS.pojo.Admin;
import SOAS.pojo.Emp;
import SOAS.service.AdminService;
import SOAS.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class LoginController {
    @Autowired
    EmpService empService;
    @Autowired
    AdminService adminService;
    @Autowired
    AccountantService accountantService;
    //---------------User login------------
    @GetMapping("/login/form")
    public String showLoginForm() {
        return "Login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        Emp emp = empService.findUserByUsernameAndPassword(username, password);
        Admin admin = adminService.findAdminByUsernameAndPassword(username,password);
        Accountant accountant = accountantService.findAccByUsernameAndPassword(username,password);



        if (admin != null) {
            // Successful login
            // You might want to store user information in session or use Spring Security
            /* 先返回Admin home page */
            // Admin登录
            log.info("Admin logged in: {}", admin.getUsername());
            session.setAttribute("loggedInUser", admin);
            return "redirect:/admin/user_list";
        } else if(emp != null){
            // User login
            session.setAttribute("loggedInUser", emp);
            System.out.println("User logged in: " + emp.getUsername());
            return "redirect:/emp_home.html";
        } else if( accountant != null) {
            // User login
            session.setAttribute("loggedInUser", accountant);
            System.out.println("User logged in: " + accountant.getUsername());
            return "redirect:/acc/user_list";
        } else {
            // Failed login
            model.addAttribute("errorMessage", "User doesn't exist");
            return "error";
        }
    }
//-----------------user logout-----------------------------------
}
