package com.fresh.entity;

public class Recommend {
	private int rid;
	private String rname;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	@Override
	public String toString() {
		return "Recommend [rid=" + rid + ", rname=" + rname + "]";
	}
}
