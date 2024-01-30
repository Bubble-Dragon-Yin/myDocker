package SOAS.service.impl;

import SOAS.mapper.NewsMapper;
import SOAS.pojo.News;
import SOAS.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsMapper newsMapper;
    @Autowired
    NewsIterator newsIterator ;



    @Override
    public List<News> getNewsList() {
        List<News> newsList = newsMapper.getNewsList();
        newsIterator.display(newsList);
        return newsList;
    }

    @Override
    public void addNews(News news) {
        newsMapper.addNews(news);
    }

    @Override
    public void deleteById(int id) {
        newsMapper.deleteById(id);
    }
}
