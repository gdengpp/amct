package com.amct.util;

import java.util.Set;

import org.junit.Test;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtil {
	private static JedisPool jedisPool;
	static {
		JedisPoolConfig config = new JedisPoolConfig();
		// 设置最大连接数
		config.setMaxTotal(20);

		// 设置连接时长
		config.setMaxWaitMillis(5000);

		// 设置最大存活数
		config.setMaxIdle(10);
		
		jedisPool = new JedisPool(config, "192.168.202.141", 6379);
	
	}

	public static Jedis getJedis() {

		Jedis jedis = jedisPool.getResource();

		return jedis;
	}

	public static void closeJedis(Jedis jedis) {

		jedis.close();
		
	}

	@Test
	public void test() {
		Jedis jedis = getJedis();

		jedis.select(1);

		jedis.zadd("down", 1, "01");
		jedis.zadd("down", 5, "02");
		jedis.zadd("down", 7, "03");
		jedis.zadd("down", 2, "05");
		
		Set<String> zrange = jedis.zrange("down", 0, -1);
		for (String key : zrange) {
			System.out.println(key);
			Double zscore = jedis.zscore("down", key);
			System.out.println(zscore);
		}
		//closeJedis(jedis);

	}
}
