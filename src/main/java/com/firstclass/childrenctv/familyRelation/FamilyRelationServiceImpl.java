package com.firstclass.childrenctv.familyRelation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.childBoard.ChildBoardVO;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class FamilyRelationServiceImpl implements FamilyRelationService{
    private final FamilyRelationMapper familyRelationMapper;
    @Override
    public boolean missingChildRegister(Long user_id, Long child_id) {
        if(familyRelationMapper.findRelationByUserAndChild(user_id, child_id).size() > 0) return false;
        FamilyRelationVO vo = new FamilyRelationVO(user_id, child_id, 1);
        try {
            familyRelationMapper.save(vo);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public List<FamilyRelationVO> findRelationByChild(Long child_id) {
        List<FamilyRelationVO> relations;
        try {
            relations = familyRelationMapper.findRelationByChild(child_id);
        }catch (Exception e){
            return new ArrayList<>();
        }
        return relations;
    }

    @Override
    public List<FamilyRelationVO> findRelationByUser(Long user_id) {
        List<FamilyRelationVO> relations;
        try {
            relations = familyRelationMapper.findRelationByUser(user_id);
        }catch (Exception e){
            return new ArrayList<>();
        }
        return relations;
    }

    @Override
    public boolean approval(Long id) {
        try {
            familyRelationMapper.approval(id);
        }catch (Exception e){
            return false;
        }
        return true;
    }

	@Override
	public void unregister(Long id) {
		familyRelationMapper.delete(id);		
	}

	
	
   /* public boolean unregister(Long id) {
        try {
            familyRelationMapper.delete(id);
        }catch (Exception e){
            return false;
        }
        return true;
    }*/

    
	@Override
    public List<ChildBoardVO> getChildrenByUser(Long user_id) {
    	
    	List<ChildBoardVO> children;
        children = familyRelationMapper.getChildrenByUser(user_id);
        return children;
    }
    
}
