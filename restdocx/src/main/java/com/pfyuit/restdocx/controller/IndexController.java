package com.pfyuit.restdocx.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pfyuit.restdocx.model.Category;
import com.pfyuit.restdocx.model.Item;
import com.pfyuit.restdocx.service.CategoryService;
import com.pfyuit.restdocx.service.ItemService;

@Controller
public class IndexController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/business/content");
		view.addObject("active", "Home");
		view.addObject("menu", "Home");
		return view;
	}

	@RequestMapping("/navigator")
	public ModelAndView navigator() {
		List<Item> items = itemService.findAll();
		Map<Category, List<Item>> map = new TreeMap<Category, List<Item>>();
		for (Item item : items) {
			Category category = item.getCategory();
			if (!map.containsKey(category)) {
				map.put(category, new ArrayList<Item>());
			}
			map.get(category).add(item);
		}

		ModelAndView view = new ModelAndView();
		view.setViewName("/business/navigator");
		view.addObject("map", map);
		return view;
	}

	@RequestMapping("/content")
	public ModelAndView content() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/business/content");
		return view;
	}

	@RequestMapping("/admin")
	public ModelAndView admin() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/business/admin");
		view.addObject("active", "Home");
		view.addObject("menu", "Admin");
		return view;
	}

	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/business/about");
		view.addObject("active", "Home");
		view.addObject("menu", "About");
		return view;
	}

	@RequestMapping("/top")
	public ModelAndView top() {
		List<Category> categories = categoryService.findAll();

		ModelAndView view = new ModelAndView();
		view.setViewName("/business/top");
		view.addObject("list", categories);
		return view;
	}

	@RequestMapping("/category/{categoryName}")
	public ModelAndView navigator(@PathVariable String categoryName) {
		List<Item> items = itemService.findAll();
		Iterator<Item> it = items.iterator();
		while (it.hasNext()) {
			Item item = it.next();
			if (!item.getCategory().getName().equals(categoryName)) {
				it.remove();
			}
		}

		ModelAndView view = new ModelAndView();
		view.setViewName("/business/category");
		view.addObject("list", items);
		view.addObject("menu", "Home");
		view.addObject("active", categoryName);
		return view;
	}

	@RequestMapping("/signin")
	public ModelAndView login(
			@RequestParam(value = "messages", required = false) String messages) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/business/signin");
		if (messages != null && !messages.isEmpty()) {
			view.addObject("messages", messages);
		}
		return view;
	}

}
