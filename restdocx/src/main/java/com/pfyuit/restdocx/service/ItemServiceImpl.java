package com.pfyuit.restdocx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pfyuit.restdocx.dao.ItemDaoImpl;
import com.pfyuit.restdocx.dto.ResultDto;
import com.pfyuit.restdocx.model.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private CacheService cacheService;

	@Autowired
	private ItemDaoImpl itemDao;

	@Override
	public ResultDto getResult(String name) {
		ResultDto result = cacheService.get(name);

		// save to cache
		if (result == null) {
			Item item = itemDao.find(name);
			result = new ResultDto();
			if (item != null) {
				result.setCname(item.getCategory().getName());
				result.setCurl(item.getCategory().getUrl());
				result.setName(item.getName());
				result.setUrl(item.getUrl());
				result.setMethod(item.getMethod());
				result.setParam(item.getParam());
				result.setFormat(item.getFormat());
				result.setInput(item.getInput());
				result.setOutput(item.getOutput());
				result.setNote(item.getNote());
			}
			cacheService.set(name, result, 60 * 60 * 1000);
		}

		return result;
	}

	@Override
	public void save(Item item) {
		if (itemDao.find(item.getName()) != null) {
			itemDao.update(item);

			// update cache
			ResultDto result = new ResultDto();
			if (item != null) {
				result.setCname(item.getCategory().getName());
				result.setCurl(item.getCategory().getUrl());
				result.setName(item.getName());
				result.setUrl(item.getUrl());
				result.setMethod(item.getMethod());
				result.setParam(item.getParam());
				result.setFormat(item.getFormat());
				result.setInput(item.getInput());
				result.setOutput(item.getOutput());
				result.setNote(item.getNote());
			}
			cacheService.replace(item.getName(), result, 60 * 60 * 1000);
		} else {
			itemDao.save(item);
		}
	}

	@Override
	public List<Item> findAll() {
		return itemDao.findAll();
	}
}
