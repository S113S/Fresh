package com.fresh.service.impl;

import com.fresh.dao.UserDao;
import com.fresh.entity.User;
import com.fresh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao dao;

	@Override
	public User getUserByMap(Map<String, Object> map) {
		return dao.getUserByMap(map);
	}

	@Override
	public int addUser(User user) {
		return dao.addUser(user);
	}

	@Override
	public List<User> getUsers() {
		return dao.getUsers();
	}

	@Override
	public List<User> getUsersByMap(Map<String, Object> map) {
		return dao.getUsersByMap(map);
	}

	@Override
	public int delUser(Map<String, Object> map) {
		return dao.delUser(map);
	}

	@Override
	public int sumCount(Map<String, Object> map) {
		return dao.sumCount(map);
	}

	@Override
	public int updateUser(User user) {
		return dao.updateUser(user);
	}
}
