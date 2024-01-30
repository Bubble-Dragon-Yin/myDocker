package SOAS.service.impl;

import SOAS.mapper.AdminMapper;
import SOAS.pojo.Admin;
import SOAS.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
     @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin findAdminByUsernameAndPassword(String username, String password) {
        return adminMapper.findAdminByUsernameAndPassword(username, password);
    }
}
