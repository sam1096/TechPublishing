package com.example.demo.services;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.example.demo.Respository.AdminRepository;
import com.example.demo.Respository.AreaInterestRepository;
import com.example.demo.Respository.ArticleRepository;

import java.util.*;
import com.example.demo.model.Admin;
import com.example.demo.model.AdminArea;
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
	@Autowired
	private ArticleRepository articleRepository;
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private  AreaInterestRepository areainterestRepository;

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
	
	public int  setArticles(int id,String adminname)
	{     System.out.println("This is service"+id);
		return adminArticle.setArticles(id,adminname);
		
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
	
	public int  rejectArticles(int id,String reas, String adminname)
	{     System.out.println("This is reject service"+id);
	System.out.println("This is reject service"+reas);
		return adminArticle.rejectArticles(id,reas,adminname);
		
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
	
	public Article saveArticle(Article art) {
		return articleRepository.save(art);
		}
	
	public List<AreaInterest> findAreaInterest(String areaname)
	{
		return areainterestRepository.findByAreaname(areaname);
	}

	public Admin setPassword(int adminid, String password) {
		   System.out.println("This is service"+adminid);
			return adminArticle.setPassword(adminid, password);

		
	}

	public List<AdminArea> getInterestByAdminName(String adminname) {
		
		return adminArticle.getInterestByAdminName(adminname);
		
	}

	public List<AreaInterest> getInterestById(String areaid) {
		
		return areainterestRepository.findByAreaid(areaid);
	}
	
}
