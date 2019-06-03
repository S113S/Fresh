package com.fresh.dao;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Product;

public interface ProductDao {
	public Product getProduct(Map<String,Object> map);
	public List<Product> getProducts();
	public List<Product> getProductsByMap(Map<String,Object> map);
	public int sumCount(Map<String,Object> map);
	public int addProduct(Product product);
	public int delProduct(Map<String,Object> map);
	public int updateProduct(Product product);
}
