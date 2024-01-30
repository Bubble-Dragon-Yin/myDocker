package SOAS.mapper;
import SOAS.pojo.Event;
import SOAS.pojo.News;
import SOAS.pojo.Emp;
import org.apache.ibatis.annotations.*;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface EmpMapper {
    @Select("select * from SuperiorOAS.emp ORDER BY update_date DESC")
    List<Emp> getEmpList();

    @Insert("insert into SuperiorOAS.emp ( username, name, password, gender, profile_photo,work_status,attendance," +
            "sport_status,party_status,skill_comp_status, register_date,update_date) values\n" +
            "(#{emp.username},#{emp.name},#{emp.password},#{emp.gender},#{emp.profilePhoto}," +
            "#{emp.workStatus},#{emp.attendance},#{emp.sportStatus},#{emp.partyStatus},#{emp.skillCompStatus}," +
            "#{emp.registerDate},#{emp.updateDate});")
    void addEmp(@Param("emp")Emp emp);

//    // 根据用户ID查询关联的事件数量
//    @Select("SELECT COUNT(*) FROM MBIP.event WHERE user_id = #{userId}")
//    int countEventsByUserId(int userId);


    @Delete("delete from emp where id = #{id}")
    void deleteById(int id);
//----------------------update--------------------------------
    @Select("SELECT * FROM SuperiorOAS.emp WHERE id = #{userId}")
    Emp findById(int userId);

    @Update("update emp set username=#{username}, name=#{name}, " +
            "profile_photo=#{profilePhoto}, gender=#{gender},attendance=#{attendance},work_status=#{workStatus},"+
            "sport_status=#{sportStatus},party_status=#{partyStatus},skill_comp_status=#{skillCompStatus}," +
            "register_date=#{registerDate},update_date=#{updateDate} where id=#{id} ORDER BY update_date DESC")
    void updateEmp(Emp updatedEmp);

    @Select("SELECT * FROM SuperiorOAS.emp WHERE username = #{username} AND password = #{password}")
    Emp findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    @Select("SELECT * FROM SuperiorOAS.emp WHERE username = #{username}")
    Emp findUserByUsername(@Param("username")String username);
    //-------for user get news list --------------------
    @Select("select * from SuperiorOAS.news ORDER BY create_date DESC")
    List<News> getNewsList();
    //-------for user get competition list --------------------
    @Select("select * from  SuperiorOAS.event ORDER BY update_date DESC")
    List<Event> getEventList();

    @Update("UPDATE emp SET attendance=#{attendance}, sport_status=#{sportStatus}, party_status=#{partyStatus}, " +
            "skill_comp_status=#{skillCompStatus}, register_date=#{registerDate}, update_date=#{updateDate}, " +
            "salary=#{salary},work_status=#{workStatus} WHERE id=#{id} ORDER BY update_date DESC")
    void updateSalary(Emp updatedEmp);


    @Select("SELECT * FROM SuperiorOAS.emp " +
            "WHERE work_status = #{workStatus} " +
            "AND attendance BETWEEN #{minAttendance} AND #{maxAttendance} " +
            "AND sport_status = #{sportStatus} " +
            "AND party_status = #{partyStatus} " +
            "AND skill_comp_status = #{skillCompStatus} " +
            "AND register_date BETWEEN #{begin} AND #{end}")
    List<Emp> findUserByConditions(@Param("workStatus") String workStatus,
                                   @Param("minAttendance") Integer minAttendance,
                                   @Param("maxAttendance") Integer maxAttendance,
                                   @Param("sportStatus") String sportStatus,
                                   @Param("partyStatus") String partyStatus,
                                   @Param("skillCompStatus") String skillCompStatus,
                                   @Param("begin") LocalDate begin,
                                   @Param("end") LocalDate end);
}
