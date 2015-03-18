package com.pfyuit.restdocx.form;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.pfyuit.restdocx.validate.Format;
import com.pfyuit.restdocx.validate.Method;

public class ApiForm {

	@NotNull(message = "Category name can not be null")
	@NotEmpty(message = "Category name can not be null")
	private String cname;

	@NotNull(message = "Category URL can not be null")
	@NotEmpty(message = "Category URL can not be null")
	// @URL(message = "Category URL is invalid")
	private String curl;

	@NotNull(message = "API name can not be null")
	@NotEmpty(message = "API name can not be null")
	private String name;

	@NotNull(message = "API url can not be null")
	@NotEmpty(message = "API url can not be null")
	// @URL(message = "API URL is invalid")
	private String url;

	@NotNull
	@NotEmpty
	@Method
	private String method;

	private String param;

	@NotNull
	@NotEmpty
	@Format
	private String format;

	private String input;
	private String output;
	private String note;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCurl() {
		return curl;
	}

	public void setCurl(String curl) {
		this.curl = curl;
	}

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

}
