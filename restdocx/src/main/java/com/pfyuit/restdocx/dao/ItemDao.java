package com.pfyuit.restdocx.dao;

import java.util.List;

import com.pfyuit.restdocx.model.Item;

public interface ItemDao {

	public void save(Item t);

	public void delete(Item t);

	public void update(Item t);

	public Item find(String id);

	public List<Item> findAll();

}