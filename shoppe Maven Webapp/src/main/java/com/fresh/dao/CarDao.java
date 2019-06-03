package com.fresh.dao;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Car;

public interface CarDao {
	public List<Car> getCarsByMap(Map<String,Object> map);
	public Car getCarByMap(Map<String,Object> map);
	public int updateByMap(Map<String,Object> map);
	public int addByMap(Map<String,Object> map);
	public int delByMap(Map<String,Object> map);
	public int carNum(Map<String,Object> map);
}
