package SOAS.service;

import SOAS.pojo.News;

import java.util.List;

public interface NewsService {
    List<News> getNewsList();

    void addNews(News news);

    void deleteById(int id);
}
