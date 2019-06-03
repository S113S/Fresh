package com.fresh.dao;

import java.util.Map;

import com.fresh.entity.Admin;

public interface AdminDao {
	public Admin getAdminByMap(Map<String,Object> map);
	public int addAdmin(Admin admin);
	public int updateAdmin(Admin admin);
}
