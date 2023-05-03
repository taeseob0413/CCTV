package com.firstclass.childrenctv.familyRelation;

import java.util.List;

import com.firstclass.childrenctv.ChildBoard.ChildBoardVO;

public interface FamilyRelationService {
    boolean missingChildRegister(Long user_id, Long child_id);
    List<FamilyRelationVO> findRelationByChild(Long child_id);
    List<FamilyRelationVO> findRelationByUser(Long user_id);
    boolean approval(Long id);
    //boolean unregister(Long id);
    
    List<ChildBoardVO> getChildrenByUser(Long user_id);

    void unregister(Long id);
}
