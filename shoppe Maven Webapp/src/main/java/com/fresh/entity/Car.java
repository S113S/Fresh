package com.fresh.entity;

public class Car {
	private int cid;
	private int uid;
	private int pid;
	private int num;	//同一产品的数量
	private User user;
	private Product product;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Car [cid=" + cid + ", uid=" + uid + ", pid=" + pid + ", num=" + num + ", user=" + user + ", product="
				+ product + "]";
	}
}
