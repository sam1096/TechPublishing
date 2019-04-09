package com.example.demo.Respository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Article;

public interface ArticleRepository  extends CrudRepository<Article, Integer>{
List<Article> findByAid(int aid);
List<Article> findByAreaid(String areaid);
List<Article> findByAuthname(String authname);
}
