package com.firstclass.childrenctv.util.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@JsonPropertyOrder({"code", "message", "result"})
public class BaseResponse<T> {
    private int code;
    private String message;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private T result;

    // 기본 생성자 막아둠
    private BaseResponse(){}

    public BaseResponse(T result){
        this.code = 200;
        this.message = "요청에 성공했습니다";
        this.result = result;
    }

    public BaseResponse(String msg, T result){
        this.code = 200;
        this.message = msg;
        this.result = result;
    }

    public BaseResponse(String msg){
        this.code = 1000;
        this.message = msg;
    }

    public BaseResponse(int code, String msg){
        this.code = code;
        this.message = msg;
    }
}
