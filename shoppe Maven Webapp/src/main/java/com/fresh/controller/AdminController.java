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

import com.fresh.entity.Admin;
import com.fresh.entity.Order;
import com.fresh.entity.Page;
import com.fresh.entity.Product;
import com.fresh.entity.UploadImageFile;
import com.fresh.entity.User;
import com.fresh.service.AdminService;
import com.fresh.service.CarService;
import com.fresh.service.CollectService;
import com.fresh.service.OrderService;
import com.fresh.service.OrderitemService;
import com.fresh.service.ProductService;
import com.fresh.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	CarService carService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderitemService orderitemService;
	@Autowired
	CollectService collectService;
	
	/**
	 * @Title: index
	 * @Description: 管理主页
	 * @param: 
	 * @throws IOException 
	 */
	@RequestMapping("/index")
	public String index(HttpSession session,HttpServletResponse response) throws IOException{
		if(session.getAttribute("admin")==null){
			response.sendRedirect("/shoppe/admin/adminLogin");
		}
		return "manage/index";
	}
	
	/**
	 * @Title: adminLogin
	 * @Description: 管理员登录界面
	 * @param: 
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(){
		return "manage/adminLogin";
	}
	
	/**
	 * @Title: adminRegister
	 * @Description: 管理员注册页面
	 * @param: 
	 */
	@RequestMapping("/adminRegister")
	public String adminRegister(){
		return "manage/adminRegister";
	}
	
	/**
	 * @Title: isAdminLogin
	 * @Description: 管理员登录验证
	 * @param: 
	 */
	@RequestMapping("/isAdminLogin")
	public void isAdminLogin(@RequestParam(value="phone")String phone, @RequestParam(value="pwd")String pwd, HttpSession session, HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("phone",phone);
		map.put("pwd",pwd);
		Admin admin=adminService.getAdminByMap(map);
		if(admin!=null) {
			session.setAttribute("admin", admin);
			//System.out.print(admin);
			response.sendRedirect("/shoppe/admin/index");
		}else{
			response.sendRedirect("/shoppe/admin/adminLogin");
		}
	}
	
	/**
	 * @Title: isAdminRegister
	 * @Description: 管理员注册
	 * @param: 
	 */
	@RequestMapping("/isAdminRegister")
	public void isAdminRegister(Admin admin,HttpSession session,HttpServletResponse response) throws IOException{
		if(adminService.addAdmin(admin)>0){
			session.setAttribute("admin",admin);
			response.sendRedirect("/shoppe/admin/index");
		}
	}
	
	/**
	 * @Title: user_list
	 * @Description: 用户列表
	 * @param: 
	 */
	@RequestMapping("/user_list")
	public String user_list(Model model,Page page){
		Map<String,Object> map=new HashMap<String,Object>();
		int sum=userService.sumCount(map);
		page.endNum(sum);
		
		if(page.getStart()<0) page.setStart(0);
		else if(page.getStart()>page.getEnd()) page.setStart(page.getEnd());
		map.put("page",page);
		
		List<User> userList=userService.getUsersByMap(map);
		model.addAttribute("userList", userList);
		//System.out.print(userList);
		return "manage/user_list";
	}
	
	/**
	 * @Title: isAdd_user
	 * @Description: 用户添加
	 * @param: 
	 */
	@RequestMapping("/isAdd_user")
	public void isAdd_user(User user,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println(user);
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
	        String newFileName = name + ".jpg";
	        File newFile = new File(request.getServletContext().getRealPath("/images/user"), newFileName);
	        
	        //System.out.println(request.getServletContext().getRealPath("/images/user"));
	        //System.out.println(request.getContextPath()+"/images/said");
	        
	        newFile.getParentFile().mkdirs();
	        file.getImage().transferTo(newFile);
			user.setUimage(newFileName);
		}
		
		if(userService.addUser(user)>0){
			response.sendRedirect("/shoppe/admin/user_list");
		}
	}
	
	/**
	 * @Title: del_user
	 * @Description: 用户删除
	 * @param: 
	 */
	@RequestMapping("/del_user")
	public void del_user(@RequestParam(value="uid",required=true)int uid,HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		if(userService.delUser(map)>0){
			carService.delByMap(map);
			orderService.delOrder(map);
			collectService.delCollect(map);
			response.sendRedirect("/shoppe/admin/user_list");
		}
	}
	
	/**
	 * @Title: isEdit_user
	 * @Description: 用户修改
	 * @param: 
	 * @throws IOException 
	 */
	@RequestMapping("/isEdit_user")
	public void isEdit_user(User user,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println(file);
		//System.out.println(request.getAttribute("image"));
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
			String newFileName = name + ".jpg";
			File newFile = new File(request.getServletContext().getRealPath("/images/user"), newFileName);
			        
			newFile.getParentFile().mkdirs();
			file.getImage().transferTo(newFile);
			user.setUimage(newFileName);
		}
		
		if(userService.updateUser(user)>0){
			response.sendRedirect("/shoppe/admin/user_list");
		}
	}
	
	/**
	 * @Title: product_list
	 * @Description: 商品列表
	 * @param: 
	 */
	@RequestMapping("/product_list")
	public String product_list(Model model,Page page){
		Map<String,Object> map=new HashMap<String,Object>();
		int sum=productService.sumCount(map);
		page.endNum(sum);
		
		if(page.getStart()<0) page.setStart(0);
		else if(page.getStart()>page.getEnd()) page.setStart(page.getEnd());
		map.put("page",page);
		
		List<Product> productList=productService.getProductsByMap(map);
		model.addAttribute("productList", productList);
		return "manage/product_list";
	}
	
	/**
	 * @Title: isAdd_product
	 * @Description: 
	 * @param: 商品添加
	 * @throws IOException 
	 */
	@RequestMapping("/isAdd_product")
	public void add_product(Product product,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println(product);
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
	        String newFileName = name + ".jpg";
	        File newFile = new File(request.getServletContext().getRealPath("/images/product"), newFileName);
	        
	        newFile.getParentFile().mkdirs();
	        file.getImage().transferTo(newFile);
			product.setPimage(newFileName);
		}
		
		if(productService.addProduct(product)>0){
			response.sendRedirect("/shoppe/admin/product_list");
		}
	}
	
	/**
	 * @Title: del_product
	 * @Description: 商品删除
	 * @param: 
	 */
	@RequestMapping("/del_product")
	public void del_product(@RequestParam(value="pid",required=true)int pid,HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pid", pid);
		if(productService.delProduct(map)>0){
			carService.delByMap(map);
			collectService.delCollect(map);
			response.sendRedirect("/shoppe/admin/product_list");
		}
	}
	
	/**
	 * @Title: isEdit_product
	 * @Description: 商品修改
	 * @param: 
	 * @throws IOException 
	 */
	@RequestMapping("/isEdit_product")
	public void isEdit_product(Product product,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println(product);
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
			String newFileName = name + ".jpg";
			File newFile = new File(request.getServletContext().getRealPath("/images/product"), newFileName);
			        
			newFile.getParentFile().mkdirs();
			file.getImage().transferTo(newFile);
			product.setPimage(newFileName);
		}
				
		if(productService.addProduct(product)>0){
			response.sendRedirect("/shoppe/admin/product_list");
		}
	}
	
	/**
	 * @Title: del_order
	 * @Description: 订单删除
	 * @param: 
	 */
	@RequestMapping("/del_order")
	public void del_order(@RequestParam(value="orderNum",required=true)String orderNum,HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderNum", orderNum);
		if(orderService.delOrder(map)>0){
			orderitemService.delOrderitem(map);
			response.sendRedirect("/shoppe/admin/order_list");
		}
	}
	
	/**
	 * @Title: add_product
	 * @Description: 商品添加页面
	 * @param: 
	 */
	@RequestMapping("/add_product")
	public String add_product(){
		return "manage/add_product";
	}
	
	/**
	 * @Title: add_user
	 * @Description: 
	 * @param: 用户添加页面
	 */
	@RequestMapping("/add_user")
	public String add_user(){
		return "manage/add_user";
	}
	
	/**
	 * @Title: edit_user
	 * @Description: 
	 * @param: 用户修改页面
	 */
	@RequestMapping("edit_user")
	public String edit_user(@RequestParam(value="uid",required=true)int uid,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		User editUser=userService.getUserByMap(map);
		model.addAttribute("editUser", editUser);
		return "manage/edit_user";
	}
	
	/**
	 * @Title: edit_product
	 * @Description: 商品修改页面
	 * @param: 
	 */
	@RequestMapping("edit_product")
	public String edit_product(@RequestParam(value="pid",required=true)int pid,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pid", pid);
		Product editProduct=productService.getProduct(map);
		model.addAttribute("editProduct", editProduct);
		return "manage/edit_product";
	}
	
	/**
	 * @Title: order_list
	 * @Description: 订单列表页面
	 * @param: 
	 */
	@RequestMapping("/order_list")
	public String order_list(Model model,Page page){
		int sum=orderService.sumCount();
		page.endNum(sum);
		if(page.getStart()<0) page.setStart(0);
		else if(page.getStart()>page.getEnd()) page.setStart(page.getEnd());
		
		List<Order> orderList=orderService.getOrders(page);
		model.addAttribute("orderList", orderList);
		return "manage/order_list";
	}
	
	/**
	 * @Title: order_detail
	 * @Description: 订单详情页面
	 * @param: 
	 */
	@RequestMapping("/order_detail")
	public String order_detail(@RequestParam(value="orderNum",required=true)String orderNum,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderNum", orderNum);
		Order order=orderService.getOrderByMap(map);
		model.addAttribute("order", order);
		return "manage/order_detail";
	}
	
	@RequestMapping("/top")
	public String top(){
		return "manage/top";
	}
	
	@RequestMapping("/menu")
	public String menu(){
		return "manage/menu";
	}
	
	@RequestMapping("/main")
	public String main(Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		model.addAttribute("ordersum", orderService.sumCount());
		model.addAttribute("productsum", productService.sumCount(map));
		model.addAttribute("usersum", userService.sumCount(map));
		return "manage/main";
	}
	
	@RequestMapping("/bar")
	public String bar(){
		return "manage/bar";
	}
	
	/**
	 * @Title: edit_admin
	 * @Description: 管理员信息页面
	 * @param: 
	 */
	@RequestMapping("/edit_admin")
	public String edit_admin(@RequestParam(value="aid",required=true)int aid,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("aid", aid);
		Admin admin=adminService.getAdminByMap(map);
		session.setAttribute("admin", admin);
		return "manage/edit_admin";
	}
	
	/**
	 * @Title: isEdit_admin
	 * @Description: 管理员信息修改
	 * @param: 
	 */
	@RequestMapping("/isEdit_admin")
	public void isEdit_admin(Admin admin,UploadImageFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(StringUtils.isNotBlank(file.getImage().getOriginalFilename())){
			String name = RandomStringUtils.randomAlphanumeric(10);
			String newFileName = name + ".jpg";
			File newFile = new File(request.getServletContext().getRealPath("/images/admin"), newFileName);
			        
			newFile.getParentFile().mkdirs();
			file.getImage().transferTo(newFile);
			admin.setAimage(newFileName);
		}
		
		if(adminService.updateAdmin(admin)>0){
			response.sendRedirect("/shoppe/admin/edit_admin?aid="+admin.getAid());
		}
	}
}
