package SOAS.controller;

import SOAS.pojo.Event;
import SOAS.pojo.News;
import SOAS.pojo.RegEvent;
import SOAS.pojo.Emp;
import SOAS.service.EventService;
import SOAS.service.NewsService;
import SOAS.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user")
public class EmpController {
    @Autowired
    EmpService empService;
    @Autowired
    NewsService newsService;
    @Autowired
    EventService eventService;
    //--for user get news list------
    @GetMapping("/news/list")
    public String newsList(Model model){
        List<News> newsList = newsService.getNewsList();
        model.addAttribute("newsList", newsList);
        return "emp_news";
    }

    @GetMapping("/competition/list")
    public String getEventCompList(Model model) {
        List<Event> eventList = eventService.getEventList();
        model.addAttribute("eventList", eventList);
        return "emp_joinEvent";
    }

    @GetMapping("/register")
    public String register() {
        return "empRegister";
    }

    @PostMapping("/registerUser")
    public String register(@ModelAttribute Emp emp){
        empService.addEmp(emp);
        return "redirect:/emp_home.html";
    }
    /*---------------sport competition ---------------------------------*/
    @PostMapping("/join/sport/event/echo/{id}")
    public String echoComSport(@PathVariable int id, Model model) {
        Event event = eventService.findEventById(id);
        if (event == null) {
            // Handle the case where the user is not found
            return "error";
        }
        model.addAttribute("eventId", event.getId()); // Pass user ID separately for the form action
        model.addAttribute("title", event.getTitle());
        model.addAttribute("type", event.getType());
        model.addAttribute("content", event.getContent());
        return "joinSport";
    }


    /*---------------skills competition ---------------------------------*/
    @PostMapping("/join/skill/comp/event/echo/{id}")
    public String echoComSkill(@PathVariable int id, Model model) {
        Event event = eventService.findEventById(id);
        if (event == null) {
            // Handle the case where the user is not found
            return "error";
        }
        model.addAttribute("eventId", event.getId()); // Pass user ID separately for the form action
        model.addAttribute("title", event.getTitle());
        model.addAttribute("type", event.getType());
        model.addAttribute("content", event.getContent());
        return "joinSkillComp";
    }

    /*---------------party event registration ---------------------------------*/
    @PostMapping("/join/party/event/echo/{id}")
    public String echoParty(@PathVariable int id, Model model) {
        Event event = eventService.findEventById(id);
        if (event == null) {
            // Handle the case where the user is not found
            return "error";
        }
        model.addAttribute("eventId", event.getId()); // Pass user ID separately for the form action
        model.addAttribute("title", event.getTitle());
        model.addAttribute("type", event.getType());
        model.addAttribute("content", event.getContent());
        return "joinParty";
    }


    /* add reg event */
    @PostMapping("/add/regEvent")
    public String addRegEvent(@ModelAttribute RegEvent regEvent, @RequestParam String type, @RequestParam String userUsername,
                              @RequestParam String userPassword, Model model) {
        Emp emp =  empService.findUserByUsernameAndPassword(userUsername,userPassword);
        if (emp == null) {
            // User does not exist, handle the case and redirect back to the form with a message
            //"Electricity".equals(type) && user.getEleStatus().equals("NO")
            model.addAttribute("errorMessage", "User doesn't exist");
            return "error";
        }else if ("Sport".equals(type)) {
            eventService.addRegEvent(emp,regEvent);
            emp.setSportStatus("YES");
            empService.updateEmp(emp.getId(), emp);
        }else if ("Party".equals(type)) {
            eventService.addRegEvent(emp, regEvent);
            emp.setPartyStatus("YES");
            empService.updateEmp(emp.getId(), emp);
        }else if ("OfficeSkill".equals(type)) {
            eventService.addRegEvent(emp, regEvent);
            emp.setSkillCompStatus("YES");
            empService.updateEmp(emp.getId(), emp);
        }else{
            model.addAttribute("errorMessage", "Already Registered !!!");
            return "error";
        }
        return "redirect:/emp_home.html";
    }
}
