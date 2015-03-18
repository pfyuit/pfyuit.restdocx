package com.pfyuit.restdocx.service;

import com.pfyuit.restdocx.dto.ResultDto;

public interface CacheService {

	public abstract void set(String key, ResultDto result, int expireTime);

	public abstract void replace(String key, ResultDto result, int expireTime);

	public abstract ResultDto get(String key);

}