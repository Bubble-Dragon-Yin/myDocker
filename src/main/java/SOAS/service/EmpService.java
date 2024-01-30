package SOAS.service;

import SOAS.pojo.Event;
import SOAS.pojo.News;
import SOAS.pojo.Emp;

import java.time.LocalDate;
import java.util.List;

public interface EmpService {
    List<Emp> getEmpList();

    void addEmp(Emp emp);



    void deleteById(int id);

    Emp findById(int userId);

    void updateEmp(int id, Emp updatedEmp);

    Emp findUserByUsernameAndPassword(String username, String password);
//    User findUserByUsername(String username);

    List<News> getNewsList();

    List<Event> getEventList();

    void updateSalary(int id, Emp updatedEmp);

    List<Emp> findUserByConditions(String workStatus, Integer minAttendance, Integer mixAttendance, String sportStatus, String partyStatus, String skillCompStatus, LocalDate begin, LocalDate end);
}
