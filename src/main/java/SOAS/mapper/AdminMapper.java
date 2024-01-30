package SOAS.mapper;

import SOAS.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdminMapper {
    @Select("SELECT * FROM SuperiorOAS.admin WHERE username = #{username} AND password = #{password}")
    Admin findAdminByUsernameAndPassword(String username, String password);

    @Select("SELECT * FROM SuperiorOAS.admin WHERE username = #{username}")
    Admin findAdminByName(String username);
}
