package com.fresh.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.CollectDao;
import com.fresh.entity.Collect;
import com.fresh.service.CollectService;

@Service
public class CollectServiceImpl implements CollectService {
	@Autowired
	CollectDao dao;

	@Override
	public List<Collect> getCollectsByMap(Map<String, Object> map) {
		return dao.getCollectsByMap(map);
	}

	@Override
	public int addCollect(Map<String, Object> map) {
		return dao.addCollect(map);
	}

	@Override
	public int delCollect(Map<String, Object> map) {
		return dao.delCollect(map);
	}
}
