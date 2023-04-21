package com.firstclass.childrenctv.familyRelation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class FamilyRelationServiceImpl implements FamilyRelationService{
    private final FamilyRelationMapper familyRelationMapper;
    @Override
    public boolean missingChildRegister(Long user_id, Long child_id) {
        FamilyRelationVO vo = new FamilyRelationVO(user_id, child_id, 1);
        try {
            familyRelationMapper.save(vo);
        }catch (Exception e){
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
    public boolean unregister(Long id) {
        try {
            familyRelationMapper.delete(id);
        }catch (Exception e){
            return false;
        }
        return true;
    }
}
