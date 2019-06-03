package com.fresh.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.OrderitemDao;
import com.fresh.entity.Orderitem;
import com.fresh.service.OrderitemService;

@Service
public class OrderitemServiceImpl implements OrderitemService {
	@Autowired
	OrderitemDao dao;
	
	@Override
	public int addOrderitem(Map<String, Object> map) {
		return dao.addOrderitem(map);
	}

	@Override
	public int delOrderitem(Map<String, Object> map) {
		return dao.delOrderitem(map);
	}

	@Override
	public Orderitem getOrderitemByMap(Map<String, Object> map) {
		return dao.getOrderitemByMap(map);
	}

}
