package com.pfyuit.restdocx.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pfyuit.restdocx.mapper.CategoryMapper;
import com.pfyuit.restdocx.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public void save(Category t) {
		categoryMapper.save(t);
	}

	@Override
	public void delete(Category t) {
		categoryMapper.delete(t);
	}

	@Override
	public void update(Category t) {
		categoryMapper.update(t);
	}

	@Override
	public Category find(String id) {
		return categoryMapper.find(id);
	}

	@Override
	public List<Category> findAll() {
		return categoryMapper.findAll();
	}

}
