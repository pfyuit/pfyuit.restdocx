package com.pfyuit.restdocx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pfyuit.restdocx.dao.CategoryDaoImpl;
import com.pfyuit.restdocx.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDaoImpl categoryDao;

	@Override
	public void save(Category category) {
		if (categoryDao.find(category.getName()) != null) {
			categoryDao.update(category);
		} else {
			categoryDao.save(category);
		}
	}

	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}
}
