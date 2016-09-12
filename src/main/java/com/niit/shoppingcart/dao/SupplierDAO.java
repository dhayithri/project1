package com.niit.shoppingcart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.model.Supplier;


@Repository
public interface SupplierDAO {

public boolean save(Supplier supplier);
public boolean update(Supplier supplier);
public boolean delete(Supplier supplier);
public  Supplier get(int supplier);
public  List<Supplier> list();
	
	
}

    
