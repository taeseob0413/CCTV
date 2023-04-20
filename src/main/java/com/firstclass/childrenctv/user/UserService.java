package com.firstclass.childrenctv.user;

import java.util.List;

public interface UserService {
    void signup(UserVO user);  //회원가입
    UserVO signIn(String loginid, String password);
    String findId(String name, String email);
    boolean findpass(String name, String email, String loginId);
    void infoUpdate(UserVO user);
    //List<ReportBoardVO> myReportList(Long id);
    List<UserVO> getAllUserList();
    //String registerNotice(String content);
    
    int idcheck(String loginid);   //아이디 중복체크
    String emailcheck(String email);  //이메일 인증 
}
