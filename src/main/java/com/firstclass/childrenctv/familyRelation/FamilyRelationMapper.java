package com.firstclass.childrenctv.familyRelation;

import org.apache.ibatis.annotations.Mapper;

import com.firstclass.childrenctv.childBoard.ChildBoardVO;

import java.util.List;

@Mapper
public interface FamilyRelationMapper {
    void save(FamilyRelationVO relation);
    List<FamilyRelationVO> findRelationByChild(Long child_id);
    List<FamilyRelationVO> findRelationByUser(Long user_id);
    void approval(Long id);
    //void delete(Long id);
    
    boolean delete(Long id);
    
    void insert(FamilyRelationVO family);     //아동 등록
}
