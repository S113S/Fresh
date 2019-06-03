package com.fresh.entity;

public class Orderitem {
	private int orderitem_id;
	private String orderNum;
	private int pid;
	private int pnum;
	private int uid;
	private Product product;
	public int getOrderitem_id() {
		return orderitem_id;
	}
	public void setOrderitem_id(int orderitem_id) {
		this.orderitem_id = orderitem_id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Orderitem [orderitem_id=" + orderitem_id + ", orderNum=" + orderNum + ", pid=" + pid + ", pnum=" + pnum
				+ ", uid=" + uid + ", product=" + product + "]";
	}
}
