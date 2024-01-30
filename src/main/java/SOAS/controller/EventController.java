package SOAS.controller;

import SOAS.pojo.Event;
import SOAS.pojo.RegEvent;
import SOAS.pojo.Emp;
import SOAS.service.EventService;
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
@RequestMapping("/event")
public class EventController {
    @Autowired
    EventService eventService;
    @Autowired
    EmpService empService;

    @GetMapping("/list")
    public String getEventList(Model model) {
        List<Event> eventList = eventService.getEventList();
        model.addAttribute("eventList", eventList);
        return "eventManagement";
    }


    @GetMapping("/regEvent/list")
    public String getRegEventList(Model model) {
        List<RegEvent> regEventList = eventService.getRegEventList();
        model.addAttribute("regEventList",regEventList);
        return "regEventManagement";
    }
/* ----------------Add an event-------------------------- */
    @GetMapping("/add")
    public String addEvent() {
        return "eventAdd";
    }

    @PostMapping("/add")
    public String addEvent(@ModelAttribute Event event) {
        eventService.addEvent(event);
        return "redirect:/event/list";
    }
/* ----------------Add events ---------------------------*/

    @GetMapping("/addSportEvent")
    public String sportEvent(@ModelAttribute Event event) {
        event.setType("Sport");
        eventService.addEvent(event);
        return "redirect:/event/list";
    }

    @GetMapping("/addPartyEvent")
    public String partyEvent(@ModelAttribute Event event) {
        event.setType("Party");
        eventService.addEvent(event);
        return "redirect:/event/list";
    }

    @GetMapping("/addSkillEvent")
    public String skillCompEvent(@ModelAttribute Event event) {
        event.setType("OfficeSkill");
        eventService.addEvent(event);
        return "redirect:/event/list";
    }
/*---------------------------------------------------------*/


/* --------------- delete news --------------------------------------- */
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
    eventService.deleteById(id);
    log.info("The user with id {} has been deleted.", id);
    return "redirect:/event/list";
}

    @PostMapping("/delete/regEvent/{id}")
    public String deleteRegEvent(@PathVariable int id) {
        eventService.deleteRegEventById(id);
        log.info("The user with id {} has been deleted.", id);
        return "redirect:/event/regEvent/list";
    }

//-----------------update echo ----------------------------------------
    @PostMapping("/echo/{id}")
    public String update(@PathVariable int id, Model model) {
        RegEvent regEvent = eventService.findRegEventById(id);
        if (regEvent == null) {
            // Handle the case where the user is not found
            return "redirect:/event/list";
        }
        model.addAttribute("eventId", regEvent.getId()); // Pass user ID separately for the form action
        model.addAttribute("title", regEvent.getTitle());
        model.addAttribute("type", regEvent.getType());
        model.addAttribute("content", regEvent.getContent());
        model.addAttribute("userId", regEvent.getUserId());
        model.addAttribute("userUsername", regEvent.getUserUsername());
        model.addAttribute("userName", regEvent.getUserName());
        model.addAttribute("userPassword", regEvent.getUserPassword());
        model.addAttribute("familyMembers", regEvent.getFamilyMembers());
        model.addAttribute("proofImage", regEvent.getProofImage());
        model.addAttribute("sport", regEvent.getSport());
        model.addAttribute("skill", regEvent.getSkill());
        model.addAttribute("party", regEvent.getParty());
        model.addAttribute("regMonth", regEvent.getRegMonth());
        model.addAttribute("createDate", regEvent.getCreateDate());
        return "eventUpdate";
    }

    @PostMapping("/update/{id}")
    public String updateRegEvent(@PathVariable int id, @ModelAttribute RegEvent regEvent) {
        eventService.updateEvent(id, regEvent);
        log.info("The event with id {} has been updated.", id);
        return "redirect:/event/regEvent/list";
    }
    /* add reg event */
    @PostMapping("/add/regEvent")
    public String addRegEvent(@ModelAttribute RegEvent regEvent,@RequestParam String type,@RequestParam String userUsername,
                              @RequestParam String userPassword,Model model) {
         Emp emp =  empService.findUserByUsernameAndPassword(userUsername,userPassword);
        if (emp == null) {
            // User does not exist, handle the case and redirect back to the form with a message
            model.addAttribute("errorMessage", "User doesn't exist");
            return "error";
        }else if("Electricity".equals(type) && emp.getEleStatus().equals("NO")){
            // update user's status of competition
            eventService.addRegEvent(emp,regEvent);
            emp.setEleStatus("YES");
            empService.updateEmp(emp.getId(), emp);

        }else if("Water".equals(type) && emp.getWtrStatus().equals("NO")){
            eventService.addRegEvent(emp,regEvent);
            emp.setWtrStatus("YES");
            empService.updateEmp(emp.getId(), emp);
        }else if ("Recycle".equals(type)) {
            eventService.addRegEvent(emp,regEvent);
            emp.setRcyStatus("YES");
       } else{
            model.addAttribute("errorMessage", "Already Registered !!!");
            return "error";
       }
            return "redirect:/event/regEvent/list";
    }

    //---------------competition event list---------------------------------

    @GetMapping("/competition/list")
    public String getEventCompList(Model model) {
        List<Event> eventList = eventService.getEventList();
        model.addAttribute("eventList", eventList);
        return "competition";
    }

    //---------------Conditional Search -------------------------------------
    @GetMapping("/search")
    public String searchRegEvents(@RequestParam String username,
                                  @RequestParam String type,
                                  @RequestParam Integer month,
                                  @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate begin,
                                  @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd")  LocalDate end,
                                  Model model) {

        List<RegEvent> regEventList;
        if ("Water".equals(type) && username.equals("")) {
            regEventList = eventService.searchWtrComp(month, begin, end);
        } else if ("Electricity".equals(type) && username.equals("")) {
            regEventList = eventService.searchEleComp(month, begin, end);
        } else if ("Recycle".equals(type)) {
            regEventList = eventService.searchRcyComp(month, begin, end);
        } else {
            // Handle invalid type
            regEventList = eventService.searchUser(username,type,month,begin,end);
        }
        model.addAttribute("regEventList", regEventList);
        return "regEventManagement";

    }
    }
