package com.kaur.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaur.dao.ContactDAO;
import com.kaur.model.Contact;
import com.kaur.service.ContactService;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDAO contactDAO;
	public void saveMessage(Contact contact) {
		
		contactDAO.saveMessage(contact);
	}

	public List<Contact> getAllMessages() {
		
		return contactDAO.getAllMessages();
	}

	@Override
	public void deleteMessage(int contact) {
		contactDAO.deleteMessage(contact);
		
	}

}
