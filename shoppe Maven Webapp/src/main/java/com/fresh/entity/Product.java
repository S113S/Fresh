package com.fresh.entity;

public class Product {
	private int pid;
	private String pname;
	private String pdesc;
	private int price;
	private String pimage;
	private int tid;
	private Type type;
	private int pnum;
	private int rid;
	private Recommend recommend;
	private String pdeta;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Recommend getRecommend() {
		return recommend;
	}
	public void setRecommend(Recommend recommend) {
		this.recommend = recommend;
	}
	public String getPdeta() {
		return pdeta;
	}
	public void setPdeta(String pdeta) {
		this.pdeta = pdeta;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pdesc=" + pdesc + ", price=" + price + ", pimage="
				+ pimage + ", tid=" + tid + ", type=" + type + ", pnum=" + pnum + ", rid=" + rid + ", recommend="
				+ recommend + ", pdeta=" + pdeta + "]";
	}
}
