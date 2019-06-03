package com.fresh.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fresh.entity.Car;
import com.fresh.entity.UploadImageFile;
import com.fresh.entity.User;
import com.fresh.service.CarService;
import com.fresh.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	CarService carService;
	
	/**
	 * @Title: login
	 * @Description: 登录页面
	 * @param: 
	 */
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	/**
	 * @Title: register
	 * @Description: 注册页面
	 * @param: 
	 */
	@RequestMapping("/register")
	public String register(){
		return "register";
	}

	/**
	 * @Title: isLogin
	 * @Description: 登录检验
	 * @param: 
	 */
	@RequestMapping("/isLogin")
	public String isLogin(@RequestParam(value="uphone",required=false,defaultValue="")String uphone, @RequestParam(value="upwd",required=false,defaultValue="")String upwd, HttpSession session, HttpServletResponse response,Model model) throws IOException {
		if(uphone.isEmpty()){
			model.addAttribute("msg","账号不为空！");
			return "login";
		}else if(upwd.isEmpty()){
			model.addAttribute("msg","密码不为空！");
			return "login";
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uphone",uphone);
		map.put("upwd",upwd);
		User user=userService.getUserByMap(map);
		if(user!=null) {
			session.setAttribute("user", user);
			
			Map<String,Object> map2=new HashMap<String,Object>();
			map2.put("uid",user.getUid());
			List<Car> carList=carService.getCarsByMap(map2);
			int carNum=carService.carNum(map2);
			session.setAttribute("carList", carList);
			session.setAttribute("carNum", carNum);
			
			response.sendRedirect("/shoppe/home/index");
		}else{
			model.addAttribute("msg","用户不存在或密码错误！");
			return "login";
		}
		return "login";
	}

	/**
	 * @Title: addUser
	 * @Description: 注册
	 * @param: 
	 */
	@RequestMapping("/isRegister")
	public String isRegister(User user,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
		if(user.getUphone().isEmpty()){
			model.addAttribute("msg","账号不为空！");
			return "register";
		}else if(user.getUname().isEmpty()){
			model.addAttribute("msg","昵称不为空！");
			return "register";
		}else if(user.getUpwd().isEmpty()){
			model.addAttribute("msg","密码不为空！");
			return "register";
		}
		
		if(userService.addUser(user)>0){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("uphone",user.getUphone());
			map.put("upwd",user.getUpwd());
			User user2=userService.getUserByMap(map);
			request.getSession(true).setAttribute("user",user2);
			response.sendRedirect("/shoppe/home/index");
		}
		return "register";
	}
	
	/**
	 * @Title: outLogin
	 * @Description: 退出登录
	 * @param: 
	 */
	@RequestMapping("/outLogin")
	public void outLogin(HttpSession session,HttpServletResponse response) throws IOException{
		session.removeAttribute("user");
		session.removeAttribute("carList");
		session.removeAttribute("carNum");
		response.sendRedirect("/shoppe/home/index");
	}
	
	/**
	 * @Title: infoCenter
	 * @Description: 信息中心页面
	 * @param: 
	 */
	@RequestMapping("/infoCenter")
	public String infoCenter(@RequestParam(value="uid",required=true)int uid,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		User user=userService.getUserByMap(map);
		request.getSession(true).setAttribute("user",user);
		return "infoCenter";
	}
	
	/**
	 * @Title: isInfoCenter
	 * @Description: 个人信息修改
	 * @param: 
	 */
	@RequestMapping("/isInfoCenter")
	public void isInfoCenter(User user,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
			String newFileName = name + ".jpg";
			File newFile = new File(request.getServletContext().getRealPath("/images/user"), newFileName);
			        
			newFile.getParentFile().mkdirs();
			file.getImage().transferTo(newFile);
			user.setUimage(newFileName);
		}
		
		if(userService.updateUser(user)>0){
			response.sendRedirect("/shoppe/user/infoCenter?uid="+user.getUid());
		}
	}
}
