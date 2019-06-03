package com.fresh.service;

import java.util.Map;

import com.fresh.entity.Orderitem;

public interface OrderitemService {
	public int addOrderitem(Map<String,Object> map);
	public int delOrderitem(Map<String,Object> map);
	public Orderitem getOrderitemByMap(Map<String,Object> map);
}
