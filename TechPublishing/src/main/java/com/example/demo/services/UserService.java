package com.example.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.example.demo.Respository.AreaInterestRepository;
import com.example.demo.Respository.ArticleRepository;
import com.example.demo.Respository.CommentRepository;
import com.example.demo.Respository.UserAreaRepository;
import com.example.demo.Respository.UserRepository;
import com.example.demo.model.Article;
import com.example.demo.model.Comment;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.User;
import com.example.demo.model.UserArea;
import javax.persistence.Query;
import com.example.demo.DAO.UserArticle;
import org.springframework.beans.factory.annotation.Autowired;

@Service
@Transactional
public class UserService {
	
	@Autowired
   private UserArticle userArticle;
	@Autowired
	private final ArticleRepository articleRepository;
	@Autowired
	private final UserRepository userRepository;
	@Autowired
	private final UserAreaRepository userareaRepository;
	@Autowired
	private final AreaInterestRepository areainterestRepo;
	@Autowired
	private final CommentRepository commentRepo;
	
	@PersistenceContext	
    EntityManager entityManager;
	
	public UserService(CommentRepository commentRepo,UserRepository userRepository,AreaInterestRepository areainterestRepo,UserAreaRepository userareaRepository,ArticleRepository articleRepository)
	{	this.areainterestRepo=areainterestRepo;
		this.userRepository=userRepository;
		this.userareaRepository=userareaRepository;
		this.articleRepository=articleRepository;
		this.commentRepo=commentRepo;
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
	public List<Article> getfullArticle(int aid)
	{
		return articleRepository.findByAid(aid);
	}
	

	public Article saveArticle(Article art) {
	return articleRepository.save(art);
	}
	public List<AreaInterest> findAreaInterest(String areaname)
	{
		return areainterestRepo.findByAreaname(areaname);
	}
	
	public List<Comment> getComment(int aid) {
		System.out.println("#####################");
		//String aid=String.valueOf(article_id);
		System.out.println(aid);
		String hql="from Comment as c where c.artid=?2";
		Query q1 = entityManager.createQuery(hql);
		q1.setParameter(2, aid);
		List<Comment> comment_list = q1.getResultList();
		System.out.println("commentList########################");
		return comment_list;
		
	}
	public void save_comment(Comment comments) {
		Comment comment= commentRepo.save(comments);
		System.out.println(comments.getArtid()+" "+comments.getAuthname());
		//return comment.getArtid();
		}
}

