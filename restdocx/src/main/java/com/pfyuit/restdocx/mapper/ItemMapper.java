package com.pfyuit.restdocx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pfyuit.restdocx.model.Item;

public interface ItemMapper {

	public void save(Item t);

	public void delete(Item t);

	public void update(Item t);

	public Item find(@Param("name") String id);

	public List<Item> findAll();

}
