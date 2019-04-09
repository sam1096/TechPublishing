package com.example.demo.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.services.UserService;
import com.example.demo.model.AreaInterest;


@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;

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
	
/*	@RequestMapping ("/login-user")
	public ModelAndView loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userservice.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			System.out.println("reached");
			List<Object[]> l1=userservice.getUserArticleStuff(user.getUsername());
			//List<AreaInterest> l2=userservice.getUserAreaStuff(user.getUsername());
			ModelAndView model= new ModelAndView("UserHome");
			model.addObject("dashboard1",l1);
			//model.addObject("dashboard2",l2);
			return model;
		}
		else  {
			
			System.out.println(user.getPassword());
			System.out.println(user.getUsername());
			ModelAndView model= new ModelAndView("homepage");
			return model;	
		}
	}
	*/
	@RequestMapping(value = "/validateUserLogin", method = RequestMethod.POST)
	public String UserLogin(@RequestParam("username") String username, @RequestParam("password")String password, ModelMap map, HttpServletRequest request) {
		if(request.getSession(false).getAttribute("id")!=null){	
			return "redirect:userHome";
		}
		User user = userservice.validateUser(username,password);
		if(user==null) {
			map.addAttribute("error", "username or password invalid");
			return "Login";
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
		return "redirect:Home";
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
}
