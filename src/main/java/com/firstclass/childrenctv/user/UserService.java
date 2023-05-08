package com.firstclass.childrenctv.user;

import java.util.List;

public interface UserService {
	
    void signup(UserVO user);  //회원가입
    UserVO signIn(String loginid, String password);  //로그인
    String findId(String name, String email);  //아이디 찾기
    boolean findpass(String name, String email, String loginId);  //비밀번호 찾기
    void infoUpdate(UserVO user);  //회원 정보 수정
    void delete(UserVO user);   //회원 탈퇴
    int idcheck(String loginid);   //아이디 중복체크
    int pwcheck(UserVO user); //회원탈퇴시 비밀번호 체크
    String emailcheck(String email);  //이메일 인증
}
