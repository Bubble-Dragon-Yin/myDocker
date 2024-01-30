package SOAS.service.impl;
import SOAS.mapper.EventMapper;
import SOAS.mapper.NewsMapper;
import SOAS.mapper.EmpMapper;
import SOAS.pojo.Event;
import SOAS.pojo.News;
import SOAS.service.EmpService;
import SOAS.pojo.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    EmpMapper empMapper;
    @Autowired
    NewsMapper newsMapper;
    @Autowired
    EventMapper eventMapper;
    @Autowired
    EmpIterator empIterator;

    @Override
    public List<Emp> getEmpList() {
        List<Emp> empList = empMapper.getEmpList();
        return empList;
    }

    @Override
    public void addEmp(Emp emp) {
        emp.setUpdateDate(LocalDate.now());
        empMapper.addEmp(emp);
    }


    @Override
    public void deleteById(int id) {
        empMapper.deleteById(id);
    }



    //-------------------update------------------------------------------
    @Override
    public Emp findById(int userId) {
        return empMapper.findById(userId);
    }

    @Override
    public void updateEmp(int id, Emp updatedEmp) {
        // Set the user ID to ensure it matches the path variable
        updatedEmp.setId(id);
        updatedEmp.setUpdateDate(LocalDate.now());
        empMapper.updateEmp(updatedEmp);
    }

    @Override
    public Emp findUserByUsernameAndPassword(String username, String password) {
        return empMapper.findUserByUsernameAndPassword(username, password);
    }

    public Emp findUserByUsername(String username) {
        return empMapper.findUserByUsername(username);
    }


    @Override
    public List<News> getNewsList() {
        List<News> newsList = newsMapper.getNewsList();
        return newsList;
    }

    @Override
    public List<Event> getEventList() {
        List<Event> eventList = eventMapper.getEventList();
        return eventList;
    }

    @Override
    public void updateSalary(int id, Emp updatedEmp) {
        updatedEmp.setId(id);
        updatedEmp.setUpdateDate(LocalDate.now());
        empMapper.updateSalary(updatedEmp);
    }

    @Override
    public List<Emp> findUserByConditions(String workStatus, Integer minAttendance, Integer maxAttendance, String sportStatus, String partyStatus, String skillCompStatus, LocalDate begin, LocalDate end) {
        List<Emp> empList = new ArrayList<>();
        empList = empMapper.findUserByConditions(workStatus, minAttendance, maxAttendance, sportStatus, partyStatus, skillCompStatus, begin, end);
        empIterator.display(empList);
        return empList;
    }


//------------------------------------------------------------------
}
