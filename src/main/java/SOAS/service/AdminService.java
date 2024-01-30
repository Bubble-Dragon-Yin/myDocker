package SOAS.service;

import SOAS.pojo.Admin;

public interface AdminService {
    Admin findAdminByUsernameAndPassword(String username, String password);
}
