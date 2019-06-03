package com.fresh.entity;

public class Status {
	private int status_id;
	private String statusName;
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	@Override
	public String toString() {
		return "Ostatus [status_id=" + status_id + ", statusName=" + statusName + "]";
	}
}
