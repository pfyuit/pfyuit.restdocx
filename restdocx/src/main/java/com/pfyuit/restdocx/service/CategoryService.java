package com.pfyuit.restdocx.service;

import java.util.List;

import com.pfyuit.restdocx.model.Category;

public interface CategoryService {

	public abstract void save(Category category);

	public abstract List<Category> findAll();

}