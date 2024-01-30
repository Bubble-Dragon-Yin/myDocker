package SOAS.mapper;

import SOAS.pojo.Event;
import SOAS.pojo.RegEvent;
import org.apache.ibatis.annotations.*;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface EventMapper {

    @Select("select * from  SuperiorOAS.event ORDER BY update_date DESC")
    List<Event> getEventList();

    @Select("select * from SuperiorOAS.regEvent ORDER BY id DESC")
    List<RegEvent> getRegEventList();

    @Insert("INSERT INTO event (title, type, content,create_date, update_date) " +
            "VALUES (#{event.title}, #{event.type}, #{event.content},#{event.createDate}, #{event.updateDate})")
    @Options(useGeneratedKeys = true, keyProperty = "event.id")
    void addEvent(@Param("event") Event event);

    @Delete("delete from event where id = #{id}")
    void deleteById(int id);

    @Delete("delete from regEvent where id = #{id}")
    void deleteRegEventById(int id);

    @Select("SELECT * FROM SuperiorOAS.event WHERE id = #{userId}")
    Event findEventById(int eventId);
    @Select("SELECT * FROM SuperiorOAS.regEvent WHERE id = #{regEventId}")
    RegEvent findRegEventById(int regEventId);


    @Update("update regEvent set title=#{title}, type=#{type}, content=#{content}, user_id=#{userId}, user_username=#{userUsername}, user_name=#{userName}, user_password=#{userPassword}," +
            "proof_image=#{proofImage}, sport=#{sport}, skill=#{skill}, party=#{party}, " +
            "reg_month=#{regMonth}, create_date=#{createDate} where id=#{id}")
    void updateEvent(RegEvent event);


    @Insert("insert into regEvent (title, type, content, user_id,user_username, user_name,user_password,proof_image,reg_month, sport, party, skill, create_date,update_date) " +
            "values (#{title}, #{type}, #{content}, #{userId},#{userUsername}, #{userName},#{userPassword},#{proofImage},#{regMonth}, #{sport},#{party},#{skill},#{createDate},#{updateDate})")
    void addRegEvent(RegEvent regEvent);

    @Select("SELECT * FROM SuperiorOAS.regEvent " +
            "WHERE type = 'Water'" +
            "AND create_date BETWEEN #{begin} AND #{end} ORDER BY avg_wtr_quantity ASC")
    List<RegEvent> searchWtrComp(Integer month, LocalDate begin, LocalDate end);

    @Select("SELECT * FROM SuperiorOAS.regEvent " +
            "WHERE type = 'Electricity'" +
            "AND create_date BETWEEN #{begin} AND #{end} ORDER BY avg_ele_quantity ASC")
    List<RegEvent> searchEleComp(Integer month, LocalDate begin, LocalDate end);

    @Select("SELECT re.*\n" +
            "FROM SuperiorOAS.regEvent re\n" +
            "JOIN (\n" +
            "    SELECT user_username, COUNT(*) AS recycle_count\n" +
            "    FROM SuperiorOAS.regEvent\n" +
            "    WHERE type = 'Recycle' AND create_date BETWEEN #{begin} AND #{end}\n" +
            "    GROUP BY user_username\n" +
            "    ORDER BY recycle_count DESC\n" +
            "    LIMIT 1\n" +
            ") AS topRecycler\n" +
            "ON re.user_username = topRecycler.user_username\n" +
            "WHERE re.type = 'Recycle' AND re.create_date BETWEEN #{begin} AND #{end};")

    List<RegEvent> searchRcyComp(Integer month, LocalDate begin, LocalDate end);


    @Select("SELECT * FROM SuperiorOAS.regEvent " +
            "WHERE user_username =#{username} AND type = #{type} AND reg_month = #{month} " +
            "AND create_date BETWEEN #{begin} AND #{end} ORDER BY create_date DESC")
    List<RegEvent> searchUser(String username, String type, Integer month, LocalDate begin, LocalDate end);
}
