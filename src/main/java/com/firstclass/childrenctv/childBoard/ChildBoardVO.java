package com.firstclass.childrenctv.childBoard;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class ChildBoardVO {
	private long child_id;    //고유 아이디
	private String child_location;  //실종 장소
	private String child_curage; //현재 나이
	private String child_occage; //과거 나이
	private String child_gender; //아이 성별
	private String child_name;  //아동 나이
	private String child_time;  //실종 발생 날짜
	private String child_feature; //아이 특징
	private String child_outfit; //아이 불상
	private String child_img; //이미지 경로
}