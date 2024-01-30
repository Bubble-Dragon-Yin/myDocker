package SOAS.service.impl;

import SOAS.mapper.AccountantMapper;
import SOAS.pojo.Accountant;
import SOAS.service.AccountantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountantServiceImpl implements AccountantService {
    @Autowired
    AccountantMapper accountantMapper;

    @Override
    public Accountant findAccByUsernameAndPassword(String username, String password) {
        return accountantMapper.findAccByUsernameAndPassword(username,password);
    }
}
