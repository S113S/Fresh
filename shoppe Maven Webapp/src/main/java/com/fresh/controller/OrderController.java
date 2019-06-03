package com.fresh.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fresh.entity.Car;
import com.fresh.entity.Order;
import com.fresh.service.CarService;
import com.fresh.service.OrderService;
import com.fresh.service.OrderitemService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderitemService orderitemService;
	@Autowired
	CarService carService;
	
	/**
	 * @Title: newOrder
	 * @Description: 
	 * @param: 订单添加页面
	 */
	@RequestMapping("/newOrder")
	public String newOrder(){
		return "newOrder";
	}
	
	/**
	 * @Title: isNewOrder
	 * @Description: 订单添加
	 * @param: 
	 */
	@RequestMapping("/isNewOrder")
	@ResponseBody
	public String isNewOrder(@RequestParam(value="uid",required=true)int uid,@RequestParam(value="total",required=true)int total,@RequestParam(value="status_id",required=true)int status_id,@RequestParam(value="uname",required=true)String uname,@RequestParam(value="uphone",required=true)String uphone,@RequestParam(value="address",required=true)String address,HttpSession session){
		System.out.println(uid);
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		Date date=new Date();
		
		String time=df1.format(date);
		int x=(int)(Math.random()*900)+100;
		String orderNum=df2.format(date)+x;
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("time", time);
		map.put("orderNum", orderNum);
		map.put("total", total);
		map.put("status_id", status_id);
		map.put("uname", uname);
		map.put("uphone", uphone);
		map.put("address", address);
		if(status_id==2){
			map.put("paytime", time);
		}
		orderService.addOrder(map);
		
		List<Car> carList=carService.getCarsByMap(map);
		for(Car c:carList){
			int pid=c.getProduct().getPid();
			int pnum=c.getNum();
			
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("uid", uid);
			map1.put("pid", pid);
			map1.put("pnum", pnum);
			map1.put("orderNum", orderNum);
			orderitemService.addOrderitem(map1);
		}
		
		carService.delByMap(map);
		int carNum=0;
		session.removeAttribute("carList");
		session.setAttribute("carNum",carNum);
		return "success";
	}
	
	/**
	 * @Title: orderCenter
	 * @Description: 订单信息页面
	 * @param: 
	 */
	@RequestMapping("/orderCenter")
	public String orderCenter(@RequestParam(value="uid",required=true)int uid,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		List<Order> orderList=orderService.getOrdersByMap(map);
		model.addAttribute("orderList", orderList);
		//System.out.println(orderList);
		return "orderCenter";
	}
	
	/**
	 * @Title: pay
	 * @Description: 
	 * @param: 支付
	 * @throws IOException 
	 */
	@RequestMapping("/pay")
	public void pay(@RequestParam(value="uid",required=true)int uid,@RequestParam(value="orderNum",required=true)String orderNum,HttpServletResponse response) throws IOException{
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Date date=new Date();
		String paytime=df1.format(date);
		int status_id=2;
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderNum", orderNum);
		map.put("status_id", status_id);
		map.put("paytime", paytime);
		System.out.println(orderNum);
		if(orderService.updateOrder(map)>0){
			response.sendRedirect("/shoppe/order/orderCenter?uid="+uid);
		}
	}
	
	
	/**
	 * @Title: delOrder
	 * @Description: 取消订单
	 * @param: 
	 * @throws IOException 
	 */
	@RequestMapping("/del")
	@ResponseBody
	public void del(@RequestParam(value="uid",required=true)int uid,@RequestParam(value="orderNum",required=true)String orderNum,HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderNum", orderNum);
		if(orderService.delOrder(map)>0){
			orderitemService.delOrderitem(map);
			response.sendRedirect("/shoppe/order/orderCenter?uid="+uid);
		}
	}
}
