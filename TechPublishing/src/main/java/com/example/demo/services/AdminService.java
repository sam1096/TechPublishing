package com.example.demo.services;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.example.demo.Respository.AdminRepository;
import java.util.*;
import com.example.demo.model.Admin;
import com.example.demo.model.Article;
import com.example.demo.model.User;
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
	
	
/*	public Admin findByAdminnameAndPassword(String adminname,String password)
	{
	  
		Admin admin = adminRepository.findByAdminnameAndPassword(adminname, password);
	   
	  return admin;
	}*/
	
	public List<Article> getArticles(String adminname)
	{ return adminArticle.getArticles(adminname);
	}
}
