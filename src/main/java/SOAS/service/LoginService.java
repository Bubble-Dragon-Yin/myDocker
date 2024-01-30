package SOAS.service;

import SOAS.pojo.Admin;
import SOAS.pojo.Emp;

public interface LoginService {

    Emp findUserByUsernameAndPassword(String username, String password);
    Admin findAdminByUsernameAndPassword(String username, String password);
}
