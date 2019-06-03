package com.fresh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fresh.entity.Car;
import com.fresh.entity.User;
import com.fresh.service.CarService;

@Controller
@RequestMapping("/car")
public class CarController {
	@Autowired
	CarService carService;
	
	/**
	 * @Title: add
	 * @Description: 添加购物车
	 * @param: 
	 */
	@RequestMapping("/add")
	@ResponseBody
	public String add(@RequestParam(value="pid",required=true)int pid,@RequestParam(value="uid",required=true)int uid,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("pid",pid);
		Car car=carService.getCarByMap(map);
		if(car!=null){	//存在这条购物车数据，更改num
			map.put("num", car.getNum()+1);
			carService.updateByMap(map);
		}else{	//不存在这条购物车数据，添加
			int num=1;
			map.put("num", num);
			carService.addByMap(map);
		}
		
		User user=(User) session.getAttribute("user");
		if(user != null){
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("uid",user.getUid());
			List<Car> carList=carService.getCarsByMap(map1);
			int carNum=carService.carNum(map1);
			session.setAttribute("carList", carList);
			session.setAttribute("carNum", carNum);
			System.out.println(carNum);
		}
		return "success";
	}
	
	/**
	 * @Title: del
	 * @Description: 删除购物车
	 * @param: 
	 */
	@RequestMapping("/del")
	@ResponseBody
	public String del(@RequestParam(value="pid",required=true)int pid,@RequestParam(value="uid",required=true)int uid,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("pid",pid);
		Car car=carService.getCarByMap(map);
		if(car.getNum()>1){	//这条购物车数据的num>1，num--
			map.put("num", car.getNum()-1);
			carService.updateByMap(map);
		}else if(car.getNum()==1){	//这条购物车数据的num=1，num--，添加
			carService.delByMap(map);
		}
		
		User user=(User) session.getAttribute("user");
		if(user != null){
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("uid",user.getUid());
			List<Car> carList=carService.getCarsByMap(map1);
			int carNum=carService.carNum(map1);
			session.setAttribute("carList", carList);
			session.setAttribute("carNum", carNum);
			System.out.println(carNum);
		}
		return "success";
	}
	
	@RequestMapping("/cart")
	public String cart(){
		return "cart";
	}
}
