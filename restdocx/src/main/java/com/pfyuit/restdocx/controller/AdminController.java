package com.pfyuit.restdocx.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pfyuit.restdocx.dto.ResultDto;
import com.pfyuit.restdocx.form.ApiForm;
import com.pfyuit.restdocx.model.Category;
import com.pfyuit.restdocx.model.Item;
import com.pfyuit.restdocx.service.CategoryService;
import com.pfyuit.restdocx.service.ItemService;
import com.pfyuit.restdocx.validate.BeanValidationService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private BeanValidationService<ApiForm> beanValidationService;

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(ApiForm data) {

		Subject subject = SecurityUtils.getSubject();
		subject.checkPermission("resource:item:add");

		// Bean validation, if failed, go back to "/admin"
		Set<ConstraintViolation<ApiForm>> violations = beanValidationService
				.validate(data);
		if (violations.size() > 0) {
			List<String> messages = new ArrayList<String>();
			for (ConstraintViolation<ApiForm> violation : violations) {
				messages.add(violation.getPropertyPath() + ": "
						+ violation.getMessage());
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/business/admin");
			mav.addObject("menu", "Admin");
			mav.addObject("active", "Home");
			mav.addObject("messages", messages);
			return mav;
		}

		// Save Category and Item to database
		Category category = new Category();
		category.setName(data.getCname());
		category.setUrl(data.getCurl());

		Item item = new Item();
		item.setName(data.getName());
		item.setUrl(data.getUrl());
		item.setParam(data.getParam());
		item.setMethod(data.getMethod());
		item.setFormat(data.getFormat());
		item.setInput(data.getInput());
		item.setOutput(data.getOutput());
		item.setNote(data.getNote());

		item.setCategory(category);

		categoryService.save(category);
		itemService.save(item);

		// Go to "/result"
		ModelAndView mav = new ModelAndView();
		ResultDto result = itemService.getResult(data.getName());
		mav.setViewName("/business/result");
		mav.addObject("result", result);
		mav.addObject("menu", "Home");
		mav.addObject("active", data.getCname());
		mav.addObject("messages",
				Arrays.asList(new String[] { "Saved successfully!" }));
		return mav;
	}

}
