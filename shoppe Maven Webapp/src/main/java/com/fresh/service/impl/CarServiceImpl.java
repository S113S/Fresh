package com.fresh.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.CarDao;
import com.fresh.entity.Car;
import com.fresh.service.CarService;

@Service
public class CarServiceImpl implements CarService {
	@Autowired
	CarDao dao;
	
	@Override
	public List<Car> getCarsByMap(Map<String, Object> map) {
		return dao.getCarsByMap(map);
	}

	@Override
	public Car getCarByMap(Map<String, Object> map) {
		return dao.getCarByMap(map);
	}
	
	@Override
	public int updateByMap(Map<String, Object> map) {
		return dao.updateByMap(map);
	}

	@Override
	public int addByMap(Map<String, Object> map) {
		return dao.addByMap(map);
	}

	@Override
	public int delByMap(Map<String, Object> map) {
		return dao.delByMap(map);
	}

	@Override
	public int carNum(Map<String, Object> map) {
		return dao.carNum(map);
	}
}
