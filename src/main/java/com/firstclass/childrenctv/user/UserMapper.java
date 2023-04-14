package com.firstclass.childrenctv.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    void create(UserVO userVO);
    public int insertSelectKey(UserVO userVO); 
    void delete(Long userId);
    void update(UserVO userVO);
    UserVO existUserByIdAndPassword(String loginId, String password);
    UserVO existUserByNameAndEmail(String name, String email);
    //List<ReportBoardVO> getReportList(Long id);
    List<UserVO> getAllUserList();
    String registerNotice(String content);
}
