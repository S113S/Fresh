package com.fresh.dao;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Order;
import com.fresh.entity.Page;

public interface OrderDao {
	public int addOrder(Map<String,Object> map);
	public List<Order> getOrdersByMap(Map<String,Object> map);
	public Order getOrderByMap(Map<String,Object> map);
	public int delOrder(Map<String,Object> map);
	public List<Order> getOrders(Page page);
	public int sumCount();
	public int updateOrder(Map<String,Object> map);
}
