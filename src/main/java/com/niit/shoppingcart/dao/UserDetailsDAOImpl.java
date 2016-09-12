package com.niit.shoppingcart.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.UserDetails;


@EnableTransactionManagement
@Repository("userDetailsDAO")
public   class UserDetailsDAOImpl  implements UserDetailsDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	public UserDetailsDAOImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	//save -save the record - if the record exist it will throw error
	//update - update the record - if the record does not exist, it will throw error
	//save or update - if the record exist, it will update
	//                 - if the record does not exist it will create
	@Transactional
	public boolean save(UserDetails userDetails){
		try {
		sessionFactory.getCurrentSession().save(userDetails);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
		
	}
	@Transactional
	public boolean update(UserDetails userDetails){
		try {
		sessionFactory.getCurrentSession().update(userDetails);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
		public boolean delete(UserDetails userdetails){
			try {
			sessionFactory.getCurrentSession().delete(userdetails);
			return true;
			} catch(HibernateException e){
				e.printStackTrace();
				return false;
			}
			
	}
	@Transactional
		public UserDetails get(String id){
			// select* from category where id='101'
			String hql = "from UserDetails where id="+"'"+id+"'";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			@SuppressWarnings("unchecked")
			List<UserDetails> list = query.list();
			if(list==null){
				return null;
			} else {
				return list.get(0);
			}
		}
		@Transactional
		public UserDetails isValidUser(String id,String password){
			String hql = "from UserDetails where id ='" + id +"'and password= '"+password +"'";
			Query query= sessionFactory.getCurrentSession().createQuery(hql);
			List<UserDetails> list = query.list();
			if(list== null) {
				return null;
			}else{
				return list.get(0);
			}
		}
		
		@SuppressWarnings("unchecked")
		public List<UserDetails> list() {
			String hql = "from UserDetails";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.list();
		}
			
			
		}