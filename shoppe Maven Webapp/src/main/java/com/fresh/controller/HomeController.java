package com.fresh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fresh.service.CarService;
import com.fresh.service.ProductService;

@Controller
@RequestMapping("/home")
public class HomeController {
	@Autowired
	ProductService productService;
	@Autowired
	CarService carService;
	
	@RequestMapping("/index")
	public String index(Model model){
		int tid=1;
		model.addAttribute("tid", tid);
		
		return "index";
	}
	
	@RequestMapping("/about")
	public String about(){
		return "about";
	}
}
