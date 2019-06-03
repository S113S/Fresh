package com.fresh.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fresh.service.OrderitemService;
import com.fresh.service.WordService;

@Controller
@RequestMapping("/word")
public class WordController {
	@Autowired
	WordService wordService;
	@Autowired
	OrderitemService orderitemService;
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(@RequestParam(value="uid",required=true)int uid,@RequestParam(value="pid",required=true)int pid,@RequestParam(value="content",required=true)String content){
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");//设置日期格式
		Date date=new Date();
		String time=df.format(date);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pid", pid);
		map.put("time", time);
		map.put("content", content);
		if(orderitemService.getOrderitemByMap(map)!=null){
			if(wordService.addWord(map)>0){
				return "success";
			}
		}
		return "error";
	}
}
