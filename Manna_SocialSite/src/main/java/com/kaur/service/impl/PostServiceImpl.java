package com.kaur.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaur.dao.PostDAO;
import com.kaur.model.Post;
import com.kaur.service.PostService;
@Service
@Transactional
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;
	public void addPost(Post user) {
	
		postDAO.addPost(user);
	}

	public List<Post> getAllPosts() {
		return postDAO.getAllPosts();
	}

}
