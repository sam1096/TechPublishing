package com.example.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.Respository.UserRepository;
import com.example.demo.model.Article;
import com.example.demo.model.User;
import com.example.demo.DAO.UserArticle;
import org.springframework.beans.factory.annotation.Autowired;

@Service
@Transactional
public class UserService {
	
	@Autowired
    private UserArticle userArticle;
  	
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository)
	{
		this.userRepository=userRepository;
	}
	
	public void saveMyUser(User user) {
		
		userRepository.save(user);
	}

	
	
	public User findByUsernameAndPassword(String username,String password)
	{
	  //System.out.println("hello getting user");
		User user = userRepository.findByUsernameAndPassword(username, password);
	   
	  //System.out.println("user :" + user.getAge());
	  return user;
	}
	
	public List<Article> getUserArticles(String username)
	{ return userArticle.getUserArticles(username);
	}

}

