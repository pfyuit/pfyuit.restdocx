package com.pfyuit.restdocx.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Category implements Serializable, Comparable<Category> {

	private static final long serialVersionUID = 1L;

	@Id
	private String name;
	private String url;

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

	@Override
	public int compareTo(Category o) {
		return this.name.compareTo(o.getName());
	}

}
