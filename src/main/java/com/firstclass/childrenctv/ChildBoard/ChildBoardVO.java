package com.firstclass.childrenctv.ChildBoard;


import lombok.Data;

@Data
public class ChildBoardVO {
	private Long child_id;
	private String child_location;
	private Long child_age;
	private String child_gender;
	private String child_name;
	private float child_height;
	private String child_time;
	private String child_feature;
	private String child_outfit;
	private String child_img;
	
	public String getChild_img() {
		return child_img;
	}
	public void setChild_img(String child_img) {
		this.child_img = child_img;
	}
	public String getChild_location() {
		return child_location;
	}
	public void setChild_location(String child_location) {
		this.child_location = child_location;
	}
	public Long getChild_age() {
		return child_age;
	}
	public void setChild_age(Long child_age) {
		this.child_age = child_age;
	}
	public String getChild_gender() {
		return child_gender;
	}
	public void setChild_gender(String child_gender) {
		this.child_gender = child_gender;
	}
	public String getChild_name() {
		return child_name;
	}
	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}
	public float getChild_height() {
		return child_height;
	}
	public void setChild_height(float child_height) {
		this.child_height = child_height;
	}
	public String getChild_time() {
		return child_time;
	}
	public void setChild_time(String child_time) {
		this.child_time = child_time;
	}
	public String getChild_feature() {
		return child_feature;
	}
	public void setChild_feature(String child_feature) {
		this.child_feature = child_feature;
	}
	public String getChild_outfit() {
		return child_outfit;
	}
	public void setChild_outfit(String child_outfit) {
		this.child_outfit = child_outfit;
	}
	
	
	
}
