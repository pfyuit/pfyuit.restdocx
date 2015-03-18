package com.pfyuit.restdocx.dao;

import java.util.List;

import com.pfyuit.restdocx.model.Category;

public interface CategoryDao {
	
	public void save(Category t);

	public void delete(Category t);

	public void update(Category t);

	public Category find(String id);

	public List<Category> findAll();

}