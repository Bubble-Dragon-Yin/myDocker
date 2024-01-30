package SOAS.service.impl;

import SOAS.mapper.EventMapper;
import SOAS.pojo.Event;
import SOAS.service.EventAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SportEvent implements EventAdapter {
    @Autowired
    EventMapper eventMapper;
    @Override
    public void addEvent(Event event) {
        event.setType("Sport");
        eventMapper.addEvent(event);
    }
}
