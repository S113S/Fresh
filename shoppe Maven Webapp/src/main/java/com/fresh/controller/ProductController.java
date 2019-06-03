package com.fresh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fresh.entity.Page;
import com.fresh.entity.Product;
import com.fresh.entity.Word;
import com.fresh.service.ProductService;
import com.fresh.service.WordService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	WordService wordService;
	
	@RequestMapping("/productShow")
	public String productShow(Model model,Page page,@RequestParam(value="tid",required=true)int tid){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("tid", tid);
		
		int sum=productService.sumCount(map);
		page.endNum(sum);
		if(page.getStart()<0) page.setStart(0);
		else if(page.getStart()>page.getEnd()) page.setStart(page.getEnd());
		map.put("page",page);
		
		List<Product> plist=productService.getProductsByMap(map);
		model.addAttribute("plist", plist);
		model.addAttribute("tid", tid);
		return "productShow";
	}
	
	@RequestMapping("/productDetail")
	public String productDetail(Model model,@RequestParam(value="pid",required=true)int pid){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pid", pid);
		Product product=productService.getProduct(map);
		List<Word> wordList=wordService.getWordsByMap(map);
		model.addAttribute("product", product);
		model.addAttribute("wordList", wordList);
		return "product_detail";
	}
}
