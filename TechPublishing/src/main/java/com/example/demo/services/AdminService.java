package com.example.demo.services;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.example.demo.Respository.AdminRepository;
import com.example.demo.Respository.ArticleRepository;

import java.util.*;
import com.example.demo.model.Admin;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.Article;
import com.example.demo.model.User;
import com.example.demo.DAO.*;
import org.springframework.beans.factory.annotation.Autowired;
@Service
@Transactional

public class AdminService {

	@Autowired
	private AdminArticle adminArticle;
	private ArticleRepository articleRepository;
	private AdminRepository adminRepository;

	public AdminService(AdminRepository adminRepository)
	{
		this.adminRepository=adminRepository;
	}
	
	public Admin validateAdmin(String adminname, String password) {
		List<Admin> admins = adminRepository.findByAdminname(adminname);
		if (admins.size() == 0) {
			return null;
		} else {

			Admin admin = admins.get(0);
			if (admin.getPassword().equals(password)) {
				return admin;
			} else {
				return null;
			}
		}
	}
	
	

	public List<Article> getArticles(String adminname)
	{ return adminArticle.getArticles(adminname);
	}
	
	public int  setArticles(int id)
	{     System.out.println("This is service"+id);
		return adminArticle.setArticles(id);
		
	}
	
	public Article getArticlesbyId(int id)
	{ Article ar=adminArticle.getArticlesbyId(id);
	   System.out.println("This is service"+ar);
	  return ar;
	}
	
	public List<AreaInterest> getallCategories()
	{
		return adminArticle.getallCategories();
	}
	
	public int  rejectArticles(int id,String reas)
	{     System.out.println("This is reject service"+id);
	System.out.println("This is reject service"+reas);
		return adminArticle.rejectArticles(id,reas);
		
	}

	public List<Article> getfullArticle(int aid)
	{
		return articleRepository.findByAid(aid);
	}

	public List<Article> getArticlesbyAdminName(String adminname) {
	
		List<Article> ar=adminArticle.getArticlesbyAdminName(adminname);
		   System.out.println("****This is service *****"+ar);
		  return ar;
	}

	public List<Article> getArticlesbyAdmin(String adminname) {
		
		List<Article> ar=adminArticle.getArticlesbyAdmin(adminname);
		   System.out.println("****This is service *****"+ar);
		  return ar;
	}
}
