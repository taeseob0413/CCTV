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
    private Integer user_age;
    private String user_gender;
    private String user_address;
    private String user_grade;
	
}
