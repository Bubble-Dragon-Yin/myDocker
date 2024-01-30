package SOAS.service.impl;

import SOAS.pojo.Emp;
import SOAS.pojo.News;
import SOAS.service.iterator;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class NewsIterator implements iterator<News> {
    @Override
    public void display(List<News> list) {
        for (News news : list) {
            System.out.println("News title is: " + news.getTitle());
        }
    }
}


