package com.kaur.dao;

import java.util.List;

import com.kaur.model.User;

public interface UserDAO {

	public void addUser(User user);
	public void editUser(User user);
	public void deleteUser(int userId);
	public User getUser(int userId);
	public List<User> getAllUsers();
	public User getUser(String username);
	
}
