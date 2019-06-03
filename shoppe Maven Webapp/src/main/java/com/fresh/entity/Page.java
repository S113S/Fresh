package com.fresh.entity;

public class Page {
	private int start=0;
	private int count=8;
	private int end;
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public void endNum(int sum){
		if(sum%count==0)
			end=sum-count;
		else
			end=sum-sum%count;
	}
	
	@Override
	public String toString() {
		return "Page [start=" + start + ", count=" + count + ", end=" + end + "]";
	}
}
