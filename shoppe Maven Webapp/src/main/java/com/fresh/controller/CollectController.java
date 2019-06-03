package com.fresh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fresh.entity.Collect;
import com.fresh.service.CollectService;

@Controller
@RequestMapping("/collect")
public class CollectController {
	@Autowired
	CollectService collectService;
	
	@RequestMapping("/collectShow")
	public String collectShow(@RequestParam(value="uid",required=true)int uid,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid",uid);
		List<Collect> collectList=collectService.getCollectsByMap(map);
		model.addAttribute("collectList", collectList);

		return "collectShow";
	}
	
	@RequestMapping("/addCollect")
	@ResponseBody
	public String addCollect(@RequestParam(value="pid",required=true)int pid,@RequestParam(value="uid",required=true)int uid){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("pid",pid);
		if(collectService.addCollect(map)>0){
			return "success";
		}
		return "error";
	}
	
	@RequestMapping("/delCollect")
	@ResponseBody
	public String delCollect(@RequestParam(value="pid",required=true)int pid,@RequestParam(value="uid",required=true)int uid){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid",uid);
		map.put("pid",pid);
		if(collectService.delCollect(map)>0){
			return "success";
		}
		return "error";
	}
}
