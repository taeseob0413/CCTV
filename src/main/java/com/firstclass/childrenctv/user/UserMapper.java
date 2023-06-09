package com.firstclass.childrenctv.user;

import org.apache.ibatis.annotations.Mapper;
import com.firstclass.childrenctv.reportBoard.ReportBoardVO;

import java.util.List;

@Mapper
public interface UserMapper {
    void insert(UserVO userVO);    //회원 가입
    UserVO findById(Long id);
    public int insertSelectKey(UserVO userVO); 
    void delete(UserVO user);      //회원 탈퇴
    void infoUpdate(UserVO user);    //회원정보 수정
    UserVO existUserByIdAndPassword(String loginId, String password);   //비밀번호 찾기
    UserVO existUserByNameAndEmail(String name, String email);    //아이디 찾기
    List<ReportBoardVO> getReportList(Long id); //제보글
    List<UserVO> getAllUserList();
    String registerNotice(String content);  
    int idcheck(String loginId);   //아이디 중복체크
    UserVO get(Long user_id);      //회원 상세 조회
    int pwcheck(UserVO user);      //회원탈퇴시 패스워드 체크
}
