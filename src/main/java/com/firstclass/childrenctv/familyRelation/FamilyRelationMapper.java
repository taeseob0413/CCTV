package com.firstclass.childrenctv.familyRelation;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FamilyRelationMapper {
    void save(FamilyRelationVO relation);
    List<FamilyRelationVO> findRelationByChild(Long child_id);
    List<FamilyRelationVO> findRelationByUser(Long user_id);
    List<FamilyRelationVO> findRelationByUserAndChild(Long user_id, Long child_id);
    void approval(Long id);
    void delete(Long id);
    
    void insert(FamilyRelationVO family);     //아동 등록
}
