package com.pfyuit.restdocx.dto;

import java.io.Serializable;

public class ResultDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private String cname;
	private String curl;
	private String name;
	private String url;
	private String method;
	private String param;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

}
