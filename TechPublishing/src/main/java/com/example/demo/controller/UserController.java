package com.example.demo.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.model.UserArea;
import com.example.demo.model.userRatings;
import com.example.demo.services.UserService;
import com.example.demo.model.AreaInterest;
import com.example.demo.model.Article;

import com.example.demo.model.Comment;



@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	String aid;

	@PostMapping("/save-user")
	public ModelAndView registerUser(@ModelAttribute User user,BindingResult bindingresult,HttpServletRequest request)
	{
		userservice.saveMyUser(user);
		HttpSession session = request.getSession(true);
		session.setAttribute("id", user.getId());
		session.setAttribute("user", user);	
		List<AreaInterest>list=userservice.getallCategories();
		ModelAndView model= new ModelAndView("area_of_interest");
		model.addObject("categories",list);
		return model;
	}

	@RequestMapping(value = "/validateUserLogin", method = RequestMethod.POST)
	public String UserLogin(@RequestParam("username") String username, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null){	
			return "redirect:userHome";
		}
		User user = userservice.validateUser(username,password);
		if(user==null) {
			map.addAttribute("error", "Invalid Username or Password");
			return "Home";
		}
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", user.getId());
			session.setAttribute("user", user);	
			return "redirect:userHome";
		}
	}
	
	@RequestMapping("/logoutUser")
	public String logoutUser(HttpSession session) {
		session.invalidate();
   	return "redirect:/";
	}
	
	@RequestMapping(value = "/userProfile")
	public String userProfile(ModelMap map,HttpSession session)
	{
		User user=(User)session.getAttribute("user");
		System.out.println(user.getUsername());
		map.addAttribute("user", user);
		List<Article> articleinfo=userservice.getArticleByUser(user.getUsername());
		List<UserArea>area=userservice.getAreaByUser(user.getUsername());
		List<AreaInterest>userarea=new ArrayList<AreaInterest>();
		for(int i=0;i<area.size();i++)
		{
			userarea.add((userservice.getAreaInterestById(area.get(i).getAreaid())).get(0));
		}
		map.addAttribute("userarea", userarea);
		map.addAttribute("articleinfo", articleinfo);
		return "UserProfile";
	}
	
	@RequestMapping ("/submitarea")
	public String AreaOfInterest( HttpServletRequest request,@RequestParam("area") List<String> list, ModelMap map) {
		User user=(User)request.getSession(false).getAttribute("user");
		System.out.println(user.getUsername());
		for(int i=0;i<list.size();i++)
			System.out.println(list.get(i));
		userservice.saveAreas(user.getUsername(),list);
		
		return "redirect:userHome";
	}
	
	
	@RequestMapping ("/saveArticle")
	public String saveArticle(@ModelAttribute Article art,ModelMap map,HttpServletRequest request,@RequestParam("areas")String areaname)
	{
		User user=(User)request.getSession(false).getAttribute("user");
		System.out.println("*******************************************");
		System.out.println(user.getId());
		System.out.println("usernme is: "+user.getUsername());
		System.out.println("*******************************************");
		art.setAuthname(user.getUsername());
		String areaid=userservice.findAreaInterest(areaname).get(0).getAreaid();
		art.setAreaid(areaid);
		art.setStatus("in review");
		userservice.saveArticle(art);
		map.addAttribute("message", "Successfully saved");
		return "redirect:userHome";
	}
	
	@RequestMapping("/comment_section")
	public String comment_section(@RequestParam("article_id") int article_id,@RequestParam("comment_desc") String comment_desc,HttpSession session,ModelMap map) {
		
		System.out.println("commentSection*************************************");
		System.out.println("article id: "+article_id);
		System.out.println("*************************************");
		System.out.println(comment_desc);
		System.out.println("*************************************");
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUsername());
		Comment cmt=new Comment();
		cmt.setAuthname(user.getUsername());
		cmt.setArtid(article_id);
		cmt.setComdesc(comment_desc);
		
		userservice.save_comment(cmt);
		List<Comment> list=userservice.getComment(article_id);
		map.addAttribute("commentList", list);
		return "comments";
	}
	
	@RequestMapping("getComments")
	public String comments( @RequestParam("article_id") int aid, HttpSession session ,ModelMap map) {
		List<Comment> list=userservice.getComment(aid);
		map.addAttribute("commentList", list);
		return "comments";
	}
	
	@RequestMapping ("/editor")
	public String Editor(HttpSession session,ModelMap map) {
		if (session.getAttribute("id") == null) {
			return "redirect:loginUser";
		}
		User user = (User)session.getAttribute("user");
		map.addAttribute("user", user);
		List<AreaInterest> list=userservice.getallCategories();
		map.addAttribute("areainterest", list);
		return "editor";
	}
	@RequestMapping ("/ratings")
//	public String Ratings(@PathVariable(value="id") String id,HttpSession session)
	public String Ratings(@RequestParam("stars")int rating,@RequestParam("aid") int aid,HttpSession session,ModelMap map)
	{	
	if (session.getAttribute("id") == null) {
		return "redirect:loginUser";
	}

	User user = (User)session.getAttribute("user");
	userservice.save_rating(user.getUsername(),rating,aid);
	userRatings rateByUser=userservice.getRating(user.getUsername(),aid);
	System.out.println("*********************************");
		System.out.println("aid:");
		System.out.println("*********************************");
		List<Article> article=userservice.getfullArticle(aid);
		List<Comment> list=userservice.getComment(aid);
		map.addAttribute("commentList", list);
		map.addAttribute("article", article);
		map.addAttribute("rateByUser", rateByUser);
		map.addAttribute("article_id",aid);
		return "Article";
	}
	
	@RequestMapping ("/readmore")
	public String readMore( @RequestParam("aid") String aid, HttpSession session,ModelMap map)
	{	if (session.getAttribute("id") == null) {
		return "redirect:loginUser";
	}
		User user = (User)session.getAttribute("user");
		int article_id=Integer.parseInt(aid);
		List<Article> article=userservice.getfullArticle(article_id);
		List<Comment> list=userservice.getComment(article_id);
		userRatings rateByUser=userservice.getRating(user.getUsername(),article_id);
		map.addAttribute("commentList", list);
		map.addAttribute("article", article);
		map.addAttribute("rateByUser", rateByUser);
		map.addAttribute("article_id",article_id);
		return "Article";
}
}
