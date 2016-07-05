package com.kaur.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kaur.model.Post;
import com.kaur.model.User;
import com.kaur.service.PostService;
import com.kaur.service.UserService;



@Controller
public class FrontController {
	
	Path path;
	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;

	@RequestMapping(value={"/","/index"})
	public String getIndex(Locale locale, ModelMap model,Principal principal)
	{
		List<Post> post=postService.getAllPosts();
		model.addAttribute("posts", post);
		return "index";
	}
	
	
	@RequestMapping(value="/editUser")
	public String edituserByName(Model model,Principal principal,User user)
	{
		String name=principal.getName();
		user=userService.getUser(name);
		model.addAttribute("users", user);
		
		return "editUser";
	}
	public User getUser()
	{
		return new User();
	}
	@RequestMapping(value="/edituser/{userid}", method=RequestMethod.POST)
	public String editUser(@PathVariable("userid") Integer userid,
	        @ModelAttribute("user") User user,HttpServletRequest request,Map map,Principal p){
		
	   user.setUsername(p.getName());
	  MultipartFile image = user.getImage();
	       String rootDirectory = request.getSession().getServletContext().getRealPath("/");
	       path = Paths.get(rootDirectory + "/resources/images/" + user.getUsername() + ".png");
	        System.out.println(path);
	       if(image != null && !image.isEmpty()){
	           try {
	               image.transferTo(new File(path.toString()));
	           } catch (Exception ex){
	               ex.printStackTrace();
	               throw new RuntimeException("Product image saving failed", ex);
	           }
	       }
	       userService.editUser(user);
	    return "redirect:/userProfile";
	}
	@RequestMapping(value = "/allUsers")
	public String allUsersPage(ModelMap model) {
     
		List<User> users=userService.getAllUsers();
	
		model.addAttribute("users", users);
		return "allUsers";
	}
	
	/*@RequestMapping(value="/userProfile")
	public String getUserById(@ModelAttribute("user") User user, Model model){
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		 String name=auth.getName();
		 user.setUsername(name);
		 List<User> list=userService.getAllUsers();
		 model.addAttribute("user", list);
		model.addAttribute("user", user);
		return "userProfile";
	}*/
	@RequestMapping(value="/userProfile")
	public String getUserById(ModelMap model,Principal principal){
		String name=principal.getName();
		model.addAttribute("myName", name);
		return "userProfile";
	}
	
	@RequestMapping("/deleteUser")
	 public String deleteUser(@RequestParam int userid) {
		userService.deleteUser(userid);
	  return "redirect:allUsers";
	 }
	
	@RequestMapping(value="/aboutPage")
	public String aboutPage()
	{
		return "aboutPage";
	}
	
	
	@RequestMapping(value="/cloudCourse")
	public String coursePage()
	{
		return "cloudCourse";
	}
	@RequestMapping(value="/cloudSchedule")
	public String schedule()
	{
		return "cloudSchedule";
	}
	
	@RequestMapping(value="/createForum")
	public String createForum()
	{
		return "createForum";
	}
	
	@RequestMapping(value="/viewForum")
	public String viewForum()
	{
		return "viewForum";
	}
	@RequestMapping(value="/forumPage")
	public String forumPage()
	{
		return "forumPage";
	}
	
	@RequestMapping(value="/trainings")
	public String servicesPage()
	{
		return "trainings";
	}
	@RequestMapping(value="/calendar")
	public String calendarPage()
	{
		return "calendar";
	}
	
}
