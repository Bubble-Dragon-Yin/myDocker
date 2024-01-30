package SOAS.service;

import SOAS.pojo.Emp;
import SOAS.pojo.Event;
import SOAS.pojo.RegEvent;

import java.time.LocalDate;
import java.util.List;

public interface EventService {
    public interface SportEvent {
        void addSportEvent(Event event);
    }

    public interface SkillEvent {
        void addSkillEvent(Event event);
    }

    public interface PartyEvent {
        void addPartyEvent(Event event);
    }




    List<RegEvent> getRegEventList();

    List<Event> getEventList();

    void addEvent(Event event);

    void deleteById(int id);
    void deleteRegEventById(int id);



    Event findEventById(int eventId);
//------------------------------------------------------
    void updateEvent(int id, RegEvent regEvent);
    void addRegEvent(Emp emp, RegEvent regEvent);
//---------------------------------------------------------
    RegEvent findRegEventById(int regEventId);

    List<RegEvent> searchWtrComp(Integer regMonth, LocalDate begin, LocalDate end);

    List<RegEvent> searchEleComp(Integer regMonth, LocalDate begin, LocalDate end);

    List<RegEvent> searchRcyComp(Integer regMonth, LocalDate begin, LocalDate end);

    List<RegEvent> searchUser(String username, String type, Integer month, LocalDate begin, LocalDate end);




//    boolean hasEventsForUser(int userId);
}
