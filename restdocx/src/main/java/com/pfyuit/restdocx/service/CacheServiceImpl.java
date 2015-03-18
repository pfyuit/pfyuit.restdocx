package com.pfyuit.restdocx.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pfyuit.restdocx.dto.ResultDto;
import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;

@Service
public class CacheServiceImpl implements CacheService {

	@Autowired
	private MemCachedClient memcachedClient;

	@Override
	public void set(String key, ResultDto result, int expireTime) {
		memcachedClient.set(key, result, new Date(expireTime));
	}

	@Override
	public void replace(String key, ResultDto result, int expireTime) {
		memcachedClient.replace(key, result, new Date(expireTime));
	}

	@Override
	public ResultDto get(String key) {
		ResultDto result = (ResultDto) memcachedClient.get(key);
		return result;
	}

	public static void main(String[] args) {
		SockIOPool pool = SockIOPool.getInstance("pool");

		pool.setServers(new String[] { "localhost:11211" });
		pool.setWeights(new Integer[] { 5 });

		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(6 * 3600 * 1000);

		pool.setMaintSleep(3000);
		pool.setNagle(false);

		pool.setSocketTO(3000);
		pool.setSocketConnectTO(0);

		pool.initialize();

		MemCachedClient client = new MemCachedClient("pool");

		client.set("k", "v");
		System.out.println(client.get("k"));
	}

}