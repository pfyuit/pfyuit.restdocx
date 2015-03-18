package com.pfyuit.restdocx.service;

import java.util.List;

import com.pfyuit.restdocx.dto.ResultDto;
import com.pfyuit.restdocx.model.Item;

public interface ItemService {

	public abstract ResultDto getResult(String name);

	public abstract void save(Item item);

	public abstract List<Item> findAll();

}