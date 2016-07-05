package com.kaur.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaur.dao.RolesDAO;
import com.kaur.model.Roles;
import com.kaur.service.RolesService;

@Service
@Transactional
public class RolesServiceImpl implements RolesService{

	@Autowired
	private RolesDAO rolesDAO;
	
	public void addRole(Roles role) {
		rolesDAO.addRole(role);
		
	}



}
