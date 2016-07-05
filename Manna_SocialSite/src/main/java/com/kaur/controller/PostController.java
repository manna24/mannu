package com.kaur.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaur.model.Post;
import com.kaur.service.PostService;



@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/newPost")
	public String newPosts(ModelMap map,Principal principal)
	{
		List<Post> post=postService.getAllPosts();
		/*for(Post p : post)
		{
			if(p.getPostUser().equals(principal.getName()))
			{
		       map.addAttribute("myPosts", post);
			}
		}*/
		map.addAttribute("myPosts", post);
		return "newPost";
	}
	
	@RequestMapping(value="/addPost")
	public String addPost(@Valid @ModelAttribute("addpost") Post post,BindingResult result,ModelMap model,Principal principal)
	{
		if(result.hasErrors()){
            return "newPost";
        }
		Date date=new Date();
		String user=principal.getName();
		post.setPostUser(user);
		post.setDate(date);
		postService.addPost(post);
		model.addAttribute("posts", post);
		return "redirect:newPost";
	}
	
	@RequestMapping(value="/post")
	public String allPosts(ModelMap map)
	{
		List<Post> post=postService.getAllPosts();
		map.addAttribute("posts", post);
		return "post";
	}
	
	@RequestMapping(value="/myPosts")
	public String myPosts(ModelMap map,Principal principal)
	{
		List<Post> post=postService.getAllPosts();
		List<Post> myPosts=new ArrayList<Post>();
		for(Post p : post)
		{
			if(principal.getName().equals(p.getPostUser()))
			{
		      myPosts.add(p);
			}
		}
		map.addAttribute("myPosts", myPosts);
		return "myPosts";
	}
}
