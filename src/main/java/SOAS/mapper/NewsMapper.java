package SOAS.mapper;

import SOAS.pojo.News;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NewsMapper {
    @Select("select * from SuperiorOAS.news ORDER BY create_date DESC")
    List<News> getNewsList();

    @Insert("insert into news( title, cover_image, content, publisher, create_date, update_date) values\n" +
            "               (#{news.title},#{news.coverImage},#{news.content},#{news.publisher},#{news.createDate},#{news.updateDate});")
    void addNews(@Param("news")News news);
    @Delete("delete from news where id = #{id}")
    void deleteById(int id);
}
