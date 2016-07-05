package com.kaur.service;

import java.util.List;

import com.kaur.model.Post;

public interface PostService {

	public void addPost(Post user);
	public List<Post> getAllPosts();
}
