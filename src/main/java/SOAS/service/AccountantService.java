package SOAS.service;

import SOAS.pojo.Accountant;

public interface AccountantService {

    Accountant findAccByUsernameAndPassword(String username, String password);
}
