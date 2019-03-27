package com.example.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.Respository.UserAreaRepository;
import com.example.demo.Respository.UserRepository;
import com.example.demo.model.Article;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.User;
import com.example.demo.model.UserArea;
import com.example.demo.DAO.UserArticle;
import org.springframework.beans.factory.annotation.Autowired;

@Service
@Transactional
public class UserService {
	
	@Autowired
   private UserArticle userArticle;
  	
	private final UserRepository userRepository;
	private final UserAreaRepository userareaRepository;
	
	public UserService(UserRepository userRepository,UserAreaRepository userareaRepository)
	{
		this.userRepository=userRepository;
		this.userareaRepository=userareaRepository;
	}
	
	public User validateUser(String username, String password) {
		List<User> users = userRepository.findByUsername(username);
		if (users.size() == 0) {
			return null;
		} else {

			User user = users.get(0);
			if (user.getPassword().equals(password)) {
				return user;
			} else {
				return null;
			}
		}
	}
	
	public void saveMyUser(User user) {	
		userRepository.save(user);
	}
	
	
	/*public User findByUsernameAndPassword(String username,String password)
	{
		User user = userRepository.findByUsernameAndPassword(username, password);
	  return user;
	}
	*/
	public List<Object[]> getUserArticleStuff(String username)
	{ return userArticle.getUserArticleStuff(username);
	}
	
	public List<AreaInterest> getallCategories()
	{
		return userArticle.getallCategories();
	}
	
	public void saveAreas(String username,List<String>list)
	{
		for(int i=0;i<list.size();i++)
		{
			UserArea ua=new UserArea();
			ua.setUsername(username);
			String areaid=list.get(i);
			ua.setAreaid(areaid);
			userareaRepository.save(ua);
		}
	}
	
	
}

