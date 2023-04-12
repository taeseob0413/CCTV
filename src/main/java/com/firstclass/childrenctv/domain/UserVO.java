package com.firstclass.childrenctv.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private Long user_id;
    private String user_email;
    private String user_loginID;
    private String user_password;
    private String user_address;
    private String user_gender;
    private String user_name;
    private int user_age;
    private String user_grade;

    public UserVO(Long user_id, String user_email, String user_loginID, String user_password, String user_address,
                  String user_gender, String user_name, int user_age, String user_grade) {
        this.user_id = user_id;
        this.user_email = user_email;
        this.user_loginID = user_loginID;
        this.user_password = user_password;
        this.user_address = user_address;
        this.user_gender = user_gender;
        this.user_name = user_name;
        this.user_age = user_age;
        this.user_grade = user_grade;
    }
}


