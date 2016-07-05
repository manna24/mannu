package com.kaur.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaur.dao.ContactDAO;
import com.kaur.model.Contact;

@Repository
public class ContactDAOImpl implements ContactDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveMessage(Contact contact) {
		sessionFactory.getCurrentSession().save(contact);
		
	}

	public List<Contact> getAllMessages() {
		
		return sessionFactory.getCurrentSession().createQuery("from Contact").list();
	}

	@Override
	public void deleteMessage(int id) {
		Session s=sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		Contact c=(Contact)s.get(Contact.class, new Integer(id));
		s.delete(c);
		t.commit();
		s.flush();
		s.close();
		
	}

}
