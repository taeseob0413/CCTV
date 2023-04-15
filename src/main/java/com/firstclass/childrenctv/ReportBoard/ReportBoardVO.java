package com.firstclass.childrenctv.ReportBoard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportBoardVO {

	private Long report_id;		//제보 글 고유번호(DB에서 sequence로 처리)
	private Date report_time;		//제보 글 목격 시간
	private String report_address;		//제보 글 목격 위치
	private String report_content;		//제보 글 내용
	private Long user_id;	// 사용자 고유번호
	private String user_loginId;		// 사용자 로그인아이디
	private Long child_id;	//실종아동 고유번호
	
}