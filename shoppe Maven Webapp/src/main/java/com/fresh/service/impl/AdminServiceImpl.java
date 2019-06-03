package com.fresh.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.AdminDao;
import com.fresh.entity.Admin;
import com.fresh.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;

	@Override
	public Admin getAdminByMap(Map<String, Object> map) {
		return dao.getAdminByMap(map);
	}

	@Override
	public int addAdmin(Admin admin) {
		return dao.addAdmin(admin);
	}

	@Override
	public int updateAdmin(Admin admin) {
		return dao.updateAdmin(admin);
	}
}
