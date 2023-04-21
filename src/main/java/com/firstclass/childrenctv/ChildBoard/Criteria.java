package com.firstclass.childrenctv.ChildBoard;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	//생성자로 무조건 실행된다 1번은
	//기본 페이지를 1페이지에 10개씩 보여준다는 의미
	public Criteria() { this(1, 10);}

	//매개변수로 들어오는 값을 이용하여 조정 가능
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type==null?new String[] {} : type.split("");
	}
}
