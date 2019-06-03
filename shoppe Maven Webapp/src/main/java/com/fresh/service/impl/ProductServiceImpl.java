package com.fresh.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.ProductDao;
import com.fresh.entity.Product;
import com.fresh.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	@Override
	public List<Product> getProducts() {
		return dao.getProducts();
	}

	@Override
	public List<Product> getProductsByMap(Map<String, Object> map) {
		return dao.getProductsByMap(map);
	}

	@Override
	public int sumCount(Map<String, Object> map) {
		return dao.sumCount(map);
	}

	@Override
	public Product getProduct(Map<String, Object> map) {
		return dao.getProduct(map);
	}

	@Override
	public int addProduct(Product product) {
		return dao.addProduct(product);
	}

	@Override
	public int delProduct(Map<String, Object> map) {
		return dao.delProduct(map);
	}

	@Override
	public int updateProduct(Product product) {
		return dao.updateProduct(product);
	}

}
