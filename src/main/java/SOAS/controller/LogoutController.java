package SOAS.controller;

import SOAS.pojo.Admin;
import SOAS.pojo.Emp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class LogoutController {
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
            return "redirect:/";
        } else if (loggedInUserObj instanceof Emp) {
            // User 注销，重定向到 User 登录页面
            return "redirect:/emp_home.html";
        } else {
            // 其他情况，重定向到默认路径
            return "redirect:/";
        }
    }
}
