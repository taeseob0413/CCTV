package com.firstclass.childrenctv.paging;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
	private int pageNum; //페이지 번호
	private int amount; //한 페이지당 데이터 갯수
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,8);
	}
	public Criteria(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Criteria [type=" + type + "]";
	}
	public String[] getTypeArr() {
		return type==null?new String[] {} : type.split("");
	}
	
}
