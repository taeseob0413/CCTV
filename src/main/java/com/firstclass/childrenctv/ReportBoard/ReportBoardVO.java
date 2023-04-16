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
	public Long getReport_id() {
		return report_id;
	}
	public void setReport_id(Long report_id) {
		this.report_id = report_id;
	}
	public Date getReport_time() {
		return report_time;
	}
	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}
	public String getReport_address() {
		return report_address;
	}
	public void setReport_address(String report_address) {
		this.report_address = report_address;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public Long getChild_id() {
		return child_id;
	}
	public void setChild_id(Long child_id) {
		this.child_id = child_id;
	}
	
	
	
}