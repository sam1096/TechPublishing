package com.example.demo.DAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.example.demo.model.Article;
import com.example.demo.model.Admin;
import com.example.demo.model.AdminArea;
import com.example.demo.model.AreaInterest;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Repository
public class AdminArticle {
	
	
	@PersistenceContext	
	private EntityManager entityManager;	
	public List<Article> getArticles(String adminname)
	{
	String hql="from Article as a where a.status= 'in review' and not a.authname=?1 and  a.areaid=(select ad.areaid from AdminArea ad where ad.adminname=?1)";
		
	    Query q1 = entityManager.createQuery(hql); 
		q1.setParameter(1, adminname);
		List<Article> li=q1.getResultList();
        return li ;
		
		//return (List<Article>) entityManager.createQuery(hql).getResultList();
    }
	
	public int  setArticles(int id, String adminname)
	{    
     Date date = new Date(); 
     Article article= (Article)entityManager.find(Article.class ,id);
     article.setStatus("published");
     article.setReviewdate(date);
     article.setReviewby(adminname);
     System.out.println("It is working fine");
	 return 1;
	}
	
      public Article getArticlesbyId(int id)
	{   System.out.println("This is DAO"+id);
        Article article= (Article)entityManager.find(Article.class ,id);
        System.out.println("This is DAO"+article);
        return article;
	}
	
	
      public int  rejectArticles(int id,String reas,String adminname)
  	{    
       Date date = new Date(); 
       Article article= (Article)entityManager.find(Article.class ,id);
       article.setStatus("rejected");
       article.setReason(reas);
       article.setReviewdate(date);
       article.setReviewby(adminname);
       System.out.println("It is working fine rejected");
  	   return 1;
  	}

      
	public List<Article> getArticlesbyAdminName(String adminname)
	{
		String hql="from Article as a where a.reviewby=?1 and a.areaid=(select ad.areaid from AdminArea ad where ad.adminname=?1)";
		
	    Query q1 = entityManager.createQuery(hql); 
		q1.setParameter(1, adminname);
		
		return (List<Article>) q1.getResultList();
    }

	public List<Article> getArticlesbyAdmin(String adminname) {
		
	String hql="from Article as a where  a.authname=?1";
		
	    Query q1 = entityManager.createQuery(hql); 
		q1.setParameter(1, adminname);
		
		return (List<Article>) q1.getResultList();
	}
      
	public List<AreaInterest> getallCategories()
	{
		String hql=" from AreaInterest";
		 List<AreaInterest> obj_list1=entityManager.createQuery(hql).getResultList();
		 return obj_list1; 
	}

	public Admin setPassword(int adminid, String password) {
		 Admin adm= (Admin)entityManager.find(Admin.class ,adminid);
	       adm.setPassword(password);
		return adm;
	}

	public List<AdminArea> getInterestByAdminName(String adminname) {
		
		String hql=" from AdminArea ad where ad.adminname=?1 ";
	    Query q1 = entityManager.createQuery(hql); 
			q1.setParameter(1, adminname);
			return (List<AdminArea>) q1.getResultList();
	} 
      
	
	
}
