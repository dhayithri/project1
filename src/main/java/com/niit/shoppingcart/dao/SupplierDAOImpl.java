package com.niit.shoppingcart.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Supplier;

public  class SupplierDAOImpl  implements SupplierDAO{
	@Autowired
	private SessionFactory sessionFactory;
	public SupplierDAOImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	//save -save the record - if the record exist it will throw error
	//update - update the record - if the record does not exist, it will throw error
	//save or update - if the record exist, it will update
	//                 - if the record does not exist it will create
	@Transactional
	public boolean save(Supplier supplier){
		try {
		sessionFactory.getCurrentSession().save(supplier);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
		
	}
	@Transactional
	public boolean update(Supplier supplier){
		try {
		sessionFactory.getCurrentSession().update(supplier);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
		public boolean delete(Supplier supplier){
			try {
			sessionFactory.getCurrentSession().delete(supplier);
			return true;
			} catch(HibernateException e){
				e.printStackTrace();
				return false;
			}
			
	}
	@Transactional
		public Supplier get(int id){
			// select* from category where id='101'
			String hql = "from Supplier where id="+"'"+id+"'";
			@SuppressWarnings("rawtypes")
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Supplier> list = query.list();
			if(list==null){
				return null;
			} else {
				return list.get(0);
			}
		}
		@Transactional
		@SuppressWarnings("unchecked")
		public List<Supplier> list() {
			String hql = "from Supplier";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.list();
		}
		
		}