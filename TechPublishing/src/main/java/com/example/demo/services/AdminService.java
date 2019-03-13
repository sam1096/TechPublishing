package com.example.demo.services;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.example.demo.Respository.AdminRepository;
import java.util.*;
import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import com.example.demo.DAO.*;
import org.springframework.beans.factory.annotation.Autowired;
@Service
@Transactional

public class AdminService {

	@Autowired
	private AdminArticle adminArticle;

	
	private AdminRepository adminRepository;

	public AdminService(AdminRepository adminRepository)
	{
		this.adminRepository=adminRepository;
	}

	
	
	public Admin findByAdminnameAndPassword(String adminname,String password)
	{
	  
		Admin admin = adminRepository.findByAdminnameAndPassword(adminname, password);
	   
	  return admin;
	}
	
	public List<Article> getArticles(String adminname)
	{ return adminArticle.getArticles(adminname);
	}
}
