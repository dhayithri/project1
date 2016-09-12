package com.niit.shoppingcart.dao;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Category;
import com.niit.model.Supplier;


@EnableTransactionManagement
@Repository("categoryDAO")
public   class CategoryDAOImpl  implements CategoryDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	public CategoryDAOImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	//save -save the record - if the record exist it will throw error
	//update - update the record - if the record does not exist, it will throw error
	//save or update - if the record exist, it will update
	//                 - if the record does not exist it will create
	@Transactional
	public boolean saveOrUpdate(Category category){
		try {
		sessionFactory.getCurrentSession().save(category);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
		
	}
	/***@Transactional
	public boolean update(Category category){
		try {
		sessionFactory.getCurrentSession().update(category);
		return true;
		} catch(HibernateException e){
			e.printStackTrace();
			return false;
		}
	}**/
	
	@Transactional
		public boolean delete(Category category){
			try {
			sessionFactory.getCurrentSession().delete(category);
			return true;
			} catch(HibernateException e){
				e.printStackTrace();
				return false;
			}
			
	}
	@Transactional
		public Category get(int id){
			// select* from category where id='101'
			String hql = "from Category where id="+"'"+id+"'";
			
			Query<Category> query = sessionFactory.getCurrentSession().createQuery(hql);
		
			List<Category> list = query.list();
			if(list==null){
				return null;
			} else {
				return list.get(0);
			}
		}
		
	@SuppressWarnings("deprecation")
	@Transactional
		public List<Category> list() {
			String hql = "from Category";
			Query<Category> query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.list();
		}
}


