package SOAS.mapper;

import SOAS.pojo.Admin;
import SOAS.pojo.Emp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {
    @Select("SELECT * FROM SuperiorOAS.emp WHERE username = #{username} AND password = #{password}")
    Emp findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    @Select("SELECT * FROM SuperiorOAS.admin WHERE username = #{username} AND password = #{password}")
    Admin findAdminByUsernameAndPassword(@Param("username") String username, @Param("password")String password);
}
