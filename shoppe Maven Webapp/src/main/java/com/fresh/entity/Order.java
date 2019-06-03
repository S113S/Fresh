package com.fresh.entity;

import java.util.List;

public class Order {
	private int oid;
	private int uid;
	private String time;
	private String paytime;
	private String orderNum;
	private int total;
	private int status_id;
	private String uname;
	private String uphone;
	private String address;
	
	private Status status;
	private List<Orderitem> orderitems;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public List<Orderitem> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(List<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", uid=" + uid + ", time=" + time + ", paytime=" + paytime + ", orderNum="
				+ orderNum + ", total=" + total + ", status_id=" + status_id + ", uname=" + uname + ", uphone=" + uphone
				+ ", address=" + address + ", status=" + status + ", orderitems=" + orderitems + "]";
	}
}
