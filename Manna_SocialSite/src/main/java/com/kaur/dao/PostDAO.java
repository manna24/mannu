package com.kaur.dao;

import java.util.List;

import com.kaur.model.Post;

public interface PostDAO {

	public void addPost(Post user);
	public List<Post> getAllPosts();
}
