package com.example.demo.DAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.example.demo.model.Article;
import com.example.demo.model.UserArea;
import com.example.demo.model.AreaInterest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Repository
public class UserArticle {
	
	
	@PersistenceContext	
	private EntityManager entityManager;	
	public List<Article> getUserArticles(String username)
	{
		
		String hql="from Article a, AreaInterest i where a.areaid=i.areaid and a.areaid=(select ar.areaid from UserArea ar where ar.username =username)";
		 List<Article> obj_list=entityManager.createQuery(hql).getResultList();
		 System.out.println("This is the result!!");
		 System.out.println(obj_list);
		 return obj_list;
	  
	   
	}
}
