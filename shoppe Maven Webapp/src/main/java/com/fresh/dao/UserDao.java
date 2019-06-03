package com.fresh.dao;

import com.fresh.entity.User;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface UserDao {
	public User getUserByMap(Map<String, Object> map);
	public int addUser(User user);
	public List<User> getUsers();
	public List<User> getUsersByMap(Map<String, Object> map);
	public int delUser(Map<String, Object> map);
	public int sumCount(Map<String, Object> map);
	public int updateUser(User user);
}
