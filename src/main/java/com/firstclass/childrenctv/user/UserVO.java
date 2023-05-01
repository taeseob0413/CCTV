package com.firstclass.childrenctv.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
public class UserVO {
    private Long user_id;
    private String user_name;
    private String user_email;
    private String user_loginID;
    private String user_password;
    private int user_age;
    private String user_gender;
    private String user_address;
    private String user_grade;
	
    @Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_loginID=" + user_loginID + ", user_password=" + user_password + ", user_age=" + user_age
				+ ", user_gender=" + user_gender + ", user_address=" + user_address + ", user_grade=" + user_grade
				+ "]";
	}
}
