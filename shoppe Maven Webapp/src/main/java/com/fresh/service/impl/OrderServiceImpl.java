package com.fresh.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.OrderDao;
import com.fresh.entity.Order;
import com.fresh.entity.Page;
import com.fresh.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDao dao;

	@Override
	public int addOrder(Map<String, Object> map) {
		return dao.addOrder(map);
	}

	@Override
	public List<Order> getOrdersByMap(Map<String, Object> map) {
		return dao.getOrdersByMap(map);
	}

	@Override
	public Order getOrderByMap(Map<String, Object> map) {
		return dao.getOrderByMap(map);
	}

	@Override
	public int delOrder(Map<String, Object> map) {
		return dao.delOrder(map);
	}

	@Override
	public List<Order> getOrders(Page page) {
		return dao.getOrders(page);
	}

	@Override
	public int sumCount() {
		return dao.sumCount();
	}

	@Override
	public int updateOrder(Map<String, Object> map) {
		return dao.updateOrder(map);
	}
}
