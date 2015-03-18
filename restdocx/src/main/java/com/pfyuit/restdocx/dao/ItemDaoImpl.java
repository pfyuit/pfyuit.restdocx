package com.pfyuit.restdocx.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pfyuit.restdocx.mapper.ItemMapper;
import com.pfyuit.restdocx.model.Item;

@Repository
public class ItemDaoImpl implements ItemDao {

	@Autowired
	private ItemMapper itemMapper;

	@Override
	public void save(Item t) {
		itemMapper.save(t);
	}

	@Override
	public void delete(Item t) {
		itemMapper.delete(t);
	}

	@Override
	public void update(Item t) {
		itemMapper.update(t);
	}

	@Override
	public Item find(String id) {
		return itemMapper.find(id);
	}

	@Override
	public List<Item> findAll() {
		return itemMapper.findAll();
	}

}
