package com.firstclass.childrenctv.ReportBoard;

import java.util.Date;

import lombok.Data;

@Data
public class ReportBoardVO {

	private Long report_id;		//제보 글 고유번호
	private Date report_time;		//제보 글 목격 시간
	private String report_address;		//제보 글 목격 위치
	private String report_content;		//제보 글 내용
	private Long user_id;	// 사용자 고유번호
	private Long child_id;	//실종아동 고유번호
	
	
	public ReportBoardVO() {
		
	}
	
	public ReportBoardVO(Long report_id, Date report_time, String report_address, String report_content, Long user_id, Long child_id) {
		this.report_id = report_id;
		this.report_time = report_time;
		this.report_address = report_address;
		this.report_content = report_content;
		this.user_id = user_id;
		this.child_id = child_id;
	}
	
	
}