package com.firstclass.childrenctv.protectBoard;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProtectBoardVO {

	private Long protect_id;		//보호 글 고유번호(DB에서 sequence로 처리)
	
	private String child_name; //아동 이름 
	private int child_age; //아동 현재 나이 
	private String child_gender; //아동 성별
	private String child_hometown;	//아동 연고지
	private String child_findlocation; //아동 목격지
	
	private LocalDateTime protect_time;		//보호 글 목격 시간
	private String protect_address;		//보호 위치
	private String protect_content;		//보호 글 내용
	
	private String user_phone;		//사용자 연락처
	private String user_loginId;		// 사용자 로그인아이디
	private Long child_id;	//실종아동 고유번호
	
	private String password;	//보호 글 비밀번호
	private int approval;		//관리자 승인 여부 (1 or 0)

}
