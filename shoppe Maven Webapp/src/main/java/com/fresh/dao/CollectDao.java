package com.fresh.dao;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Collect;

public interface CollectDao {
	public List<Collect> getCollectsByMap(Map<String,Object> map);
	public int addCollect(Map<String,Object> map);
	public int delCollect(Map<String,Object> map);
}
