package com.example.demo.DAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.example.demo.model.Article;
import com.example.demo.model.AdminArea;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Repository
public class AdminArticle {
	
	
	@PersistenceContext	
	private EntityManager entityManager;	
	public List<Article> getArticles(String adminname)
	{
		String hql="from Article as a where a.status= 'in review' and a.areaid=(select ad.areaid from AdminArea ad where ad.adminname=adminname)";
		return (List<Article>) entityManager.createQuery(hql).getResultList();
    }
	
	public int  setArticles(int id)
	{    
     Date date = new Date(); 
     Article article= (Article)entityManager.find(Article.class ,id);
     article.setStatus("published");
     article.setReviewdate(date);
     System.out.println("It is working fine");
	 return 1;
	}
	
      public Article getArticlesbyId(int id)
	{   System.out.println("This is DAO"+id);
        Article article= (Article)entityManager.find(Article.class ,id);
        System.out.println("This is DAO"+article);
        return article;
	}
	
	
      public int  rejectArticles(int id,String reas)
  	{    
       Date date = new Date(); 
       Article article= (Article)entityManager.find(Article.class ,id);
       article.setStatus("rejected");
       article.setReason(reas);
       article.setReviewdate(date);
       article.setReviewby("root");
       System.out.println("It is working fine rejected");
  	   return 1;
  	}
      
      
      
      
	
	
}
