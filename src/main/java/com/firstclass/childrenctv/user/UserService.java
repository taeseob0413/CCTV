package com.firstclass.childrenctv.user;

import java.util.List;

public interface UserService {
	
    void signup(UserVO user);  //회원가입
    UserVO signIn(String loginid, String password);  //로그인
    String findId(String name, String email);  //아이디 찾기
    boolean findpass(String name, String email, String loginId);  //비밀번호 찾기
    void infoUpdate(UserVO user);  //회원 정보 수정
    void delete(long id);   //회원 탈퇴

    //List<ReportBoardVO> myReportList(Long id);
    List<UserVO> getAllUserList();
    //String registerNotice(String content);
    
    int idcheck(String loginid);   //아이디 중복체크
    String emailcheck(String email);  //이메일 인증     
    UserVO get(Long user_id);   //회원 상세 조회
    
 
}
