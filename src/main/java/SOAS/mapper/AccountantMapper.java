package SOAS.mapper;

import SOAS.pojo.Accountant;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AccountantMapper {
    @Select("SELECT * FROM SuperiorOAS.accountant WHERE username = #{username} AND password = #{password}")
    Accountant findAccByUsernameAndPassword(String username, String password);
}
