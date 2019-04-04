package com.example.demo.DAO;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
		
		//entityManager.getTransaction().begin();
		
	//	String hql2="select ar.areaid from UserArea ar where ar.username= :username";
		String hql1="from Article as a, AreaInterest as i where a.areaid=i.areaid and a.areaid in(select ar.areaid from UserArea ar where ar.username= ?1)";
		
		//String hql1="from Article as a inner join AreaInterest as i where a.areaid in(select ar.areaid from UserArea ar where ar.username=username)";
		Query q1=entityManager.createQuery(hql1);
		q1.setParameter(1, username);
		 List<Object[]> obj_list1= q1.getResultList();
		// List<String> areaid=entityManager.createQuery(hql2).getResultList();
		 System.out.println(username);
		 System.out.println("******************************************");
		/* for(int i=0;i<areaid.size();i++)
			 System.out.println(areaid.get(i));*/
		 System.out.println("This is the result!!");
		// entityManager.getTransaction().commit();
		// entityManager.close();
		 System.out.println("******************************************");
		 for (Iterator i = obj_list1.iterator(); i.hasNext();) {
             Object[] values = (Object[]) i.next();
             System.out.println( values[0] + ", " + values[1] );

         }
		 
		 return obj_list1; 
		
	}
	public List<AreaInterest> getallCategories()
	{
		String hql=" from AreaInterest";
		 List<AreaInterest> obj_list1=entityManager.createQuery(hql).getResultList();
		 return obj_list1; 
	}
}
