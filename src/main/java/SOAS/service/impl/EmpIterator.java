package SOAS.service.impl;

import SOAS.pojo.Emp;
import SOAS.service.iterator;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class EmpIterator implements iterator<Emp> {
    @Override
    public void display(List<Emp> list) {
        for (Emp emp : list) {
            if (emp.getWorkStatus().equals("On Job")) {
                System.out.println("User's name on job is: " + emp.getName());
            } else if (emp.getWorkStatus().equals("Business Trip")) {
                System.out.println("User's name on business trip is: " + emp.getName());
            }
        }
    }
}

