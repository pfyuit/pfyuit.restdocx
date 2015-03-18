package com.pfyuit.restdocx.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Item implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String name;
	private String url;
	private String method;
	private String param;
	private String format;
	private String input;
	private String output;
	private String note;

	@ManyToOne(targetEntity = Category.class)
	@JoinColumn(name = "categoryName")
	private Category category;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
