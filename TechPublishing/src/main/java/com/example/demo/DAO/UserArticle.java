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
	public List<Object[]> getUserArticleStuff(String username)
	{
		
		String hql1="from Article as a,AreaInterest as i where a.areaid=i.areaid and a.areaid in(select ar.areaid from UserArea ar where ar.username=username)";
		 List<Object[]> obj_list1=entityManager.createQuery(hql1).getResultList();
		 System.out.println("This is the result!!");
		 
		 return obj_list1; 
	}
	public List<AreaInterest> getallCategories()
	{
		String hql=" from AreaInterest";
		 List<AreaInterest> obj_list1=entityManager.createQuery(hql).getResultList();
		 return obj_list1; 
	}
}
