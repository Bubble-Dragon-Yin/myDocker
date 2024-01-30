package SOAS.service;

import SOAS.pojo.Event;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public interface EventAdapter {
    int id = 0;
    String title = "";
    String type = "";
    String content = "";
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate createDate =null;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate updateDate = null;
    void addEvent(Event event);
}
