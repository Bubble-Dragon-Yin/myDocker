package SOAS.service.impl;

import SOAS.mapper.AdminMapper;
import SOAS.mapper.EmpMapper;
import SOAS.pojo.Admin;
import SOAS.pojo.Emp;
import SOAS.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    EmpMapper empMapper;
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Emp findUserByUsernameAndPassword(String username, String password) {
        return empMapper.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public Admin findAdminByUsernameAndPassword(String username, String password) {
        return adminMapper.findAdminByUsernameAndPassword(username, password);
    }


}
