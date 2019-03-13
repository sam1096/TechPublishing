package com.example.demo.DAO;
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
}
