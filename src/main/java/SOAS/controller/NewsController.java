package SOAS.controller;
import SOAS.pojo.News;
import SOAS.service.EventService;
import SOAS.service.NewsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    NewsService newsService;
    EventService eventService;

    @GetMapping("/list")
    public String getNews(Model model) {
        List<News> newsList = newsService.getNewsList();
        model.addAttribute("newsList", newsList);
        return "newsManagement";
    }
    //-----------------add news -----------------------------
    @GetMapping("/add")
    public String addNews() {
        return "newsAdd";
    }

    @PostMapping("/add")
    public String addEvent(@ModelAttribute News news) {
        news.setCreateDate(LocalDate.now());
        news.setUpdateDate(news.getCreateDate());
        newsService.addNews(news);
        return "redirect:/news/list";
    }
    //--------------- delete news ----------------------------------------
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        newsService.deleteById(id);
        log.info("The user with id {} has been deleted.", id);
        return "redirect:/news/list";
    }
}
