package com.pfyuit.restdocx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pfyuit.restdocx.model.Category;

public interface CategoryMapper {

	public void save(Category t);

	public void delete(Category t);

	public void update(Category t);

	public Category find(@Param("name") String id);

	public List<Category> findAll();

}
