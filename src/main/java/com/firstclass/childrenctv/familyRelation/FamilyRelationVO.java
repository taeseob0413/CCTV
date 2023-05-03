package com.firstclass.childrenctv.familyRelation;

/*import com.firstclass.childrenctv.childBoard.ChildBoardVO;*/

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FamilyRelationVO {
    private Long id;
    private Long user_id;
    private Long childBoard_id;
    private int approval;
	/* private ChildBoardVO child; */
    private String child_name;  //아동 이름

    public FamilyRelationVO(Long user_id, Long childBoard_id, int approval) {
        this.user_id = user_id;
        this.childBoard_id = childBoard_id;
        
      //  this.child_name = child_name;
        
        this.approval = approval;
        
    }
}
