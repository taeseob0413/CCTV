package com.firstclass.childrenctv.familyRelation;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class FamilyRelationVO {
    private Long id;
    private Long user_id;
    private Long childBoard_id;
    private int approval;
}
