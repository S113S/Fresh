package com.fresh.service;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Product;

public interface ProductService {
	public Product getProduct(Map<String,Object> map);
	public List<Product> getProducts();
	public List<Product> getProductsByMap(Map<String,Object> map);
	public int sumCount(Map<String,Object> map);
	public int addProduct(Product product);
	public int delProduct(Map<String,Object> map);
	public int updateProduct(Product product);
}
