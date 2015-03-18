package com.pfyuit.restdocx.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pfyuit.restdocx.form.LoginForm;
import com.pfyuit.restdocx.service.CategoryService;
import com.pfyuit.restdocx.service.ItemService;
import com.pfyuit.restdocx.validate.BeanValidationService;

@Controller
public class LoginController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private BeanValidationService<LoginForm> beanValidationService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView save(LoginForm data) {

		// Bean validation, if failed, go back to "/signin.html"
		Set<ConstraintViolation<LoginForm>> violations = beanValidationService
				.validate(data);
		if (violations.size() > 0) {
			List<String> messages = new ArrayList<String>();
			for (ConstraintViolation<LoginForm> violation : violations) {
				messages.add(violation.getPropertyPath() + ": "
						+ violation.getMessage());
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/signin.html?messages=Invalid username or password");
			return mav;
		}

		// Login
		try {
			Subject subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(
					data.getUsername(), data.getPassword());
			subject.login(token);
		} catch (AuthenticationException e) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/signin.html?messages=Authentication failed。Pease try again");
			return mav;
		}

		// Go to "/result"
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/business/content");
		mav.addObject("active", "Home");
		mav.addObject("menu", "Home");
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/signin.html");
		return mav;
	}

}
