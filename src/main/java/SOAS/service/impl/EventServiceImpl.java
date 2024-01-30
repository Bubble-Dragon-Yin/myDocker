package SOAS.service.impl;

import SOAS.mapper.EmpMapper;
import SOAS.pojo.Event;
import SOAS.pojo.RegEvent;
import SOAS.pojo.Emp;
import SOAS.service.EventService;
import SOAS.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    @Autowired
    EventMapper eventMapper;
    @Autowired
    EmpMapper empMapper;
    @Autowired
    SOAS.service.impl.SportEvent sportEvent;
    @Autowired
    SOAS.service.impl.PartyEvent partyEvent;
    @Autowired
    SOAS.service.impl.SkillEvent skillEvent;

    @Override
    public void addEvent(Event event) {
        event.setUpdateDate(event.getCreateDate());
        if(event.getType().equals("Sport")){
            sportEvent.addEvent(event);
        }else if(event.getType().equals("Party")){
            partyEvent.addEvent(event);
        }else{
            skillEvent.addEvent(event);
        }
    }


    @Override
    public List<RegEvent> getRegEventList() {
        List<RegEvent> regEventList = eventMapper.getRegEventList();
        return regEventList;
    }

    @Override
    public List<Event> getEventList() {
        List<Event> eventList = eventMapper.getEventList();
        return eventList;
    }



    @Override
    public void deleteById(int id) {
        eventMapper.deleteById(id);
    }

    @Override
    public void deleteRegEventById(int id) {
        eventMapper.deleteRegEventById(id);
    }

    //-------------update event-----------------------------------------------------
    @Override
    public Event findEventById(int eventId) {

        return eventMapper.findEventById(eventId);
    }
//--------------------------------------------------------------------------
    @Override
    public void updateEvent(int id, RegEvent regEvent) {
        regEvent.setId(id);
        eventMapper.updateEvent(regEvent);
    }

    @Override
    public void addRegEvent(Emp emp, RegEvent regEvent) {
        regEvent.setCreateDate(LocalDate.now());
        regEvent.setUpdateDate(regEvent.getCreateDate());
        regEvent.setUserId(emp.getId());
        regEvent.setUserUsername(emp.getUsername());
        regEvent.setUserName(emp.getName());

        eventMapper.addRegEvent(regEvent);
    }

//-------------------------------------------------------------------------------------------------
    @Override
    public RegEvent findRegEventById(int regEventId) {
        return eventMapper.findRegEventById(regEventId);
    }

    @Override
    public List<RegEvent> searchWtrComp(Integer month, LocalDate begin, LocalDate end) {
        return eventMapper.searchWtrComp(month, begin, end);
    }

    @Override
    public List<RegEvent> searchEleComp(Integer month, LocalDate begin, LocalDate end) {
        return eventMapper.searchEleComp(month, begin, end);
    }

    @Override
    public List<RegEvent> searchRcyComp(Integer month, LocalDate begin, LocalDate end) {
        return eventMapper.searchRcyComp(month, begin, end);
    }

    @Override
    public List<RegEvent> searchUser(String username, String type, Integer month, LocalDate begin, LocalDate end) {
        return eventMapper.searchUser(username,type,month,begin,end);
    }


//-----------register Water saving competition ----------------------------------


}
